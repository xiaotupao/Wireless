//
//  GateWayModel.m
//  wirelessuda
//
//  Created by Mac on 13-11-13.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "GateWayModel.h"
#import "SBJson.h"
#import "ASIFormDataRequest.h"

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
- (void) start:(NSString *)tag withUrl:(NSString *)url withParam1:(NSString *)param1 withParam2:(NSString *)param2 withParam3:(NSString *)param3 withParam4:(NSString *)param4;
{
    if ([tag isEqualToString:@"login"]) {
        NSString *urlString = [NSString stringWithFormat:url,nil];
        ASIFormDataRequest *requestForm = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:urlString]];
        [requestForm setPostValue:param1 forKey:@"username"];
        [requestForm setPostValue:param2 forKey:@"password"];
        requestForm.delegate=self;
        requestForm.tag=Login;
        [netWorkQueue addOperation:requestForm];
    }
    else if ([tag isEqualToString:@"changePassword"]){
        NSString *urlString = [NSString stringWithFormat:url,nil];
        ASIFormDataRequest *requestForm = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:urlString]];
        [requestForm setPostValue:param1 forKey:@"username"];
        [requestForm setPostValue:param2 forKey:@"password"];
        [requestForm setPostValue:param3 forKey:@"newPassword"];
        requestForm.delegate = self;
        requestForm.tag = ChangePassWord;
        [netWorkQueue addOperation:requestForm];
    }

}

#pragma mark－requestFinish回调函数
-(void)requestFinished:(ASIHTTPRequest *)request
{
    NSString *responseString=request.responseString;
    if (request.tag==Login) {
        NSDictionary *result=[responseString JSONValue];
        NSString *status=[result objectForKey:@"status"];
        [delegate getLoginResult:status];
    }
    else if (request.tag==ChangePassWord ){
        NSDictionary *result = [responseString JSONValue];
        NSString *status = [result objectForKey:@"status"];
        [delegate getChangePasswordResult:status];
    }
}
//-(void)Demo
//{
//    GateWayModel *gateWayModel=[GateWayModel shareInstance];
//    [gateWayModel startLogin:Login withUrl:url withParam1:username withParam2:password withParam3:Nil withParam4:nil];
//    gateWayModel.delegate=self;
//}
//
//-(void)getLoginResult:(NSString *)status
//{
//
//}
@end


