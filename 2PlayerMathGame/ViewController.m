//
//  ViewController.m
//  2PlayerMathGame
//
//  Created by Brian Vo on 2018-04-16.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *question;
@property (nonatomic) NSMutableString *answer;
@property (weak, nonatomic) IBOutlet UILabel *player1Score;
@property (weak, nonatomic) IBOutlet UILabel *player2Score;

@property (nonatomic) GameModel *gameModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _gameModel = [[GameModel alloc] init];
    _answer = [[NSMutableString alloc] init];
    _question.text = self.gameModel.question;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)equate:(id)sender {
    NSString *inputNum = [NSString stringWithFormat:@"%li", [sender tag]];
    [self.answer appendString:inputNum];
    NSLog(@"User answer is: %@", self.answer);
}

- (IBAction)submit:(id)sender {
    [self.gameModel updatePlayerStats: self.answer];
    if ([self.gameModel.currentPlayer.name isEqualToString:@"Player 1"]) {
        self.player1Score.text = self.gameModel.updateScoreLifeLabel;
    }
    if ([self.gameModel.currentPlayer.name isEqualToString:@"Player 2"]) {
        self.player2Score.text = self.gameModel.updateScoreLifeLabel;
    }
    
    [self.gameModel nextPlayer];
    self.question.text = self.gameModel.question;
    [self.answer setString:@""];
    
    
}

@end
