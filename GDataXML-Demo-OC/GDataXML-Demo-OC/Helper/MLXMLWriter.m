//
//  MLXMLWriter.m
//  GDataXML-Demo-OC
//
//  Created by MountainX on 2020/3/10.
//  Copyright © 2020 MTX Software Technology Co.,Ltd. All rights reserved.
//

#import "MLXMLWriter.h"
#import <GDataXMLNode_iOS/GDataXMLNode.h>
#import "Party.h"
#import "Player.h"

#import <KissXML/KissXML.h>

@implementation MLXMLWriter

+ (void)writeXMLDemo {
    NSLog(@"%s", __func__);
    Party *party = [[Party alloc] init];
    for (NSInteger i = 0; i < arc4random() % 10 + 3; i ++) {
        Player *player = [[Player alloc] initWithName:[NSString stringWithFormat:@"player_%ld", i+1] level:arc4random()%10 rpgClass:arc4random() % 3];
        [party.players addObject:player];
    }
    [self saveParty:party];
}

+ (void)saveParty:(Party *)aParty {
    GDataXMLElement *partyElement = [GDataXMLElement elementWithName:@"Party"];
    //添加属性
    [partyElement addAttribute:[GDataXMLNode elementWithName:@"attribute" stringValue:@"party's attribute"]];
    //添加命名空间
    [partyElement addNamespace:[GDataXMLNode namespaceWithName:@"namespace" stringValue:@"http://www.baidu.com"]];
    //添加缺省命名空间
    [partyElement addNamespace:[GDataXMLNode namespaceWithName:@"" stringValue:@"http://www.google.com/hk"]];
    for (Player *player in aParty.players) {
        GDataXMLElement *playerElement = [GDataXMLNode elementWithName:@"Player"];   // 创建元素
        GDataXMLElement *nameElement = [GDataXMLNode elementWithName:@"Name" stringValue:player.name];
        GDataXMLElement *levelElement = [GDataXMLNode elementWithName:@"Level" stringValue:[NSString stringWithFormat:@"%d", player.level]];
        NSString *rpgClass = nil;
        
        if (player.rpgClass == RPGClassFighter) {
            rpgClass = @"Fighter";
        } else if (player.rpgClass == RPGClassRogue) {
            rpgClass = @"Rogue";
        }else if (player.rpgClass == RPGClassWizard) {
            rpgClass = @"Wizard";
        }
        GDataXMLElement *rpgClassElement = [GDataXMLNode elementWithName:@"Class" stringValue:rpgClass];
        [playerElement addChild:nameElement];       // 给player添加name元素
        [playerElement addChild:levelElement];      // 给player添加level元素
        [playerElement addChild:rpgClassElement];   // 给player添加rpgClass元素
        [partyElement addChild:playerElement];      // 给party添加player元素
        
        NSString *cdataValue = @"You will see this in the document and can use reserved characters like < > & \"\"";
        GDataXMLElement *cdataEle = [[GDataXMLElement alloc] initWithName:@"TEST" cdataStringValue:cdataValue];
        [partyElement addChild:cdataEle];
    }
    
//    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithRootElement:partyElement];
//    [doc setCharacterEncoding:@"UTF-8"];
//    NSData *xmlData = [doc XMLData];
    
    //支持自动换行
    NSLog(@"XMLString:\n%@", partyElement.XMLString);
    NSLog(@"XMLString_Pretty:\n%@", partyElement.XMLString_Pretty);
    
    NSString *xmlStr = [@"<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n" stringByAppendingString:partyElement.XMLString_Pretty];
    NSData *xmlData = [xmlStr dataUsingEncoding:NSUTF8StringEncoding];
    
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"party.xml"];
    [xmlData writeToFile:filePath atomically:YES];
}

+ (void)writeXMLDemoUsingKissXML {
    NSLog(@"%s", __func__);
    DDXMLElement *peopleElement = [DDXMLElement elementWithName:@"PEOPLE"];
    DDXMLNode *peopleID = [DDXMLNode attributeWithName:@"ID" stringValue:@"123456"];
    [peopleElement addAttribute:peopleID];
    
    /*
       为了解决属性值中使用XML中的特殊字符，xml使用类似的转义字符去描述。
        字符  转移字符
        <  &lt;
        >  &gt;
        &  &amp;
        '  &apos;
        "  &quot;
       在某些情况下，我们在xml中要使用大量XML敏感的字符，而我们又不希望逐一的对其进行转移。这时候使用CDATA段是最理想的。
       语法格式：<![CDATA[忽略检查的文本]]>
        
       在使用程序读取的时候，解析器会自动将这些实体转换回”<”、”>”、”&”。举个例子：
    　　<age> age < 30 </age>
    　　上面这种写法会报错，应该这样写：
    　　<age> age &lt; 30 </age>
        */
//    DDXMLElement *cdataElement = [DDXMLElement elementWithName:@"CDATA" stringValue:@"<![CDATA[You will see this in the document and can use reserved characters like < > & \"\"]]>"];
//    DDXMLElement *cdataElement = [DDXMLElement elementWithName:@"CDATA" stringValue:@"<![CDATA[测试数据]]>"];
    
    NSString *cdataValue = @"You will see this in the document and can use reserved characters like < > & \"\"";
    DDXMLElement *cdataElement = [[DDXMLElement alloc] initWithName:@"TEST" cdataStringValue:cdataValue];
    [peopleElement addChild:cdataElement];
    
    // 语法格式：< ! [ CDATA ［忽略检查的文本］］>
    DDXMLElement *nameElement = [DDXMLElement elementWithName:@"NAME" stringValue:@"张三"];
    DDXMLElement *ageElement = [DDXMLElement elementWithName:@"AGE" stringValue:@"18"];
    DDXMLElement *sexElement = [DDXMLElement elementWithName:@"SEX" stringValue:@"MAN"];
        
    [peopleElement addChild:nameElement];
    [peopleElement addChild:ageElement];
    [peopleElement addChild:sexElement];
    
    DDXMLDocument *peopleDocument = [[DDXMLDocument alloc] initWithXMLString:peopleElement.XMLString options:DDXMLDocumentXMLKind error:nil];
//    NSData *prettyData = [peopleDocument XMLDataWithOptions:DDXMLNodePrettyPrint];
//    DDXMLDocument *peopleDocument_pretty = [[DDXMLDocument alloc] initWithData:prettyData options:0 error:nil];
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"people.xml"];
    //支持自动换行
    [[peopleDocument XMLDataWithOptions:DDXMLNodePrettyPrint] writeToFile:path atomically:YES];
}

@end
