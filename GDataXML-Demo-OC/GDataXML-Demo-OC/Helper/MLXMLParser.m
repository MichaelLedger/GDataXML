//
//  MLXMLParser.m
//  GDataXML-Demo-OC
//
//  Created by MountainX on 2020/3/10.
//  Copyright © 2020 MTX Software Technology Co.,Ltd. All rights reserved.
//

#import "MLXMLParser.h"
#import <GDataXMLNode_iOS/GDataXMLNode.h>
#import <KissXML/KissXML.h>

@implementation MLXMLParser

+ (void)parseXMLDemo {
    NSLog(@"%s", __func__);
    NSError *error = nil;
    NSString *filePath0 = [[NSBundle mainBundle] pathForResource:@"config" ofType:@"xml"];
    NSData *xmldata0 = [[NSData alloc] initWithContentsOfFile:filePath0];
    GDataXMLDocument *doc0 = [[GDataXMLDocument alloc] initWithData:xmldata0 options:0 error:&error];
    GDataXMLElement *rootElement = doc0.rootElement;
    if(error != nil) {
        NSLog(@"Attribute.xml parsed error!\n%@", [error localizedDescription]);
        return;
    }
    NSLog(@"%@", rootElement);
    NSArray *messages = [rootElement elementsForName:@"OrderData"];
    if (messages.count > 0) {
        for (GDataXMLElement *element in messages) {
            //取OrderData的HASH属性值
            NSLog(@"attrute:%@", [[element attributeForName:@"HASH"] stringValue]);
            //获取所有命名空间nameSpaces
            NSArray *nameSpaces = [element namespaces];//
            if (nameSpaces.count > 0) {
                [nameSpaces enumerateObjectsUsingBlock:^(GDataXMLNode *node, NSUInteger idx, BOOL *stop) {
                    //获取所有命名空间的名字与值
                    NSLog(@"|%@:%@|", [node name], [node stringValue]);
                }];
            }
            
            //取OrderData的HASH属性值，如果没有值，取出来的则是所有子值的组合（这里是：97cdbadaodd10odd11odd12l）
            NSLog(@"OrderData:%@", [element stringValue]);
            //获取id子元素数组
            NSArray *elementIDs = [element elementsForName:@"id"];
            if (elementIDs.count > 0) {
                for (GDataXMLElement *eID in elementIDs) {
                    NSLog(@"id:%d", [[eID stringValue] intValue]);  // 获取ID的值
                }
            }
            
            //获取customer子元素数组
            NSArray *elementCustomers = [element elementsForName:@"customer"];
            if (elementCustomers.count > 0) {
                for (GDataXMLElement *eID in elementCustomers) {
                    NSArray *customerDatas = [eID elementsForName:@"CustomerData"];
                    if (customerDatas.count > 0) {
                        for (GDataXMLElement *customerData in customerDatas) {
                            NSLog(@"customerData:%@", [customerData stringValue]);  // 获取customerData的值
                            NSLog(@"customerData-attrute:%@", [[customerData attributeForName:@"HASH"] stringValue]);  // 获取customerData的HASH属性值
                        }
                    }
                }
            }
            
            //获取billingAddress子元素数组
            NSArray *elementBillingAddresses = [element elementsForName:@"billingAddress"];
            if (elementBillingAddresses.count > 0) {
                for (GDataXMLElement *eID in elementBillingAddresses) {
                    NSLog(@"billingAddress:%@", [eID stringValue]);  // 获取billingAddress的值
                }
            }
            
            //获取deliveryAddress子元素数组
            NSArray *elementDeliveryAddressses = [element elementsForName:@"deliveryAddress"];
            if (elementDeliveryAddressses.count > 0) {
                for (GDataXMLElement *eID in elementDeliveryAddressses) {
                    NSLog(@"deliveryAddress:%@", [eID stringValue]);// 获取deliveryAddress的值
                }
            }
            
            //获取orderDetail子元素数组
            NSArray *elementOrderDetails = [element elementsForName:@"orderDetail"];
            if (elementOrderDetails.count > 0) {
                for (GDataXMLElement *eID in elementOrderDetails) {
                    NSArray *lists = [eID elementsForName:@"list"];
                    if (lists.count > 0) {
                        for (GDataXMLElement *list in lists) {
                            NSArray *OrderDetailDatas = [list elementsForName:@"OrderDetailData"];
                            if (OrderDetailDatas.count > 0) {
                                for (GDataXMLElement *OrderDetailData in OrderDetailDatas) {
                                    NSLog(@"OrderDetailData-attribute:%@", [[OrderDetailData attributeForName:@"HASH"] stringValue]);
                                    NSLog(@"OrderDetailData:%@", [OrderDetailData stringValue]);
                                }
                            }
                        }
                    }
                }
            }
            
            //获取log子元素数组
            NSArray *elementLogs = [element elementsForName:@"log"];
            if (elementLogs.count > 0) {
                for (GDataXMLElement *eID in elementLogs) {
                    NSLog(@"log:%@", [eID stringValue]);// 获取log的值
                }
            }
        }
    }
}

