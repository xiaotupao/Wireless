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
#import "LoginViewController.h"

@interface ChangePasswordViewController ()

@end

@implementation ChangePasswordViewController

@synthesize passwordArray;
@synthesize placeholderArray;
@synthesize confirm;

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

    
#pragma mark - 触摸键盘消失
    UITapGestureRecognizer* tapGesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    tapGesture.delegate=(id<UIGestureRecognizerDelegate>)self;
    [self.view addGestureRecognizer:tapGesture];
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

- (NSString *)getOldPsd
{
    return oldPsd.text;
}

- (NSString *)getNewPsd
{
    return newPsd.text;
}

- (NSString *)getConformPsd
{
    return conformPsd.text;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
