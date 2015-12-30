//
//  JWSocietyViewController.m
//  FrontierConsulting
//
//  Created by qianfeng on 15/12/15.
//  Copyright © 2015年 井威. All rights reserved.
//

#import "JWSocietyViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "FrontierConsutingDetail.h"
#import "NewsModel.h"
#import "SocietyCell.h"
#import "SocietyDetailViewController.h"
#import <MJRefresh/MJRefresh.h>
#import <MBProgressHUD/MBProgressHUD.h>

@interface JWSocietyViewController () <UITableViewDataSource, UITableViewDelegate> {
    
    UITableView *_tableView;
    NSMutableArray *_dataSource;
    AFHTTPRequestOperationManager *_manager;
    
}

@end

@implementation JWSocietyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    导航条上正中间的标题
    self.navigationItem.title = @"社会";
//   设置导航条右边的标题
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(pushNextViewController)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
    _manager = [AFHTTPRequestOperationManager manager];
    
//    注册XIB
    
    UINib *nib = [UINib nibWithNibName:@"SocietyCell" bundle:nil];
    [_tableView registerNib:nib forCellReuseIdentifier:@"cellID"];
    
    
    [self createTableView];
    
    [self MBProgressHUD];
    

}

- (void)pushNextViewController {
    
    SocietyDetailViewController *SDVC = [[SocietyDetailViewController alloc] init];
    
    SDVC.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:SDVC animated:YES];
}

- (void)MBProgressHUD {
    
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        NSLog(@"下拉刷新");
        [self loadDataFromNetWithURL:NO];
    }];
//    设置header
    _tableView.mj_header = header;
    
    MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        NSLog(@"上拉刷新");
        [self loadDataFromNetWithURL:YES];
        
    }];
    _tableView.mj_footer = footer;
//    刷新开始
    [_tableView.mj_header beginRefreshing];
    
}


- (void)loadDataFromNetWithURL:(BOOL)isMore {
    
    //社会
//#define SOCIETYURL @"http://hot.news.cntv.cn/index.php?controller=list&action=getHandDataListInfoNew&handdata_id=TDAT1383126850500788&toutuNum=%ld"
    
//    菊花出现
//    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    NSInteger toutuNum = 1;
    
    NSString *url = nil;
    
    if (isMore) {
        if (_dataSource.count%12 != 0) {
            return;
        }
        toutuNum = _dataSource.count/12 + 1;
    }
    
    url = [NSString stringWithFormat:SOCIETYURL,toutuNum];
    NSLog(@"%@",url);
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
//        如果isMore为真，则结束上拉刷新，为假结束下拉刷新
        isMore?[_tableView.mj_footer endRefreshing]:[_tableView.mj_header endRefreshing];
//        菊花隐藏
//        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        isMore?[_tableView.mj_footer endRefreshing]:[_tableView.mj_header endRefreshing];
//        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        
    }];
    
    
    
    
}

- (void)createTableView {
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64-49) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
    SocietyCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"SocietyCell" owner:nil options:nil] lastObject];
//    把listModel从数组中取出来
    ItemListModel *itemListModel = _dataSource[indexPath.row];
    
//    给cell赋值
    [cell getData:itemListModel];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SocietyDetailViewController *sdVC = [[SocietyDetailViewController alloc]init];
    ItemListModel *model = [_dataSource objectAtIndex:indexPath.row];
    sdVC.detailUrl = model.detailUrl;
    
    sdVC.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:sdVC animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 85;
}



@end
