//
//  GateWayModel.m
//  wirelessuda
//
//  Created by Mac on 13-11-13.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "GateWayModel.h"
#import "SBJson.h"

@implementation GateWayModel

@synthesize delegate;
@synthesize netWorkQueue;

-(id)init{
    if (self=[super init]) {
        if (!netWorkQueue) {
            netWorkQueue=[[ASINetworkQueue alloc]init];
            [netWorkQueue go];
        }
    }
    return self;
}

+(GateWayModel *)shareInstance
{
    GateWayModel *gateWayModel=[[GateWayModel alloc]init];
    return gateWayModel;
}
#pragma mark－ request入口
-(void)startLogin:(UserEntity *)userEntity
{
    NSString *loginUrl=[NSString stringWithFormat:@"http://jsglxt.suda.edu.cn/api_login.action?username=%@&password=%@",userEntity.username,userEntity.password];
    NSURL *url=[NSURL URLWithString:loginUrl];
    ASIHTTPRequest *request=[ASIHTTPRequest requestWithURL:url];
    request.delegate=self;
    request.tag=Login;
    [netWorkQueue addOperation:request];
}

#pragma mark－requestFinish回调函数
-(void)requestFinished:(ASIHTTPRequest *)request
{
    NSString *responseString=request.responseString;
    if (request.tag==Login) {
        NSMutableArray *result=[responseString JSONValue];
    }
}

@end
