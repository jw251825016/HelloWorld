//
//  JWEconomyViewController.m
//  FrontierConsulting
//
//  Created by qianfeng on 15/12/15.
//  Copyright © 2015年 井威. All rights reserved.
//

#import "JWEconomyViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "EconomyCell.h"
#import "FrontierConsutingDetail.h"
#import "NewsModel.h"
#import "EcononyDetailViewController.h"
#import <MJRefresh/MJRefresh.h>
#import <MBProgressHUD/MBProgressHUD.h>

@interface JWEconomyViewController ()<UITableViewDataSource, UITableViewDelegate>{
    UITableView *_tableView;
    NSMutableArray *_dataSource;
    AFHTTPRequestOperationManager *_manager;
    
    
}

@end

@implementation JWEconomyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _manager = [AFHTTPRequestOperationManager manager];
    
    _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    self.title = @"经济";
    
    [self createNavigationRightButtonWithTitle:@"设置" target:self action:@selector(pushNextViewController)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
    [self createTableView];
    
    [self MBProgtessHUD];
    
}

- (void)createNavigationRightButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action {
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:title style:UIBarButtonItemStylePlain target:target action:action];
    
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)pushNextViewController {
    EcononyDetailViewController *EDVC = [[EcononyDetailViewController alloc] init];
    
    EDVC.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:EDVC animated:YES];
}

- (void)MBProgtessHUD {
    
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        NSLog(@"下拉刷新");
        
        [self loadDataFromNetWithURL:NO];
    }];
    _tableView.mj_header = header;
    
    MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        NSLog(@"上拉刷新");
        [self loadDataFromNetWithURL:YES];
    }];
    _tableView.mj_footer = footer;
    
    [_tableView.mj_header beginRefreshing];
}

- (void)loadDataFromNetWithURL:(BOOL)isMore {
    
//    #define ECONOMYURL @"http://hot.news.cntv.cn/index.php?controller=list&action=getHandDataListInfoNew&handdata_id=TDAT1383126577835657&toutuNum=%ld"
    
    NSInteger toutu = 1;
    
    if (isMore) {
        if (_dataSource.count %12 != 0) {
            return;
        }
        toutu = _dataSource.count/12 +1;
    }
    NSString *url = [NSString stringWithFormat:ECONOMYURL,toutu];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [_manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {

        
        
        NewsModel *newsModel = [[NewsModel alloc] initWithData:responseObject error:nil];
        if (isMore) {
            [_dataSource addObjectsFromArray:newsModel.itemList];
        } else {
            [_dataSource removeAllObjects];
            _dataSource = newsModel.itemList;
        }
        
//        _dataSource = newsModel.itemList;
        
        [_tableView reloadData];
        
        isMore ? [_tableView.mj_footer endRefreshing] : [_tableView.mj_header endRefreshing];
        
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

- (EconomyCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   static NSString *cellId = @"cellID";
    EconomyCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[EconomyCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    
//    cell的右边有一个小箭头
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.backgroundColor = [UIColor clearColor];
//   cell选中样式什么都没有
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    }
    ItemListModel *itemListModel = _dataSource[indexPath.row];
    
    [cell getData:itemListModel];
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 85;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    EcononyDetailViewController *deVC = [[EcononyDetailViewController alloc] init];
//    _dataSource[indexPath.row];
    ItemListModel *model = [_dataSource objectAtIndex:indexPath.row];
    
    deVC.detailUrl = model.detailUrl;
    deVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:deVC animated:YES];
    
}






@end
