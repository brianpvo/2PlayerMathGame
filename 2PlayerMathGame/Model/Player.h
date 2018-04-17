//
//  Player.h
//  2PlayerMathGame
//
//  Created by Brian Vo on 2018-04-16.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic) NSInteger life;
@property (nonatomic) NSInteger score;
@property (nonatomic) NSString *name;

- (instancetype)initWithName:(NSString *)name;

-(NSString *)scoreLifeString;

@end
