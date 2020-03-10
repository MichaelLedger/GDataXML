//
//  Player.m
//  GDataXML-Demo-OC
//
//  Created by MountainX on 2020/3/10.
//  Copyright © 2020 MTX Software Technology Co.,Ltd. All rights reserved.
//

#import "Player.h"

@implementation Player

- (id)initWithName:(NSString *)aName level:(int)aLevel rpgClass:(RPGClass)aRPGClass {
    if (self = [super init]) {
        _name = aName;
        _level = aLevel;
        _rpgClass = aRPGClass;
    }
    return self;
}

@end
