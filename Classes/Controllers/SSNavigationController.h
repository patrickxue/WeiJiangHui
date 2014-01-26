//
//  SSNavigationController.h
//  52Malls
//
//  Created by Patrick on 12/29/12.
//  Copyright (c) 2012 Patrick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSNavigationController : UINavigationController<UINavigationControllerDelegate>

@property (nonatomic, readonly) UIViewController *rootViewController;
@end
