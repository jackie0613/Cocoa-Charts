//
//  RootViewController.m
//  E Cocoa-Charts
//
//  Created by lengyc on 2013/11/28.
//  Copyright (c) 2013年 OSC. All rights reserved.
//

#import "RootViewController.h"
#import "ta_libc.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    NSLog(@"The square root is : %f", sqrt(9));
    
    
    TA_RetCode ta_retCode = TA_MA(0, 0, 0, 0, 0, 0, 0, 0);
    NSLog(@"TA_RetCode: %d", (int)ta_retCode);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
