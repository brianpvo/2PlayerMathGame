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
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;

@property (nonatomic) GameModel *gameModel;

-(void)answerAnimation;

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
    [self answerAnimation];
    [self newGame];
    
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

-(void)answerAnimation {
    self.answerLabel.alpha = 1;
    if ([self.gameModel updatePlayerStats: self.answer]) {
        self.answerLabel.backgroundColor = [UIColor greenColor];
        self.answerLabel.text = @"CORRECT";
        [UIView animateWithDuration:1 animations:^{self.answerLabel.alpha = 0;}];
    } else {
        self.answerLabel.backgroundColor = [UIColor redColor];
        self.answerLabel.text = @"INCORRECT";
    }
    [UIView animateWithDuration:1 animations:^{self.answerLabel.alpha = 0;}];
}

-(void)newGame {
    if (self.gameModel.gameOver) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Restart Game" message:@"Do you want to restart your game?" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *yes = [UIAlertAction actionWithTitle:@"YES" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            self.gameModel = [[GameModel alloc] init];
            self.answer = [[NSMutableString alloc] init];
            self.question.text = self.gameModel.question;
            self.player1Score.text = self.gameModel.updateScoreLifeLabel;
            self.player2Score.text = self.gameModel.updateScoreLifeLabel;
        }];
        UIAlertAction *no = [UIAlertAction actionWithTitle:@"NO" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {}];
        [alert addAction:yes];
        [alert addAction:no];
        [self presentViewController:alert animated:true completion:nil];
    }
}

@end
