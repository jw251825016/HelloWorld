//
//  JWPoliticsViewController.m
//  FrontierConsulting
//
//  Created by qianfeng on 15/12/15.
//  Copyright © 2015年 井威. All rights reserved.
//

#import "JWPoliticsViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "FrontierConsutingDetail.h"
#import "NewsModel.h"
#import "PoliticsCell.h"
#import "PoliticsViewController.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import <MJRefresh/MJRefresh.h>

@interface JWPoliticsViewController ()<UITableViewDataSource, UITableViewDelegate> {
    
    UITableView *_tableView;
    NSMutableArray *_dataSource;
    AFHTTPRequestOperationManager *_manager;
    
}

@end

@implementation JWPoliticsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _manager = [AFHTTPRequestOperationManager manager];
    _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    self.title = @"政治";
    [self createNavigationRightButtonWithTitle:@"设置" target:self action:@selector(pushNextViewController)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    [self createTableView];
    [self MBProgressHUD];
    
}

- (void)pushNextViewController {
    PoliticsViewController *PVC = [[PoliticsViewController alloc] init];
    PVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:PVC animated:YES];
}

- (void)createNavigationRightButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action {
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:title style:UIBarButtonItemStylePlain target:target action:action];
    self.navigationItem.rightBarButtonItem = rightItem;
    
}

- (void)MBProgressHUD {
    
   MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
       [self loadDataFromNetWithUrl:NO];
    }];
    _tableView.mj_header = header;
    
    MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self loadDataFromNetWithUrl:YES];
        
    }];
    _tableView.mj_footer = footer;
    
    [_tableView.mj_header beginRefreshing];
}

- (void)loadDataFromNetWithUrl:(BOOL)isMore {
    
    NSInteger toutu = 1;
    NSString *url = [NSString stringWithFormat:POLITICS,toutu];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    if (isMore) {
        if (_dataSource.count%12 != 0) {
            return;
        }
        toutu = _dataSource.count/12 +1;
    }
    
    [_manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NewsModel *newsModel = [[NewsModel alloc] initWithData:responseObject error:nil];
        
        if (isMore) {
            [_dataSource addObjectsFromArray:newsModel.itemList];
        } else {
            [_dataSource removeAllObjects];
            
            _dataSource = newsModel.itemList;
        }
    
        isMore ? [_tableView.mj_footer endRefreshing] : [_tableView.mj_header endRefreshing];
        [_tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        isMore ? [_tableView.mj_footer endRefreshing] : [_tableView.mj_header endRefreshing];
    }];
    
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    
}


- (void)createTableView {
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _dataSource.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cellID";
    PoliticsCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[PoliticsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
   
    ItemListModel *itemListmodel = [_dataSource objectAtIndex:indexPath.row];
    [cell getData:itemListmodel];
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 100;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PoliticsViewController *plVC = [[PoliticsViewController alloc] init];
    ItemListModel *model = [_dataSource objectAtIndex:indexPath.row];
    plVC.detailUrl = model.detailUrl;
    plVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:plVC animated:YES];
    
}

@end
