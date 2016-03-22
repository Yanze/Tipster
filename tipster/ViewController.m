//
//  ViewController.m
//  tipster
//
//  Created by yanze on 3/20/16.
//  Copyright © 2016 yanzeliu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//MARK: guest check
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalTipNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipPerPerspnNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalToPayNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalPerPersonNumLabel;

//MARK: tip slider
@property (weak, nonatomic) IBOutlet UILabel *tipPercentage;
@property (weak, nonatomic) IBOutlet UISlider *tipSlider;

//MARK: group slider
@property (weak, nonatomic) IBOutlet UILabel *groupSizeLabel;
@property (weak, nonatomic) IBOutlet UISlider *groupSlider;


@end



@implementation ViewController
int counter = 0;
int totalBill = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tipSlider.minimumValue = 1;
    self.tipPercentage.text = @"10";
    self.totalLabel.text = @"0";
    self.totalTipNumLabel.text = @"0";
    self.tipPerPerspnNumLabel.text = @"0";
    self.totalToPayNumLabel.text = @"0";
    self.totalPerPersonNumLabel.text = @"0";
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self updateTipLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//MARK: button clicked function
- (IBAction)buttonClicked:(UIButton *)sender {
    if ([self.totalLabel.text  isEqual: @"0"]) {
        self.totalLabel.text = [(UIButton *) sender currentTitle];
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
    
    totalBill = [self.totalLabel.text intValue];
    [self updateTipLabel];
    
}

- (IBAction)cClicked:(UIButton *)sender {
    self.totalLabel.text = @"0";
    self.totalTipNumLabel.text = @"0";
    self.tipPerPerspnNumLabel.text = @"0";
    self.totalToPayNumLabel.text = @"0";
    self.totalPerPersonNumLabel.text = @"0";
    counter = 0;
}



//MARK: sliders
- (IBAction)tipSlider:(UISlider *)sender {
    self.tipPercentage.text = [NSString stringWithFormat:@"%d", (int)sender.value];
    [self updateTipLabel];
}

- (void)updateTipLabel{
    float totalWithTip = (float)((int)totalBill * (int)self.tipSlider.value) / (int)100;
    self.totalTipNumLabel.text = [NSString stringWithFormat:@"$ %.2f", (float)totalWithTip];
}



@end
