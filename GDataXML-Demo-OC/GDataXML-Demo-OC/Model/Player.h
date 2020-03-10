//
//  Player.h
//  GDataXML-Demo-OC
//
//  Created by MountainX on 2020/3/10.
//  Copyright © 2020 MTX Software Technology Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum {
    RPGClassFighter = 0,
    RPGClassRogue,
    RPGClassWizard
} RPGClass;

@interface Player : NSObject

@property (copy, nonatomic) NSString *name;
@property int level;
@property RPGClass rpgClass;
- (id)initWithName:(NSString *)aName level:(int)aLevel rpgClass:(RPGClass)aRPGClass;

@end

NS_ASSUME_NONNULL_END
