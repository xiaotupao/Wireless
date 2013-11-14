//
//  LoginViewController.m
//  WirelesSudaV1.0
//
//  Created by ivanfee on 13-8-7.
//  Copyright (c) 2013年 suda. All rights reserved.
//

#import "LoginViewController.h"
#import "GateWayViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.title = @"首页";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    #pragma mark - 背景图片初始化
    //self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"login_bg.jpg"]];
    self.view.backgroundColor = [UIColor blackColor];
    UIView *subBackground=[[UIView alloc]initWithFrame:CGRectMake(0, 20, 320, SCREEN_HEIGHT-20)];
    subBackground.backgroundColor=[UIColor lightGrayColor];
    
    #pragma mark - 输入子视框
    UIImageView* loginView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_textfield"]];
    loginView.frame=CGRectMake(10, 110, 300, 94);
    [subBackground addSubview:loginView];
    
    #pragma mark - 输入框和文字提示
    UILabel *usernameLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 120, 60, 35)];
    usernameLabel.text = @"用户：";
    [subBackground addSubview:usernameLabel];
    UILabel *passwordLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 160, 60, 35)];
    passwordLabel.text = @"密码：";
    [subBackground addSubview:passwordLabel];
    
    #pragma mark - 用户名和密码的UITextField
    usernameText=[[UITextField alloc] initWithFrame:CGRectMake(90, 120, 200, 35)];
    usernameText.placeholder=@"请输入网关账号";
    usernameText.autocapitalizationType=UITextAutocapitalizationTypeNone;
    usernameText.autocorrectionType=UITextAutocorrectionTypeNo;
    usernameText.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    [subBackground addSubview:usernameText];
    
    passwordText=[[UITextField alloc] initWithFrame:CGRectMake(90, 160, 200, 35)];
    passwordText.placeholder=@"请输入网关密码";
    passwordText.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    passwordText.secureTextEntry = YES;
    [subBackground addSubview:passwordText];
    
    #pragma mark - 登陆UIButton
    UIButton* btnLogin=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnLogin.frame=CGRectMake(15, 230, 140, 44);
    [btnLogin setBackgroundImage:[UIImage imageNamed:@"login18"] forState:UIControlStateNormal];
    [btnLogin addTarget:self action:@selector(onLoginClick) forControlEvents:UIControlEventTouchUpInside];
    [subBackground addSubview:btnLogin];
    
    #pragma mark - 返回UIButton
    UIButton* btnBack=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnBack.frame=CGRectMake(165, 230, 140, 44);
    [btnBack setTitle:@"" forState:UIControlStateNormal];
    [btnBack setBackgroundImage:[UIImage imageNamed:@"return18"] forState:UIControlStateNormal];
    [btnBack addTarget:self action:@selector(onBackClick) forControlEvents:UIControlEventTouchUpInside];
    [subBackground addSubview:btnBack];

    #pragma mark - 忘记密码
    UIButton* btnForget=[UIButton buttonWithType:UIButtonTypeCustom];
    btnForget.frame=CGRectMake(20, 280, 80, 40);
    btnForget.titleLabel.font=[UIFont boldSystemFontOfSize:15];
    [btnForget setTitle:@"忘记密码?" forState:UIControlStateNormal];
    btnForget.showsTouchWhenHighlighted=YES;
    [btnForget addTarget:self action:@selector(onForgetClick) forControlEvents:UIControlEventTouchUpInside];
    [subBackground addSubview:btnForget];
    
    #pragma mark - 自动登录
    UIButton* btnAutoLogin=[UIButton buttonWithType:UIButtonTypeCustom];
    btnAutoLogin.frame=CGRectMake(170, 280, 130, 40);
    btnAutoLogin.titleLabel.font=[UIFont boldSystemFontOfSize:15];
    [btnAutoLogin setTitle:@"允许自动登录" forState:UIControlStateNormal];
    [btnAutoLogin setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    btnAutoLogin.showsTouchWhenHighlighted=YES;
    [btnAutoLogin setImage:[UIImage imageNamed:@"auto_login_frame"] forState:UIControlStateNormal];
    [btnAutoLogin setImage:[UIImage imageNamed:@"auto_login2"] forState:UIControlStateSelected];
    BOOL b=[[[NSUserDefaults standardUserDefaults] objectForKey:@"autoLogin"] boolValue];
    btnAutoLogin.selected = b;
    [btnAutoLogin addTarget:self action:@selector(onAutoLoginClick:) forControlEvents:UIControlEventTouchUpInside];
    [subBackground addSubview:btnAutoLogin];
    
    #pragma mark - 文字提醒
    UITextView* tipsView=[[UITextView alloc] initWithFrame:CGRectMake(20, self.view.bounds.size.height-140, 280, 100)];
    tipsView.backgroundColor=[UIColor clearColor];
    tipsView.textColor=[UIColor whiteColor];
    tipsView.font=[UIFont systemFontOfSize:13];
    tipsView.text=@"友情提示：\n☞ 设置自动登录系统将保存你的账号信息\n☞ 如果忘记密码，请点击忘记密码，使用绑定的手机找回";
    [tipsView setUserInteractionEnabled:NO];
    [subBackground addSubview:tipsView];
    #pragma mark - 触摸收回键盘
    UITapGestureRecognizer* tapGesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    tapGesture.delegate=(id<UIGestureRecognizerDelegate>)self;
    [subBackground addGestureRecognizer:tapGesture];
    [self.view addSubview:subBackground];
}

