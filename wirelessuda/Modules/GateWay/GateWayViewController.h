//
//  GateWayViewController.h
//  wirelessuda
//
//  Created by ivanfee on 13-11-9.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GateWayModel.h"
#import "ChangePasswordViewController.h"
#import "BandingPhoneViewController.h"

@interface GateWayViewController : UIViewController<GateWayDelegtate>
{
    ChangePasswordViewController *changeOpenView;
    BandingPhoneViewController *bandingOpenView;
    CGFloat span;
    UITextField *oldPsd;
    UITextField *newPsd;
    UITextField *conformPsd;
}

@property (strong, nonatomic)UIImageView *userPhoto;
@property (strong, nonatomic)UILabel *userInfo;
@property (strong, nonatomic)UIButton *appButton;
@property (strong, nonatomic)NSMutableArray *appArray;

@end
