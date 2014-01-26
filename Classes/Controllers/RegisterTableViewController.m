//
//  PublishInformationViewController.m
//  52Malls
//
//  Created by Patrick on 12/6/12.
//  Copyright (c) 2012 Patrick. All rights reserved.
//

#import "RegisterTableViewController.h"
#import "ViewUtils.h"
#import "Tools.h"
#import "AsyncImageView.h"
#import "UploadImage.h"
#import "MBProgressHUD.h"
#import "StringInputTableViewCell.h"

@interface RegisterTableViewController()<ASIProgressDelegate>{
    NSArray *cellArray;
    MBProgressHUD *HUD;
    int leftSeconds;
}
@property (strong, nonatomic) IBOutletCollection(StringInputTableViewCell) NSArray *inputCells;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;
@end

@implementation RegisterTableViewController

- (id)init{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"RegisterTableViewController" bundle:nil];
    self = [storyboard instantiateInitialViewController];
    if (self) {
        //self.title = @"登录";
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
    
    //[ViewUtils applyBusinessTableStyle:self.tableView];

//    [self.tableView reloadData];
//   cellArray = [NSArray arrayWithArray:[self.tableView visibleCells]] ;
//    if (cellArray.count > 8) {
//        StringInputTableViewCell *nameCell = [cellArray objectAtIndex:2];
//        [nameCell.segmentedControl setEnabled:NO forSegmentAtIndex:0];
//        StringMutipleInputTableViewCell *addressCell = [cellArray objectAtIndex:8];
//        [addressCell.segmentedControl setEnabled:NO forSegmentAtIndex:1];
//    }
//
    [self setInputCell:self.inputCells[0] withPlaceHolder:@"请输入手机号码"];
    [self setInputCell:self.inputCells[1] withPlaceHolder:@"验证码"];
    [self setInputCell:self.inputCells[2] withPlaceHolder:@"请输入密码"];
    [self.inputCells[1] performSelector:@selector(setSecureTextEntry:) withObject:@YES];
//    self.loginButton.layer.cornerRadius = 3;
//    self.registerButton.layer.cornerRadius = 3;
    [self loadData];
}

- (void)setInputCell:(StringInputTableViewCell*)cell withPlaceHolder:(NSString*)placeHolder
{
    [cell.textField setPlaceholder:placeHolder];
}

- (void)loadData{
    UIWindow *window = [Tools currentWindow];
    HUD = [[MBProgressHUD alloc] initWithFrame:window.bounds];
    HUD.removeFromSuperViewOnHide = YES;
    HUD.LabelText = @"正在加载数据";
    [window addSubview:HUD];
    //[HUD show:YES];
    /*NSString *url = [SGURLConfigForUser current].userPageQueryUrl;
    
    [SGHTTPHelper invokeGetOperationWithURL:url params:nil onSuccess:^(NSDictionary *jsonResponse) {
        
        self.userDetail = [[UserDetail alloc] initWithDictionary:jsonResponse];
        [self refreshTableWithUserDetail:self.userDetail];
        [HUD hide:YES];
    } onFailure:^(id request) {
    } onComplete:^{
        
    }];*/
}

- (void)submitUserDetail:(id)sender{
    
    UIWindow *window = [Tools currentWindow];
    HUD = [[MBProgressHUD alloc] initWithFrame:window.bounds];
    HUD.removeFromSuperViewOnHide = YES;
    HUD.LabelText = @"正在提交数据";
    
    [window addSubview:HUD];
    //[HUD show:YES];
    /*
    [SGHTTPHelper invokePostOperationWithURL:url params:params withImageArray:@[uploadImage] uploadProgressDelegate:self onSuccess:^(id jsonResponse) {
        GeneralResponse *gr = [[GeneralResponse alloc] initWithDictionary:jsonResponse];
        if (gr.returnCode != 0) {
            [Tools alertErrorMessage:gr.returnMessage];
        } else {
            [Tools alertHUDErrorMessage:gr.returnMessage];
            if (self.canBack) {
                [self.navigationController popViewControllerAnimated:YES];
            } else {
                [[UIApplication sharedApplication].delegate performSelector:@selector(tabViewControllerBecomeFirst)];
            }
        }
        
    } onFailure:^(id request) {
        
    } onComplete:^{
        [HUD hide:YES];
    }];
    */
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onBackLoginButtonClicked:(id)sender {
    NSLog(@"");
    [self.presentingViewController dismissModalViewControllerAnimated:YES];
}

- (IBAction)onRegisterButtonClicked:(id)sender {
    //[self.navigationController pushViewController: animated:YES];
}

- (IBAction)onGetValidateCodeButtonClicked:(id)sender {
    [self disableValidateCodeButtonForOneMin:sender];
}

- (void)disableValidateCodeButtonForOneMin:(UIButton *)button
{
    button.enabled = NO;
    leftSeconds = 60;
    [self performSelector:@selector(updateValidateCodeButtonTitle:) withObject:button];
}

- (void)updateValidateCodeButtonTitle:(UIButton *)button
{
    leftSeconds--;
    NSString *title = @"获取验证码";
    if (leftSeconds == 0) {
        button.enabled = YES;
    } else {
        title = [NSString stringWithFormat:@"获取验证码(%d)", leftSeconds];
        [self performSelector:@selector(updateValidateCodeButtonTitle:) withObject:button afterDelay:1];
    }
    [button setTitle:title forState:UIControlStateNormal];
}

#pragma mark - InputTableViewCellDelegate
- (void)tableViewCellReturnKeyClick:(UITableViewCell *)cell{
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}

- (void)tableViewCellSwitchKeyClick:(UITableViewCell *)cell withPreviousOrNext:(NSInteger)previousOrNext
{
	int index =  [self.inputCells indexOfObject:cell] + previousOrNext;
    if (index >= 0 && index < self.inputCells.count) {
        UITableViewCell *nextCell = [self.inputCells objectAtIndex:index];
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row + previousOrNext inSection:indexPath.section] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
        if (nextCell) {
            [nextCell setSelected:YES];
        }
    } else {
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    }
}
@end
