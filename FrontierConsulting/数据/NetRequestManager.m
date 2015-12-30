//
//  NetRequestManager.m
//  LimitFree
//
//  Created by Hailong.wang on 15/8/26.
//  Copyright (c) 2015年 Hailong.wang. All rights reserved.
//

#import "NetRequestManager.h"

static NetRequestManager *manager = nil;

@implementation NetRequestManager

+ (NetRequestManager *)manager {
    @synchronized (self) {
        if (!manager) {
            manager = [[NetRequestManager alloc] init];
        }
    }
    return manager;
}

//GET请求
+ (void)GET:(NSString *)urlString parame:(NSDictionary *)dict succes:(SuccesCallback)succes failed:(FailedCallback)failed {
    [manager GET:urlString parame:dict succes:succes failed:failed];
}

//POST请求
+ (void)POST:(NSString *)urlString parame:(NSDictionary *)dict succes:(SuccesCallback)succes failed:(FailedCallback)failed {
    [manager POST:urlString parame:dict succes:succes failed:failed];
}

- (id)init {
    self = [super init];
    if (self) {
        _manager = [AFHTTPRequestOperationManager manager];
    }
    return self;
}

//GET请求
- (void)GET:(NSString *)urlString parame:(NSDictionary *)dict succes:(SuccesCallback)succes failed:(FailedCallback)failed {
    _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [_manager GET:urlString parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        succes(operation, responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failed(operation, error);
    }];
}

//POST请求
- (void)POST:(NSString *)urlString parame:(NSDictionary *)dict succes:(SuccesCallback)succes failed:(FailedCallback)failed {
    [_manager POST:urlString parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        succes(operation, responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failed(operation, error);
    }];
}

@end



