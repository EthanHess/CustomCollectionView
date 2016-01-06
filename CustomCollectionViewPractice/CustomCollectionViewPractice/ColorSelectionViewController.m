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

@property (weak, nonatomic) IBOutlet UIButton *redButton;
@property (weak, nonatomic) IBOutlet UIButton *blueButton;
@property (weak, nonatomic) IBOutlet UIButton *greenButton;
@property (weak, nonatomic) IBOutlet UIButton *orangeButton;

@property (nonatomic) BOOL redBool;
@property (nonatomic) BOOL blueBool;
@property (nonatomic) BOOL greenBool;
@property (nonatomic) BOOL orangeBool;

@end

@implementation ColorSelectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    float cornerRadius = self.redButton.frame.size.height / 2;
    
    self.redButton.layer.cornerRadius = cornerRadius;
    self.blueButton.layer.cornerRadius = cornerRadius;
    self.greenButton.layer.cornerRadius = cornerRadius;
    self.orangeButton.layer.cornerRadius = cornerRadius; 
    
    self.redButton.backgroundColor = [UIColor lightGrayColor];
    self.blueButton.backgroundColor = [UIColor lightGrayColor];
    self.greenButton.backgroundColor = [UIColor lightGrayColor];
    self.orangeButton.backgroundColor = [UIColor lightGrayColor];
    
    self.redBool = NO;
    self.blueBool = NO;
    self.greenBool = NO;
    self.orangeBool = NO;
    
//    [self.rowsTextField setKeyboardType:UIKeyboardTypeNumberPad];
//    [self.columnsTextField setKeyboardType:UIKeyboardTypeNumberPad]; 
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)redButtonTapped:(id)sender {
    
    if (self.redBool == NO) {
        [self.redButton setBackgroundColor:[UIColor redColor]];
        self.redBool = YES;
    }
    else {
        [self.redButton setBackgroundColor:[UIColor lightGrayColor]];
        self.redBool = NO;
    }
    
}

- (IBAction)blueButtonTapped:(id)sender {
    
    if (self.blueBool == NO) {
        [self.blueButton setBackgroundColor:[UIColor blueColor]];
        self.blueBool = YES;
    }
    else {
        [self.blueButton setBackgroundColor:[UIColor lightGrayColor]];
        self.blueBool = NO;
    }
}

- (IBAction)greenButtonTapped:(id)sender {
    
    if (self.greenBool == NO) {
        [self.greenButton setBackgroundColor:[UIColor greenColor]];
        self.greenBool = YES;
    }
    else {
        [self.greenButton setBackgroundColor:[UIColor lightGrayColor]];
        self.greenBool = NO;
    }
}

- (IBAction)orangeButtonTapped:(id)sender {
    
    if (self.orangeBool == NO) {
        [self.orangeButton setBackgroundColor:[UIColor orangeColor]];
        self.orangeBool = YES;
    }
    else {
        [self.orangeButton setBackgroundColor:[UIColor lightGrayColor]];
        self.orangeBool = NO;
    }
    
}

- (IBAction)generatePattern:(id)sender {
    
    [self performSegueWithIdentifier:@"GeneratePattern" sender:sender];
    
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if (self.redBool == NO && self.blueBool == NO && self.greenBool == NO && self.orangeBool == NO) {
        
        return;
        
    }
    
    PatternCollectionViewController *patternView = [segue destinationViewController];
    
    patternView.numberOfRows = [self.rowsTextField.text intValue];
    patternView.numberOfColumns = [self.columnsTextField.text intValue];
    
    patternView.colorArray = [NSMutableArray new];
    
    if (self.redBool == YES) {
//        [patternView.colorArray addObject:@"#FF0000"];
        [patternView.colorArray addObject:[UIColor randomColorOne]];
    }
    
    if (self.blueBool == YES) {
//        [patternView.colorArray addObject:@"#0022FF"];
        [patternView.colorArray addObject:[UIColor randomColorTwo]];
    }
    
    if (self.greenBool == YES) {
//        [patternView.colorArray addObject:@"#07CF00"];
        [patternView.colorArray addObject:[UIColor randomColorThree]];
    }
    
    if (self.orangeBool == YES) {
//        [patternView.colorArray addObject:@"#FF9100"];
        [patternView.colorArray addObject:[UIColor randomColorFour]];
        
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
