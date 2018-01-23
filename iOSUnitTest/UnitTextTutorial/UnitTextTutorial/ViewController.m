//
//  ViewController.m
//  UnitTextTutorial
//
//  Created by Adem on 8.03.2017.
//  Copyright © 2017 Adem. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//@property(nonatomic,strong) UIColor *myColor;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIColor*)isColorRed
{
    _myColor=[UIColor redColor];
    return _myColor;
    
}

-(NSString *)reverseString:(NSString *)stringToReverse
{
    return @"adem";
}

-(ModelTest*)vcModel
{
    ModelTest *vcModel=[[ModelTest alloc] init];
    vcModel.strTest1=@"Ali";
    vcModel.strTest2=@"Veli";
    return vcModel;
}

-(ModelTest*)vcModelDouble
{
    _vcModel=[[ModelTest alloc] init];
    _vcModel.dTest1=1.11;
    _vcModel.dTest2=1.21;
    return _vcModel;
}

- (BOOL) validEmail:(NSString*) emailString {
    
    if([emailString length]==0){
        return NO;
    }
    
    NSString *regExPattern = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    NSRegularExpression *regEx = [[NSRegularExpression alloc] initWithPattern:regExPattern options:NSRegularExpressionCaseInsensitive error:nil];
    NSUInteger regExMatches = [regEx numberOfMatchesInString:emailString options:0 range:NSMakeRange(0, [emailString length])];
    
    NSLog(@"%lu", (unsigned long)regExMatches);
    if (regExMatches == 0) {
        return NO;
    } else {
        return YES;
    }
}

@end
