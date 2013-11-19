//
//  ChangePasswordView.m
//  wirelessuda
//
//  Created by Mac on 13-11-19.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "ChangePasswordView.h"

@implementation ChangePasswordView
@synthesize oldPsdLabel,changedPsdLabel,confirmPsdLabel;
@synthesize oldPsdField,changedPsdField,confirmPsdField;
@synthesize confirmButton;
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        
        oldPsdLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, 80, 40)];
        oldPsdLabel.text=@"旧密码:";
        oldPsdField=[[UITextField alloc]initWithFrame:CGRectMake(100, 10, 200, 40)];
        oldPsdField.borderStyle=UITextBorderStyleLine;
        
        changedPsdLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 60, 80, 40)];
        changedPsdLabel.text=@"新密码:";
        changedPsdField=[[UITextField alloc]initWithFrame:CGRectMake(100, 60, 200, 40)];
        changedPsdField.borderStyle=UITextBorderStyleLine;
        
        confirmPsdLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 110, 80, 40)];
        confirmPsdLabel.text=@"确认密码";
        confirmPsdField=[[UITextField alloc]initWithFrame:CGRectMake(100, 110, 200, 40)];
        confirmPsdField.borderStyle=UITextBorderStyleLine;
        
        confirmButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        confirmButton.frame=CGRectMake(80, 160, 100, 40);
        [confirmButton setTitle:@"确认修改" forState:UIControlStateNormal];
        [confirmButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        confirmButton.titleLabel.font=[UIFont systemFontOfSize:20];
        [confirmButton addTarget:self action:@selector(confirmClicked:) forControlEvents:UIControlEventTouchUpInside];
        
#pragma mark - 触摸键盘消失
        UITapGestureRecognizer* tapGesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        tapGesture.delegate=(id<UIGestureRecognizerDelegate>)self;
        [self addGestureRecognizer:tapGesture];
	        
        [self addSubview:oldPsdLabel];
        [self addSubview:oldPsdField];
        [self addSubview:changedPsdLabel];
        [self addSubview:changedPsdField];
        [self addSubview:confirmPsdLabel];
        [self addSubview:confirmPsdField];
        [self addSubview:confirmButton];
    }
    return self;
}

-(void)confirmClicked:(id)sender
{
    [delegate getResult:@"0"];
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
    if (self.frame.origin.y==-85) {
        [UIView animateWithDuration:0.3 animations:^{
            self.frame=CGRectOffset(self.frame, 0, 85);
        }];
    }
    [self endEditing:YES];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
