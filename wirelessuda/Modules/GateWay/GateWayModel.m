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
        NSLog(@"url=%@",urlString);
        ASIHTTPRequest *request=[ASIHTTPRequest requestWithURL:urlLast];
        request.delegate=self;
        request.tag=Login;
        [request startSynchronous];
        //[netWorkQueue addOperation:request];
    }
    else if ([tag isEqualToString:@"changePassword"]){
//        NSString *urlString = [NSString stringWithFormat:@"%@?%@&%@&%@",param1,param1];
        
//        [netWorkQueue addOperation:requestForm];
    }

    

}

#pragma mark－requestFinish回调函数
-(void)requestFinished:(ASIHTTPRequest *)request
{
    if (request.tag==Login) {
        [delegate getLoginResult:@"000000"];
    }
    //[delegate getLoginResult:@"000000"];
//    NSString *responseString=request.responseString;
//    if (request.tag==Login) {
//        if (responseString==nil) {
//            [delegate getLoginResult:@"0"];
//        }else{
//        NSDictionary *result=[responseString JSONValue];
//        NSString *status=[result objectForKey:@"status"];
//        [delegate getLoginResult:status];
//        }
//    }
//    else if (request.tag==ChangePassWord ){
//        NSDictionary *result = [responseString JSONValue];
//        NSString *status = [result objectForKey:@"status"];
//        [delegate getChangePasswordResult:status];
//    }
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


