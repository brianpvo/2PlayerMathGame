//
//  Player.m
//  2PlayerMathGame
//
//  Created by Brian Vo on 2018-04-16.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        _life = 3;
        _score = 0;
        _name = name;
    }
    return self;
}

-(NSString *)scoreLifeString {
    return [NSString stringWithFormat:@"%@ Life: %li, Score: %li", self.name, self.life, self.score];
}

@end
