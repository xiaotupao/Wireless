//
//  PasswordCellView.m
//  wirelessuda
//
//  Created by 叶帆 on 13-11-13.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "PasswordCellView.h"

@implementation PasswordCellView

@synthesize passName;
@synthesize passText;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
#pragma mark - passName
        passName = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 30)];
        passName.textAlignment = NSTextAlignmentCenter;
        passName.backgroundColor = [UIColor clearColor];
#pragma mark - passText
        passText = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 180, 30)];
        passText.borderStyle = UITextBorderStyleRoundedRect;
        passText.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        passText.secureTextEntry = YES;
                    
        [self addSubview:passName];
        [self addSubview:passText];
    }
    return self;
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