#pragma mark - 隐藏navigationBar
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.navigationController.navigationBar.hidden=YES;
}

#pragma mark - 登录按钮
- (void)onLoginClick
{
    GateWayViewController *appViewController = [[GateWayViewController alloc]initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:appViewController animated:NO];
    appViewController.navigationController.navigationBar.hidden=NO;
//    #pragma mark - 登录信息判断
//    if (!usernameText||!usernameText.text||[@"" isEqualToString:[usernameText.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]])
//    {
//        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//        hud.mode = MBProgressHUDModeText;
//        hud.labelText = @"     请输入用户名！     ";
//        hud.margin = 10.f;
//        hud.yOffset = -60.f;
//        hud.removeFromSuperViewOnHide = YES;
//        [hud hide:YES afterDelay:2];
//        [usernameText becomeFirstResponder];
//        return;
//    }
//    if (!passwordText||!passwordText.text||[@"" isEqualToString:[passwordText.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]])
//    {
//        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//        hud.mode = MBProgressHUDModeText;
//        hud.labelText = @"     请输入密码！     ";
//        hud.margin = 10.f;
//        hud.yOffset = -60.f;
//        hud.removeFromSuperViewOnHide = YES;
//        [hud hide:YES afterDelay:2];
//        [passwordText becomeFirstResponder];
//        return;
//    }
//    
//    #pragma mark - 检测网络情况
//    
//    #pragma mark - 服务端，取返回值，
//    NSDictionary *rootDic = [UrlPost urlPOSTWithURL:@"http://jsglxt.suda.edu.cn/api_login.action" andObj1:usernameText.text andKey1:@"username" andObj2:passwordText.text andKey2:@"password"];
//    NSString *status = [rootDic objectForKey:@"status"];
//    
//    if ([status isEqualToString:@"0"])
//    {
//        UserEntity *userEntity = [[UserEntity alloc] init];
//        userEntity.username = usernameText.text;
//        userEntity.password = passwordText.text;
//        
//        if ([[NSUserDefaults standardUserDefaults] boolForKey:@"autoLogin"]) {
//            [[NSUserDefaults standardUserDefaults] setObject:usernameText.text forKey:@"username"];
//            [[NSUserDefaults standardUserDefaults] synchronize];
//            
//            [[NSUserDefaults standardUserDefaults] setObject:passwordText.text forKey:@"password"];
//            [[NSUserDefaults standardUserDefaults] synchronize];
//        }
//        
//        GateWayViewController *appViewController = [[GateWayViewController alloc]initWithNibName:nil bundle:nil];
//        [self.navigationController pushViewController:appViewController animated:YES];
//    }
//    else
//    {
//        UIAlertView * alert= [[UIAlertView alloc]initWithTitle:nil message:@"用户名密码不正确，请重新输入！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//        [alert show];
//    }
}

#pragma mark - 返回按钮
- (void)onBackClick
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - 忘记密码按钮
- (void)onForgetClick
{
    
}

#pragma mark - 自动登录按钮
-(void)onAutoLoginClick:(UIButton*)btn
{
    btn.selected=!btn.selected;
    [[NSUserDefaults standardUserDefaults] setBool:btn.selected forKey:@"autoLogin"];
    [[NSUserDefaults standardUserDefaults] synchronize];
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
