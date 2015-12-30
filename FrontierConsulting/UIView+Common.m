//
//  UIView+Common.m
//  FrontierConsulting
//
//  Created by qianfeng on 15/12/15.
//  Copyright © 2015年 井威. All rights reserved.
//

#import "UIView+Common.h"

@implementation UIView (Common)

CGFloat screenWidth() {
    
    return [[UIScreen mainScreen] bounds].size.width;
    
}


CGFloat screenHeight() {
    return [[UIScreen mainScreen] bounds].size.height;
}

@end
