//
//  NetRequestManager.h
//  LimitFree
//
//  Created by Hailong.wang on 15/8/26.
//  Copyright (c) 2015年 Hailong.wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

//网络请求成功的回调
typedef void(^SuccesCallback)(AFHTTPRequestOperation *operation, id responseObject);
//网络请求失败的回调
typedef void(^FailedCallback)(AFHTTPRequestOperation *operation, NSError *error);

@interface NetRequestManager : NSObject {
    AFHTTPRequestOperationManager *_manager;
}

//初始化网络请求的控制器
+ (NetRequestManager *)manager;
//GET请求
+ (void)GET:(NSString *)urlString parame:(NSDictionary *)dict succes:(SuccesCallback)succes failed:(FailedCallback)failed;
//POST请求
+ (void)POST:(NSString *)urlString parame:(NSDictionary *)dict succes:(SuccesCallback)succes failed:(FailedCallback)failed;

@end








