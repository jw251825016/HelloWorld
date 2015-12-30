//
//  JWTabBarController.m
//  FrontierConsulting
//
//  Created by qianfeng on 15/12/15.
//  Copyright © 2015年 井威. All rights reserved.
//

#import "JWTabBarController.h"
#import "JWBaseViewController.h"
#import "JWHotViewController.h"
#import "JWSocietyViewController.h"
#import "JWPhysicalViewController.h"
#import "JWEconomyViewController.h"
#import "JWPoliticsViewController.h"
#import "UIView+Common.h"

@implementation JWTabBarController

- (void)viewDidLoad {
    
    [self creatViewControllers];
    [self createSplashView];
}

- (void)creatViewControllers {
    
    JWHotViewController *hotVC = [[JWHotViewController alloc] init];
    UINavigationController *hotNC = [[UINavigationController alloc] initWithRootViewController:hotVC];

    hotNC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"热点" image:[[UIImage imageNamed:@"tab_0"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]  selectedImage:[[UIImage imageNamed:@"tab_c0"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
 
    JWSocietyViewController *societyVC = [[JWSocietyViewController alloc] init];
    UINavigationController *societyNC = [[UINavigationController alloc] initWithRootViewController:societyVC];

    
    societyNC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"社会" image:[[UIImage imageNamed:@"tabbar_rank"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]  selectedImage:[[UIImage imageNamed:@"tabbar_rank_press"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];


    JWPhysicalViewController *physicalVC = [[JWPhysicalViewController alloc] init];
    UINavigationController *physicalNC = [[UINavigationController alloc] initWithRootViewController:physicalVC];

    
    physicalNC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"体育" image:[[UIImage imageNamed:@"tabbar_subject"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]  selectedImage:[[UIImage imageNamed:@"tabbar_subject_press"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];

    
    JWEconomyViewController *economyVC = [[JWEconomyViewController alloc] init];
    UINavigationController *economyNC = [[UINavigationController alloc] initWithRootViewController:economyVC];
    
    
    economyNC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"经济" image:[[UIImage imageNamed:@"jijin_new_tabbar"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]  selectedImage:[[UIImage imageNamed:@"jijin_new_tabbar_select"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];

    
    JWPoliticsViewController *politicsVC = [[JWPoliticsViewController alloc] init];
    UINavigationController *politicsNC = [[UINavigationController alloc] initWithRootViewController:politicsVC];
    
    
    politicsNC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"政治" image:[[UIImage imageNamed:@"gold_new_tabbar"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]  selectedImage:  [[UIImage imageNamed:@"gold_new_tabbar_select"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];

    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tab_black_bg"]];
    self.viewControllers = @[hotNC, societyNC, physicalNC,economyNC, politicsNC];
    
}

- (void)createSplashView {
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, screenWidth(), screenHeight())];
    
    NSString *splashPath = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"LaunchScreen"] ofType:@"png"];
    
    imgView.image = [[UIImage alloc] initWithContentsOfFile:splashPath];
    [self.view addSubview:imgView];
    
    [UIView animateWithDuration:3 animations:^{
        imgView.alpha = 0.0;
    } completion:^(BOOL finished) {
        [imgView removeFromSuperview];
    }];
    
    
}










@end
