//
//  JWPhysicalViewController.m
//  FrontierConsulting
//
//  Created by qianfeng on 15/12/15.
//  Copyright © 2015年 井威. All rights reserved.
//

#import "JWPhysicalViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "NewsModel.h"
#import "FrontierConsutingDetail.h"
#import "PhysicalCell.h"
#import "PhysicalDetailViewController.h"
#import <MJRefresh/MJRefresh.h>
#import <MBProgressHUD/MBProgressHUD.h>

@interface JWPhysicalViewController ()<UITableViewDataSource,UITableViewDelegate> {
    UITableView *_tableView;
    NSMutableArray *_dataSource;
    
    AFHTTPRequestOperationManager *_manager;
    
}

@end


@implementation JWPhysicalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//   注册XIB
    UINib *xib = [UINib nibWithNibName:@"PhysicalCell" bundle:nil];
    [_tableView registerNib:xib forCellReuseIdentifier:@"cellID"];
    
    self.navigationItem.title = @"体育";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(pushNextViewController)];
    
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
    _manager = [AFHTTPRequestOperationManager manager];
    
    [self createTableView];
    
    [self MBProgressHUD];
    
   
}

- (void)pushNextViewController {
    PhysicalDetailViewController *PDVC = [[PhysicalDetailViewController alloc] init];
    
    PDVC.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:PDVC animated:YES];
    
}

- (void)MBProgressHUD {
    
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        NSLog(@"下拉刷新");
        [self loadDidFromNetWithURL:NO];
    }];
//   设置header
    _tableView.mj_header = header;
    
    MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        NSLog(@"上拉加载");
        [self loadDidFromNetWithURL:YES];
    }];
    _tableView.mj_footer = footer;
    
    [_tableView.mj_header beginRefreshing];
}

- (void)loadDidFromNetWithURL:(BOOL)isMore {
    
//    菊花出现
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
//    #define PHYSICALURL @"http://hot.news.cntv.cn/index.php?controller=list&action=getHandDataListInfoNew&handdata_id=TDAT1383126274316527&toutuNum=%ld"
    NSInteger toutu = 1;
    
    if (isMore) {
        if (_dataSource.count%12 != 0) {
            return;
        }
        toutu = _dataSource.count/12 + 1;
    }
    
    
    NSString *url = [NSString stringWithFormat:PHYSICALURL,toutu];
    
    
    [_manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        NewsModel *newsModel = [[NewsModel alloc] initWithDictionary:responseObject error:nil];
//        _dataSource = newsModel.itemList;
        if (isMore) {
            [_dataSource addObjectsFromArray:newsModel.itemList];
        } else {
            [_dataSource removeAllObjects];
            
            _dataSource = newsModel.itemList;
        }
        
        
        [_tableView reloadData];
        
        isMore ? [_tableView.mj_footer endRefreshing] : [_tableView.mj_header endRefreshing];
        
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
         isMore ? [_tableView.mj_footer endRefreshing] : [_tableView.mj_header endRefreshing];
        
    }];
    
    
    
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
    
    PhysicalCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"PhysicalCell" owner:nil options:nil] lastObject];
    
    ItemListModel *itemListModel = _dataSource[indexPath.row];
    
    [cell getData:itemListModel];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 85;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PhysicalDetailViewController *pdVC = [[PhysicalDetailViewController alloc] init];
    
    ItemListModel *model = [_dataSource objectAtIndex:indexPath.row];
    pdVC.detailUrl = model.detailUrl;
    pdVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:pdVC animated:YES];
}


@end
