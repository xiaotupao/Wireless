//
//  PasswordData.h
//  wirelessuda
//
//  Created by 叶帆 on 13-11-13.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PasswordData : NSObject

+ (UILabel *)judgePassword:(UITextField *)beformPsdText andNewPassword:(UITextField *)newPsdText andConfirmPassword:(UITextField *)conformPsdText;

@end
