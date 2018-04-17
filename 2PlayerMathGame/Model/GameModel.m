//
//  GameModel.m
//  2PlayerMathGame
//
//  Created by Brian Vo on 2018-04-16.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

#import "GameModel.h"

@implementation GameModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _leftNumber = arc4random_uniform(20) + 1;
        _rightNumber = arc4random_uniform(20) + 1;
        _players = @[[[Player alloc] initWithName: @"Player 1"], [[Player alloc] initWithName:@"Player 2"]];
        _currentIndex = 0;
        _gameOver = NO;
    }
    return self;
}

-(NSString *)question {
    NSString *question;
    if (!self.gameOver) {
    question = [NSString stringWithFormat:@"%@: %li + %li", self.currentPlayer.name, self.leftNumber, self.rightNumber];
    } else {
        question = @"GAME OVER";
    }
    return question;
}

-(Player *)currentPlayer {
    return [_players objectAtIndex:self.currentIndex];
}

-(void)updatePlayerStats:(NSString *)userAnswer {
    NSString *answer = [NSString stringWithFormat:@"%li", self.leftNumber + self.rightNumber];
    if ([answer isEqualToString:userAnswer]) {
        NSLog(@"correct!");
        self.currentPlayer.score++;
    }
    else {
        if (self.currentPlayer.life > 1) {
            self.currentPlayer.life--;
        } else {
            self.gameOver = YES;
        }
    }
    self.leftNumber = arc4random_uniform(20) + 1;
    self.rightNumber = arc4random_uniform(20) + 1;
}

-(NSString *)updateScoreLifeLabel {
    return self.currentPlayer.scoreLifeString;
}

-(void)nextPlayer {
    self.currentIndex++;
    self.currentIndex = self.currentIndex % 2;
}

@end
