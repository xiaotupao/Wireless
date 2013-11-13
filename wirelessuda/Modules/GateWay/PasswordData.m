//
//  PasswordData.m
//  wirelessuda
//
//  Created by 叶帆 on 13-11-13.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "PasswordData.h"

@implementation PasswordData

+ (UILabel *)judgePassword:(UITextField *)beformPsdText andNewPassword:(UITextField *)newPsdText andConfirmPassword:(UITextField *)conformPsdText
{
    UILabel *response = [[UILabel alloc]init];
    
    if (!beformPsdText||!beformPsdText.text||[@"" isEqualToString:[beformPsdText.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]]) {
        response.text = @"    请输入原密码!     ";
        return response;
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
        response.text = @"    请输入新密码!     ";
        return response;
    }
    
    if ([newPsdText.text length]< 6) {
        response.text = @"    新密码长度太短!     ";
        return response;
    }
    
    if (!conformPsdText||!conformPsdText.text||[@"" isEqualToString:[conformPsdText.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]]) {
        response.text = @"    请确认新密码!     ";
        return response;
    }
    
    if (![conformPsdText.text isEqualToString:newPsdText.text]) {
        response.text = @"    两次输入不一致,请重新输入!     ";
        conformPsdText.text = nil;
        return response;
    }
    
    return response;
}

@end
