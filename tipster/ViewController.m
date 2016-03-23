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
int dotClicked = 0;
float totalBill = 0.00;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tipPercentage.text = @"10";
    self.self.groupSizeLabel.text = @"1";
    
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
    [self updatePerPersonLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//MARK: button clicked function
    BOOL userIsInTheMiddleOfTypingNumber = NO;
- (IBAction)buttonClicked:(UIButton *)sender {
    
    if(userIsInTheMiddleOfTypingNumber || dotClicked != 0){
        self.totalLabel.text = [NSString stringWithFormat:@"%@%@", self.totalLabel.text, [(UIButton *)sender currentTitle]];
    }
    
    else {
        self.totalLabel.text = [(UIButton *) sender currentTitle];
        userIsInTheMiddleOfTypingNumber = YES;
    }

    
    totalBill = [self.totalLabel.text intValue];
    [self updateTipLabel];
    [self updatePerPersonLabel];
    
}

- (IBAction)zeroClicked:(UIButton *)sender {
    if(userIsInTheMiddleOfTypingNumber){
        self.totalLabel.text = [NSString stringWithFormat:@"%@%@", self.totalLabel.text, [(UIButton *)sender currentTitle]];
    }
}

- (IBAction)dotClicked:(UIButton *)sender {
    if(dotClicked == 0){
       self.totalLabel.text = [NSString stringWithFormat:@"%@%@", self.totalLabel.text, [(UIButton *)sender currentTitle]];
        dotClicked++;
    }
}


- (IBAction)cClicked:(UIButton *)sender {
    self.tipPercentage.text = @"10";
    self.self.groupSizeLabel.text = @"1";
    
    self.tipSlider.value = 10;
    self.groupSlider.value = 1;
    
    self.totalLabel.text = @"0";
    self.totalTipNumLabel.text = @"0";
    self.tipPerPerspnNumLabel.text = @"0";
    self.totalToPayNumLabel.text = @"0";
    self.totalPerPersonNumLabel.text = @"0";
    dotClicked = 0;
    totalBill = 0.00;
    
    userIsInTheMiddleOfTypingNumber = NO;
    
    [self updatePerPersonLabel];
    [self updateTipLabel];
}



//MARK: sliders
- (IBAction)tipSlider:(UISlider *)sender {
    self.tipPercentage.text = [NSString stringWithFormat:@"%d", (int)sender.value];
    [self updateTipLabel];
    [self updatePerPersonLabel];
}


- (IBAction)groupSizeSlider:(UISlider *)sender {
    self.groupSizeLabel.text = [NSString stringWithFormat:@"%d", (int)sender.value];
    [self updateTipLabel];
    [self updatePerPersonLabel];
}


-(void)updatePerPersonLabel{
    float tip = (float)(totalBill * (int)self.tipSlider.value) / (int)100;
    
    // tip per person
    float tipPerPerson = (float)(float)tip / (int)self.groupSlider.value;
    self.tipPerPerspnNumLabel.text = [NSString stringWithFormat:@"$ %.2f", tipPerPerson];
    
    // total per person
    float totalWithTip = tip + (float)totalBill;
    float totalPerPersonToPay = (float)(totalWithTip / (int)self.groupSlider.value);
    self.totalPerPersonNumLabel.text = [NSString stringWithFormat:@"$ % .2f", totalPerPersonToPay];
}


- (void)updateTipLabel{
    float tip = (float)((float)totalBill * (int)self.tipSlider.value) / (int)100;
    self.totalTipNumLabel.text = [NSString stringWithFormat:@"$ %.2f", tip];
    float totalWithTip = tip + (float)totalBill;
    self.totalToPayNumLabel.text = [NSString stringWithFormat:@"$ %.2f", totalWithTip];
}




@end
