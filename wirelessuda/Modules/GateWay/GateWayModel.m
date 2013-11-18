//
//  GateWayModel.m
//  wirelessuda
//
//  Created by Mac on 13-11-13.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "GateWayModel.h"
#import "SBJson.h"
#import "ASIHTTPRequest.h"

@implementation GateWayModel

@synthesize delegate;

+(GateWayModel *)shareInstance
{
    GateWayModel *gateWayModel=[[GateWayModel alloc]init];
    return gateWayModel;
}

#pragma mark－ request入口
- (void) start:(NSString *)tag withUrl:(NSString *)url withParam1:(NSString *)param1 withParam2:(NSString *)param2 withParam3:(NSString *)param3 withParam4:(NSString *)param4;
{
    if ([tag isEqualToString:@"login"]) {
        NSString *urlString = [NSString stringWithFormat:@"%@?username=%@&password=%@",url,param1,param2];
        NSURL *urlLast=[NSURL URLWithString:urlString];
        ASIHTTPRequest *request=[ASIHTTPRequest requestWithURL:urlLast];
        request.delegate=self;
        request.tag=Login;
        [request startSynchronous];
    }
    else if ([tag isEqualToString:@"changePassword"]){
        NSString *urlString = [NSString stringWithFormat:@"%@?username=%@&password=%@&newPassword=%@",url,param1,param2,param3];
        NSURL *urlLast=[NSURL URLWithString:urlString];
        ASIHTTPRequest *request=[ASIHTTPRequest requestWithURL:urlLast];
        request.delegate=self;
        request.tag=ChangePassWord;
        [request startSynchronous];
    }

    

}

#pragma mark－requestFinish回调函数
-(void)requestFinished:(ASIHTTPRequest *)request
{
    NSString *responseString=request.responseString;
    if (request.tag==Login) {
        if (responseString==nil) {
            [delegate getLoginResult:@"1"];
        }else{
            NSDictionary *result=[responseString JSONValue];
            NSString *status=[result objectForKey:@"status"];
            [delegate getLoginResult:status];
        }
    }
    else if (request.tag==ChangePassWord){
        if (responseString == nil) {
            [delegate getChangePasswordResult:@"1"];
        }else
        {
            NSDictionary *result = [responseString JSONValue];
            NSString *status = [result objectForKey:@"status"];
            [delegate getChangePasswordResult:status];
        }
    }
}

@end


