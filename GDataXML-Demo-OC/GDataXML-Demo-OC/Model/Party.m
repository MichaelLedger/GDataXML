//
//  Party.m
//  GDataXML-Demo-OC
//
//  Created by MountainX on 2020/3/10.
//  Copyright © 2020 MTX Software Technology Co.,Ltd. All rights reserved.
//

#import "Party.h"
#import "Player.h"

@implementation Party

- (instancetype)init
{
    self = [super init];
    if (self) {
        _players = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
