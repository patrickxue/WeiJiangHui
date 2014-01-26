//
//  PersonalTabViewController.m
//  WeiLeHui
//
//  Created by Patrick on 1/15/14.
//  Copyright (c) 2014 Patrick. All rights reserved.
//

#import "PersonalTabViewController.h"

@interface PersonalTabViewController ()

@end

@implementation PersonalTabViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
//        [self.tabBarItem setImageInsets:UIEdgeInsetsMake(7, 0, -7, 0)];
        self.title = @"个人中心";
        [self.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"tab2_s.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"tab2.png"]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
