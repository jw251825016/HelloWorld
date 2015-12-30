//
//  NewsModel.m
//  FrontierConsulting
//
//  Created by qianfeng on 15/12/19.
//  Copyright © 2015年 井威. All rights reserved.
//

#import "NewsModel.h"

@implementation ItemImageModel

//不请求空的数据，只请求不为空的数据，锅炉掉空的链接
+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}

@end

@implementation ItemListModel

+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}

@end

@implementation NewsModel

@end
