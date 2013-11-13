//
//  GateWayModel.h
//  wirelessuda
//
//  Created by Mac on 13-11-13.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

typedef enum {
    Login,
    ChangePassWord,
} GateWayLine;

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "ASINetworkQueue.h"

@protocol GateWayDelegtate;

@interface GateWayModel : NSObject<ASIHTTPRequestDelegate>

@property (nonatomic,assign) id<GateWayDelegtate> delegate;
@property (nonatomic,retain) ASINetworkQueue *netWorkQueue;

+ (GateWayModel *)shareInstance;
- (void) startLogin:(NSString *)tag withUrl:(NSString *)url withParam1:(NSString *)param1 withParam2:(NSString *)param2 withParam3:(NSString *)param3 withParam4:(NSString *)param4;

@end
@protocol GateWayDelegtate <NSObject>

@optional
-(void)getLoginResult:(NSString *)status;

@end


