//
//  ChangePasswordViewController.h
//  wirelessuda
//
//  Created by 叶帆 on 13-11-12.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PasswordCellView.h"
#import "ASIHTTPRequest.h"
#import "GateWayModel.h"

@interface ChangePasswordViewController : UIViewController<GateWayDelegtate>
{
    PasswordCellView *cell;
    UITextField *oldPsd;
    UITextField *newPsd;
    UITextField *conformPsd;
}

@property (nonatomic, strong)NSMutableArray *passwordArray;
@property (nonatomic, strong)NSMutableArray *placeholderArray;
@property (nonatomic, strong)UIButton *confirm;
- (NSString *)getOldPsd;
- (NSString *)getNewPsd;
- (NSString *)getConformPsd;

@end
