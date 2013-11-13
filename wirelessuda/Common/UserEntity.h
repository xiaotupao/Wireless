//
//  UserEntity.h
//  wirelessuda
//
//  Created by Mac on 13-11-13.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserEntity : NSObject

@property(nonatomic, retain) NSString *username;
@property(nonatomic, retain) NSString *password;

+(UserEntity *) shareInstance;

@end
