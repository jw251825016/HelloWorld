//
//  NavBarController.h
//  FrontierConsulting
//
//  Created by qianfeng on 15/12/17.
//  Copyright © 2015年 井威. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavBarController : UIViewController

@property (nonatomic, copy) NSString *requestUrl;

- (void)addNavgationItemWithImageName:(NSString *)imageName aSelector:(SEL)aSelector isLeft:(BOOL)isLeft;

@end
