//
//  ViewController.m
//  tipster
//
//  Created by yanze on 3/20/16.
//  Copyright © 2016 yanzeliu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalTipNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipPerPerspnNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalToPayNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalPerPersonNumLabel;



@end

@implementation ViewController
int counter = 0;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonClicked:(UIButton *)sender {
    
    if ([self.totalLabel.text  isEqual: @"0"]) {
        self.totalLabel.text = [(UIButton *) sender currentTitle];
//        self.totalLabel.text = [NSString stringWithFormat:@"%@%@", self.totalLabel.text, [(UIButton *)sender currentTitle]];
    }
    
    else if ([[(UIButton *) sender currentTitle] isEqual:@"c"]) {
        self.totalLabel.text = @"0";
        counter = 0;
    }
    
    else if([[(UIButton *) sender currentTitle] isEqual:@"."]){
        if (counter == 0) {
            counter++;
            self.totalLabel.text = [NSString stringWithFormat:@"%@%@", self.totalLabel.text, [(UIButton *)sender currentTitle]];
        }
        else{
            return;
        }
        
    }
    
    else{
        self.totalLabel.text = [NSString stringWithFormat:@"%@%@", self.totalLabel.text, [(UIButton *)sender currentTitle]];
    }
    
    
//    NSLog(@"%@", self.totalLabel.text);
    
}



@end
