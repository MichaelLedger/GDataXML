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

@implementation MLXMLWriter

+ (void)writeXMLDemo {
    Party *party = [[Party alloc] init];
    for (NSInteger i = 0; i < arc4random() % 10 + 3; i ++) {
        Player *player = [[Player alloc] initWithName:[NSString stringWithFormat:@"player_%ld", i] level:arc4random()%10 rpgClass:arc4random() % 3];
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
    }
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithRootElement:partyElement];
    [doc setCharacterEncoding:@"UTF-8"];
    NSData *xmlData = [doc XMLData];
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"party.xml"];
    [xmlData writeToFile:filePath atomically:YES];
}

@end