+ (void)parseXMLDemoUsingKissXML {
    NSLog(@"%s", __func__);
    NSError *error = nil;
    NSString *filePath0 = [[NSBundle mainBundle] pathForResource:@"config" ofType:@"xml"];
    NSData *xmldata0 = [[NSData alloc] initWithContentsOfFile:filePath0];
    DDXMLDocument *doc = [[DDXMLDocument alloc] initWithData:xmldata0 options:0 error:&error];
    if(error != nil) {
        NSLog(@"Attribute.xml parsed error!\n%@", [error localizedDescription]);
        return;
    }
    DDXMLElement *rootElement = [doc rootElement];
    NSArray *messages = [rootElement elementsForName:@"OrderData"];
    if (messages.count > 0) {
        for (DDXMLElement *element in messages) {
            //取OrderData的HASH属性值
            NSLog(@"attrute:%@", [[element attributeForName:@"HASH"] stringValue]);
            //获取所有命名空间nameSpaces
            NSArray *nameSpaces = [element namespaces];//
            if (nameSpaces.count > 0) {
                [nameSpaces enumerateObjectsUsingBlock:^(DDXMLNode *node, NSUInteger idx, BOOL *stop) {
                    //获取所有命名空间的名字与值
                    NSLog(@"|%@:%@|", [node name], [node stringValue]);
                }];
            }
            
            //取OrderData的HASH属性值，如果没有值，取出来的则是所有子值的组合（这里是：97cdbadaodd10odd11odd12l）
            NSLog(@"OrderData:%@", [element stringValue]);
            //获取id子元素数组
            NSArray *elementIDs = [element elementsForName:@"id"];
            if (elementIDs.count > 0) {
                for (GDataXMLElement *eID in elementIDs) {
                    NSLog(@"id:%d", [[eID stringValue] intValue]);  // 获取ID的值
                }
            }
            
            //获取customer子元素数组
            NSArray *elementCustomers = [element elementsForName:@"customer"];
            if (elementCustomers.count > 0) {
                for (GDataXMLElement *eID in elementCustomers) {
                    NSArray *customerDatas = [eID elementsForName:@"CustomerData"];
                    if (customerDatas.count > 0) {
                        for (GDataXMLElement *customerData in customerDatas) {
                            NSLog(@"customerData:%@", [customerData stringValue]);  // 获取customerData的值
                            NSLog(@"customerData-attrute:%@", [[customerData attributeForName:@"HASH"] stringValue]);  // 获取customerData的HASH属性值
                        }
                    }
                }
            }
            
            //获取billingAddress子元素数组
            NSArray *elementBillingAddresses = [element elementsForName:@"billingAddress"];
            if (elementBillingAddresses.count > 0) {
                for (GDataXMLElement *eID in elementBillingAddresses) {
                    NSLog(@"billingAddress:%@", [eID stringValue]);  // 获取billingAddress的值
                }
            }
            
            //获取deliveryAddress子元素数组
            NSArray *elementDeliveryAddressses = [element elementsForName:@"deliveryAddress"];
            if (elementDeliveryAddressses.count > 0) {
                for (GDataXMLElement *eID in elementDeliveryAddressses) {
                    NSLog(@"deliveryAddress:%@", [eID stringValue]);// 获取deliveryAddress的值
                }
            }
            
            //获取orderDetail子元素数组
            NSArray *elementOrderDetails = [element elementsForName:@"orderDetail"];
            if (elementOrderDetails.count > 0) {
                for (GDataXMLElement *eID in elementOrderDetails) {
                    NSArray *lists = [eID elementsForName:@"list"];
                    if (lists.count > 0) {
                        for (GDataXMLElement *list in lists) {
                            NSArray *OrderDetailDatas = [list elementsForName:@"OrderDetailData"];
                            if (OrderDetailDatas.count > 0) {
                                for (GDataXMLElement *OrderDetailData in OrderDetailDatas) {
                                    NSLog(@"OrderDetailData-attribute:%@", [[OrderDetailData attributeForName:@"HASH"] stringValue]);
                                    NSLog(@"OrderDetailData:%@", [OrderDetailData stringValue]);
                                }
                            }
                        }
                    }
                }
            }
            
            //获取log子元素数组
            NSArray *elementLogs = [element elementsForName:@"log"];
            if (elementLogs.count > 0) {
                for (GDataXMLElement *eID in elementLogs) {
                    NSLog(@"log:%@", [eID stringValue]);// 获取log的值
                }
            }
        }
    }
}

@end
