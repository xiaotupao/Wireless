//
//  ChangePasswordViewController.m
//  wirelessuda
//
//  Created by 叶帆 on 13-11-12.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "ChangePasswordViewController.h"
#import "MBProgressHUD.h"
#import "PasswordData.h"
#import "PasswordCellView.h"

@interface ChangePasswordViewController ()

@end

@implementation ChangePasswordViewController

@synthesize passwordArray;
@synthesize placeholderArray;

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
    
#pragma mark - 模块
    passwordArray = [NSMutableArray arrayWithObjects:@"原密码", @"新密码", @"确认密码", nil];
    placeholderArray = [NSMutableArray arrayWithObjects:@"请输入原密码", @"请输入新密码", @"请确认新密码", nil];
    
    for (int i = 0; i<[passwordArray count]; i++) {
        cell = [[PasswordCellView alloc]initWithFrame:CGRectMake(20, self.view.bounds.size.height - 170 + i*45, 280, 30)];
        cell.passName.text = [passwordArray objectAtIndex:i];
        cell.passText.tag = i;
        switch (cell.passText.tag) {
            case 0:
            {
                oldPsd = cell.passText;
            }
                break;
                
            case 1:
            {
                newPsd = cell.passText;
            }
                break;
                
            case 2:
            {
                conformPsd = cell.passText;
            }
                break;
                
            default:
                break;
        }
        [self.view addSubview:cell];
    }
    
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
    UILabel *response = [PasswordData judgePassword:oldPsd andNewPassword:newPsd andConfirmPassword:conformPsd];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = response.text;
    hud.margin = 12.0f;
    hud.yOffset = 180.0f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:2];
    NSLog(@"%@",hud.labelText);

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
