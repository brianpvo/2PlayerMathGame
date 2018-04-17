//
//  GameModel.h
//  2PlayerMathGame
//
//  Created by Brian Vo on 2018-04-16.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface GameModel : NSObject

@property (nonatomic) NSInteger leftNumber;
@property (nonatomic) NSInteger rightNumber;
@property (nonatomic) NSArray *players;
@property (nonatomic) NSInteger currentIndex;
@property (nonatomic) BOOL gameOver;

-(NSString *)question;

-(Player *)currentPlayer;

-(void)updatePlayerStats:(NSString *) userAnswer;

-(NSString *)updateScoreLifeLabel;

-(void)nextPlayer;

@end
