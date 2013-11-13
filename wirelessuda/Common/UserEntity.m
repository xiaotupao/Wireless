//
//  UserEntity.m
//  wirelessuda
//
//  Created by Mac on 13-11-13.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "UserEntity.h"

@implementation UserEntity
@synthesize username,password;

+(UserEntity *) shareInstance
{
    UserEntity *userentity=[[UserEntity alloc]init];
    return userentity;
}
@end

