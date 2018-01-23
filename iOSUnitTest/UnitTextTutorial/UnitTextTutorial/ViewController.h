//
//  ViewController.h
//  UnitTextTutorial
//
//  Created by Adem on 8.03.2017.
//  Copyright © 2017 Adem. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelTest.h"
@interface ViewController : UIViewController

@property(nonatomic,strong) UIColor *myColor;
@property(nonatomic,strong) ModelTest *vcModel;
-(UIColor*)isColorRed;
-(NSString *)reverseString:(NSString *)stringToReverse;
-(ModelTest*)vcModel;
-(ModelTest*)vcModelDouble;
-(BOOL) validEmail:(NSString*) emailString;
@end

