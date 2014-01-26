//
//  SSNavigationController.m
//  52Malls
//
//  Created by Patrick on 12/29/12.
//  Copyright (c) 2012 Patrick. All rights reserved.
//

#import "SSNavigationController.h"
#import "SSColor.h"
#import <QuartzCore/QuartzCore.h>
#import "RootViewController.h"
@interface SSNavigationController ()

@end

@implementation SSNavigationController

- (id)initWithRootViewController:(UIViewController *)rootViewController{
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        _rootViewController = rootViewController;
        self.delegate = self;
        
    }
    return self;
}

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
 
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0) {
        self.navigationBar.barTintColor = [UIColor redColor];//[SSColor lightRedColor];
    } else {
        self.navigationBar.layer.shadowColor = [UIColor grayColor].CGColor;
        self.navigationBar.layer.shadowOffset = CGSizeMake(0, 0);
        self.navigationBar.layer.shadowRadius = 7;
        self.navigationBar.layer.shadowOpacity = 1;
        self.navigationBar.clipsToBounds = NO;
        self.navigationBar.barStyle = UIBarStyleDefault;
        self.navigationBar.tintColor = [SSColor lightRedColor];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
//    if ( viewController ==  self.rootViewController) {
//        [navigationController setNavigationBarHidden:YES animated:animated];
//    } else if ( [navigationController isNavigationBarHidden] ) {
//        [navigationController setNavigationBarHidden:NO animated:animated];
//    }
}
@end
