//
//  GateWayViewController.h
//  wirelessuda
//
//  Created by ivanfee on 13-11-9.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChangePasswordView.h"

@interface GateWayViewController : UIViewController<ChangePasswordDelegate>
{
    CGFloat span;
}

@property (strong, nonatomic)UIImageView *userPhoto;
@property (strong, nonatomic)UILabel *userInfo;
@property (strong, nonatomic)UIButton *appButton;
@property (strong, nonatomic)NSMutableArray *appArray;
@property (strong, nonatomic)NSString *oldPsd;
@property (strong, nonatomic)NSString *changedPsd;
@property (strong, nonatomic)ChangePasswordView *changePasswordView;


@end
