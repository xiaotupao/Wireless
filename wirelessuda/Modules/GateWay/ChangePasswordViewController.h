//
//  ChangePasswordViewController.h
//  wirelessuda
//
//  Created by 叶帆 on 13-11-12.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangePasswordViewController : UIViewController
{
    UITextField *beformPsdText;
    UITextField *newPsdText;
    UITextField *conformPsdText;
}

@property (nonatomic, strong)NSMutableArray *passwordArray;
@property (nonatomic, strong)NSMutableArray *placeholderArray;

@end
