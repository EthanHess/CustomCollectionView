//
//  ColorSelectionViewController.m
//  CustomCollectionViewPractice
//
//  Created by Ethan Hess on 5/16/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "ColorSelectionViewController.h"
#import "PatternCollectionViewController.h"
#import "NSObject+Colors.h"

@interface ColorSelectionViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *rowsTextField;
@property (weak, nonatomic) IBOutlet UITextField *columnsTextField;

@property (weak, nonatomic) IBOutlet UIButton *oneButton;
@property (weak, nonatomic) IBOutlet UIButton *twoButton;
@property (weak, nonatomic) IBOutlet UIButton *threeButton;
@property (weak, nonatomic) IBOutlet UIButton *fourButton;
@property (weak, nonatomic) IBOutlet UIButton *fiveButton;
@property (weak, nonatomic) IBOutlet UIButton *sixButton;

@property (nonatomic) BOOL oneBool;
@property (nonatomic) BOOL twoBool;
@property (nonatomic) BOOL threeBool;
@property (nonatomic) BOOL fourBool;
@property (nonatomic) BOOL fiveBool;
@property (nonatomic) BOOL sixBool;

@end

@implementation ColorSelectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    float cornerRadius = self.oneButton.frame.size.height / 2;
    
    self.oneButton.layer.cornerRadius = cornerRadius;
    self.twoButton.layer.cornerRadius = cornerRadius;
    self.threeButton.layer.cornerRadius = cornerRadius;
    self.fourButton.layer.cornerRadius = cornerRadius;
    self.fiveButton.layer.cornerRadius = cornerRadius;
    self.sixButton.layer.cornerRadius = cornerRadius;
    
    self.oneButton.backgroundColor = [UIColor lightGrayColor];
    self.twoButton.backgroundColor = [UIColor lightGrayColor];
    self.threeButton.backgroundColor = [UIColor lightGrayColor];
    self.fourButton.backgroundColor = [UIColor lightGrayColor];
    self.fiveButton.backgroundColor = [UIColor lightGrayColor];
    self.sixButton.backgroundColor = [UIColor lightGrayColor];
    
    self.oneBool = NO;
    self.twoBool = NO;
    self.threeBool = NO;
    self.fourBool = NO;
    self.fiveBool = NO;
    self.sixBool = NO;
    
    //FIX
    [self.rowsTextField setKeyboardType:UIKeyboardTypeNumberPad];
    [self.columnsTextField setKeyboardType:UIKeyboardTypeNumberPad]; 
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)oneButtonTapped:(id)sender {
    
    if (self.oneBool == NO) {
//        [self.oneButton setBackgroundColor:[UIColor redColor]];
        [self.oneButton setBackgroundColor:[UIColor randomButtonColorOne]];
        [self.oneButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.oneBool = YES;
    }
    else {
        [self.oneButton setBackgroundColor:[UIColor lightGrayColor]];
        [self.oneButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.oneBool = NO;
    }
    
}

- (IBAction)twoButtonTapped:(id)sender {
    
    if (self.twoBool == NO) {
//        [self.twoButton setBackgroundColor:[UIColor blueColor]];
        [self.twoButton setBackgroundColor:[UIColor randomButtonColorTwo]];
        [self.twoButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.twoBool = YES;
    }
    else {
        [self.twoButton setBackgroundColor:[UIColor lightGrayColor]];
        [self.twoButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.twoBool = NO;
    }
}

- (IBAction)threeButtonTapped:(id)sender {
    
    if (self.threeBool == NO) {
//        [self.threeButton setBackgroundColor:[UIColor greenColor]];
        [self.threeButton setBackgroundColor:[UIColor randomButtonColorThree]];
        [self.threeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.threeBool = YES;
    }
    else {
        [self.threeButton setBackgroundColor:[UIColor lightGrayColor]];
        [self.threeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.threeBool = NO;
    }
}

- (IBAction)fourButtonTapped:(id)sender {
    
    if (self.fourBool == NO) {
//        [self.fourButton setBackgroundColor:[UIColor orangeColor]];
        [self.fourButton setBackgroundColor:[UIColor randomButtonColorFour]];
        [self.fourButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.fourBool = YES;
    }
    else {
        [self.fourButton setBackgroundColor:[UIColor lightGrayColor]];
        [self.fourButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.fourBool = NO;
    }
    
}

- (IBAction)fiveButtonTapped:(id)sender {
    
    if (self.fiveBool == NO) {
//        [self.fiveButton setBackgroundColor:[UIColor purpleColor]];
        [self.fiveButton setBackgroundColor:[UIColor randomButtonColorFive]];
        [self.fiveButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.fiveBool = YES;
    }
    else {
        [self.fiveButton setBackgroundColor:[UIColor lightGrayColor]];
        [self.fiveButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.fiveBool = NO;
    }
    
}

- (IBAction)sixButtonTapped:(id)sender {
    
    if (self.sixBool == NO) {
//        [self.sixButton setBackgroundColor:[UIColor yellowColor]];
        [self.sixButton setBackgroundColor:[UIColor randomButtonColorSix]];
        [self.sixButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.sixBool = YES;
    }
    else {
        [self.sixButton setBackgroundColor:[UIColor lightGrayColor]];
        [self.sixButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.sixBool = NO;
    }
    
}

- (IBAction)generatePattern:(id)sender {
    
    [self performSegueWithIdentifier:@"GeneratePattern" sender:sender];
    
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if (self.oneBool == NO && self.twoBool == NO && self.threeBool == NO && self.fourBool == NO && self.fiveBool == NO && self.sixBool == NO) {
        
        return;
        
    }
    
    PatternCollectionViewController *patternView = [segue destinationViewController];
    
    patternView.numberOfRows = [self.rowsTextField.text intValue];
    patternView.numberOfColumns = [self.columnsTextField.text intValue];
    
    patternView.colorArray = [NSMutableArray new];
    
    if (self.oneBool == YES) {
//        [patternView.colorArray addObject:@"#FF0000"];
        [patternView.colorArray addObject:[UIColor randomColorOne]];
    }
    
    if (self.twoBool == YES) {
//        [patternView.colorArray addObject:@"#0022FF"];
        [patternView.colorArray addObject:[UIColor randomColorTwo]];
    }
    
    if (self.threeBool == YES) {
//        [patternView.colorArray addObject:@"#07CF00"];
        [patternView.colorArray addObject:[UIColor randomColorThree]];
    }
    
    if (self.fourBool == YES) {
//        [patternView.colorArray addObject:@"#FF9100"];
        [patternView.colorArray addObject:[UIColor randomColorFour]];
        
    }
    
    if (self.fiveBool == YES) {
        [patternView.colorArray addObject:[UIColor randomColorFive]];
    }
    
    if (self.sixBool == YES) {
        [patternView.colorArray addObject:[UIColor randomColorSix]]; 
    }
    

}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
}

#define POSITIVEINTEGERS @"0123456789"

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSCharacterSet *charSet = [[NSCharacterSet characterSetWithCharactersInString:POSITIVEINTEGERS] invertedSet];
    NSString *filtered = [[string componentsSeparatedByCharactersInSet:charSet] componentsJoinedByString:@""];
    BOOL basicTest = [string isEqualToString:filtered];
    return basicTest;
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self.rowsTextField resignFirstResponder];
    [self.columnsTextField resignFirstResponder];
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
