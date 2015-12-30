//
//  JWBaseViewController.m
//  FrontierConsulting
//
//  Created by qianfeng on 15/12/15.
//  Copyright © 2015年 井威. All rights reserved.
//

#import "JWBaseViewController.h"
#import <AFNetworking/AFNetworking.h>
#import <MJRefresh/MJRefresh.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import "NavBarController.h"

@interface JWBaseViewController ()<UITableViewDelegate,UITableViewDataSource> {
    UITableView *_tableView;
    NSMutableArray *_dataSource;
    AFHTTPRequestOperationManager *_manager;
}

@end

@implementation
     JWBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//   设置导航条的背景图
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"widgettop_bg_big_1"] forBarMetrics:UIBarMetricsDefault];
    

}





@end
