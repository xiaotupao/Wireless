//
//  ChangePasswordViewController.m
//  wirelessuda
//
//  Created by 叶帆 on 13-11-12.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "ChangePasswordViewController.h"
#import "MBProgressHUD.h"

@interface ChangePasswordViewController ()

@end

@implementation ChangePasswordViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor grayColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
    self.edgesForExtendedLayout=UIRectEdgeNone;
	
#pragma mark - 原密码
    UILabel *beformPsdLabel = [[UILabel alloc]init];
    beformPsdLabel.frame = CGRectMake(20, self.view.bounds.size.height-170, 80, 30);
    beformPsdLabel.text = @"原密码:";
    [self.view addSubview:beformPsdLabel];
    beformPsdText = [[UITextField alloc]init];
    beformPsdText.frame = CGRectMake(100, self.view.bounds.size.height-170, 180 ,30);
    beformPsdText.borderStyle = UITextBorderStyleRoundedRect;
    beformPsdText.placeholder = @"请输入原密码";
    beformPsdText.contentHorizontalAlignment = UIControlContentVerticalAlignmentCenter;
    beformPsdText.secureTextEntry = YES;
    [self.view addSubview:beformPsdText];
    
#pragma mark - 新密码
    UILabel *newPsdLabel = [[UILabel alloc]init];
    newPsdLabel.frame = CGRectMake(20, self.view.bounds.size.height-125, 80, 30);
    newPsdLabel.text = @"新密码:";
    [self.view addSubview:newPsdLabel];
    newPsdText = [[UITextField alloc]init];
    newPsdText.frame = CGRectMake(100, self.view.bounds.size.height-125, 180, 30);
    newPsdText.borderStyle = UITextBorderStyleRoundedRect;
    newPsdText.placeholder = @"请输入新密码";
    newPsdText.contentHorizontalAlignment = UIControlContentVerticalAlignmentCenter;
    newPsdText.secureTextEntry = YES;
    [self.view addSubview:newPsdText];
    
#pragma mark - 确认密码
    UILabel *conformPsdLabel = [[UILabel alloc]init];
    conformPsdLabel.frame = CGRectMake(20, self.view.bounds.size.height-80, 80, 30);
    conformPsdLabel.text = @"确认密码:";
    [self.view addSubview:conformPsdLabel];
    conformPsdText = [[UITextField alloc]init];
    conformPsdText.frame = CGRectMake(100, self.view.bounds.size.height-80, 180, 30);
    conformPsdText.borderStyle = UITextBorderStyleRoundedRect;
    conformPsdText.placeholder = @"请确认新密码";
    conformPsdText.contentHorizontalAlignment = UIControlContentVerticalAlignmentCenter;
    conformPsdText.secureTextEntry = YES;
    [self.view addSubview:conformPsdText];
    
#pragma mark - 确认按钮
    UIButton *confirm = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    confirm.frame = CGRectMake(120, self.view.bounds.size.height-40, 80, 30);
    [confirm setTitle:@"确认修改" forState:UIControlStateNormal];
    [confirm addTarget:self action:@selector(onConfirmClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confirm];
    
#pragma mark - 触摸键盘消失
    UITapGestureRecognizer* tapGesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    tapGesture.delegate=(id<UIGestureRecognizerDelegate>)self;
    [self.view addGestureRecognizer:tapGesture];
}

#pragma mark - 确认按钮
- (void)onConfirmClick
{
    if (!beformPsdText||!beformPsdText.text||[@"" isEqualToString:[beformPsdText.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]]) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"    请输入原密码!     ";
        hud.margin = 10.f;
        hud.yOffset = 180.f;
        hud.removeFromSuperViewOnHide = YES;
        [hud hide:YES afterDelay:2];
        [beformPsdText becomeFirstResponder];
        return;
    }
//    
//    if (![beformPsdText.text isEqualToString:self.userEntity.password]) {
//        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//        hud.mode = MBProgressHUDModeText;
//        hud.labelText = @"    原密码不正确,请重新输入!     ";
//        hud.margin = 10.f;
//        hud.yOffset = 180.f;
//        hud.removeFromSuperViewOnHide = YES;
//        [hud hide:YES afterDelay:2];
//        [beformPsdText becomeFirstResponder];
//        beformPsdText.text = nil;
//        return;
//    }
    
    if (!newPsdText||!newPsdText.text||[@"" isEqualToString:[newPsdText.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]]) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"    请输入新密码!     ";
        hud.margin = 10.f;
        hud.yOffset = 180.f;
        hud.removeFromSuperViewOnHide = YES;
        [hud hide:YES afterDelay:2];
        [newPsdText becomeFirstResponder];
        return;
    }
    
    if ([newPsdText.text length]< 6) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"    新密码长度太短!     ";
        hud.margin = 10.f;
        hud.yOffset = 180.f;
        hud.removeFromSuperViewOnHide = YES;
        [hud hide:YES afterDelay:2];
        [newPsdText becomeFirstResponder];
        return;
    }
    
    if (!conformPsdText||!conformPsdText.text||[@"" isEqualToString:[conformPsdText.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]]) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"    请确认新密码!     ";
        hud.margin = 10.f;
        hud.yOffset = 180.f;
        hud.removeFromSuperViewOnHide = YES;
        [hud hide:YES afterDelay:2];
        [conformPsdText becomeFirstResponder];
        return;
    }
    
    if (![conformPsdText.text isEqualToString:newPsdText.text]) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"    两次输入不一致,请重新输入!     ";
        hud.margin = 10.f;
        hud.yOffset = 180.f;
        hud.removeFromSuperViewOnHide = YES;
        [hud hide:YES afterDelay:2];
        [conformPsdText becomeFirstResponder];
        conformPsdText.text = nil;
        return;
    }
    
}

#pragma mark - 触摸键盘消失
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ([touch.view isKindOfClass:[UIButton class]]) {
        return NO;
    }
    return YES;
}

-(void)tap:(UIGestureRecognizer*)gesture
{
    if (self.view.frame.origin.y==-85) {
        [UIView animateWithDuration:0.3 animations:^{
            self.view.frame=CGRectOffset(self.view.frame, 0, 85);
        }];
    }
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
