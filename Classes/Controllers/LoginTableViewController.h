//
//  PublishInformationViewController.h
//  52Malls
//
//  Created by Patrick on 12/6/12.
//  Copyright (c) 2012 Patrick. All rights reserved.
//

#import "RootTableViewController.h"
#import "StringInputTableViewCell.h"
#import "StringMutipleInputTableViewCell.h"
#import "IntegerInputTableViewCell.h"
#import "CityPickerInputTableViewCell.h"
#import "CategoryPickerInputTableViewCell.h"
#import "InputTableViewCellDelegate.h"

@interface LoginTableViewController : UITableViewController <IntegerInputTableViewCellDelegate, InputTableViewCellDelegate>

@end
