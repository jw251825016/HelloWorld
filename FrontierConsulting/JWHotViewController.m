//
//  JWHotViewController.m
//  FrontierConsulting
//
//  Created by qianfeng on 15/12/15.
//  Copyright © 2015年 井威. All rights reserved.
//

#import "JWHotViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "FrontierConsutingDetail.h"
#import "NewsModel.h"
#import "HotNewsTableViewCell.h"
#import "HotDetailViewController.h"
#import <MJRefresh/MJRefresh.h>
#import <MBProgressHUD/MBProgressHUD.h>

@interface JWHotViewController ()<UITableViewDataSource, UITableViewDelegate> {
    UITableView *_tableView;
    AFHTTPRequestOperationManager *_manager;
    NSMutableArray *_dataSource;
 
    NSMutableArray *_dataArray;
    
    NSMutableArray *_scrollImageArr;
}

@end

@implementation JWHotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataSource = [[NSMutableArray alloc] init];
    _dataArray = [[NSMutableArray alloc]init];
    _scrollImageArr = [[NSMutableArray alloc]init];
    //   必须初始化，才能给他分配内存空间，要不然打印不出来数据
    _manager = [AFHTTPRequestOperationManager manager];
    self.navigationItem.title = @"热点";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(toNextViewController)];
    
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
//    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];
    
    [self createTableView];
    
    //   注册XIB
    
    UINib *nib = [UINib nibWithNibName:@"HotNewsTableViewCell" bundle:nil];
    
    [_tableView registerNib:nib forCellReuseIdentifier:@"cellID"];
    
    
    [self setMBProgressHUD];
}

- (void)toNextViewController {
    
    HotDetailViewController *HDVC = [[HotDetailViewController alloc] init];
    HDVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:HDVC animated:YES];
    
}

- (void)setMBProgressHUD {
    
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        //        NSLog(@"下拉刷新");
        [self loadDataFromNetWithURL:NO];
        
    }];
//设置header
    _tableView.mj_header = header;
    
    MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        //        NSLog(@"上拉刷新");
        [self loadDataFromNetWithURL:YES];
    }];
//    设置footer
    _tableView.mj_footer = footer;
//   刷新开始
    [_tableView.mj_header beginRefreshing];
    
}

- (void)loadDataFromNetWithURL:(BOOL)isMore {
    //    #define HOTURL @"http://hot.news.cntv.cn/index.php?controller=list&action=getHandDataListInfoNew&handdata_id=TDAT1372928688333145&toutuNum=%ld"
    //    if (isMore) {
    //        NSLog(@"上拉刷新");
    //    } else {
    //        NSLog(@"下拉刷新");
    //    }
//    大菊花出现
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    NSInteger toutuNum = 1;
    if (isMore) {
        if (_dataSource.count%10 != 0) {
            isMore?[_tableView.mj_footer endRefreshing]:[_tableView.mj_header endRefreshing];
            return;
        }
        toutuNum = _dataSource.count/10 + 1;
    }
    
    NSString *url = [NSString stringWithFormat:HOTURL, toutuNum];
//    NSLog(@"***%@", url);
    [_manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NewsModel *newsModel = [[NewsModel alloc] initWithDictionary:responseObject error:nil];
        
        if (!isMore) {
            [_dataSource removeAllObjects];
            [_tableView reloadData];
        }
//        else {
//            
//        }
        for (NSInteger i = 2; i < newsModel.itemList.count; i++) {
            [_dataArray addObject:newsModel.itemList[i]];
        }

        
        [_dataSource addObjectsFromArray:_dataArray];
        
        
        //_dataSource = newsModel.itemList;
        [_tableView reloadData];
        
        // 两种效果一样，把当前的 newsModel.itemList 里面的元素添加到数据源数组里面
#if 0
        //        for (ItemListModel *itemListModel in newsModel.itemList) {
        //            [_dataSource addObject:itemListModel];
        //        }
#elif 1
        //        [_dataSource addObjectsFromArray:newsModel.itemList];
#endif
        
        //        [_tableView reloadData];
        
        //数据加载成功后，根据 isMore 让上下拉刷新菊花关掉
        isMore?[_tableView.mj_footer endRefreshing]:[_tableView.mj_header endRefreshing];
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //数据加载失败后，根据 isMore 让上下拉刷新菊花关掉
        isMore?[_tableView.mj_footer endRefreshing]:[_tableView.mj_header endRefreshing];
//       菊花隐藏
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    }];
    
}

- (void)createTableView {
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 49 - 64) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _dataSource.count;
//    return _dataArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HotNewsTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"HotNewsTableViewCell" owner:nil options:nil] lastObject];
    //    把listModel从数组中取出来
    ItemListModel *listModel = _dataSource[indexPath.row];
    
    //    给cell赋值
    [cell getData:listModel];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HotDetailViewController *hdVC = [[HotDetailViewController alloc]init];
    ItemListModel *model = [_dataSource objectAtIndex:indexPath.row];
//    ItemListModel *model = [_dataArray objectAtIndex:indexPath.row];
    hdVC.detailUrl = model.detailUrl;
//    push后隐藏tableBar
    hdVC.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:hdVC animated:YES];
}

////显示头视图的方法
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    
//    _tableView.tableHeaderView = [self createScrollView];
//    return [self createScrollView];
//}

////创建scrollView
//- (UIScrollView *)createScrollView {
//
//    UIScrollView *scrollView = [[UIScrollView alloc]init];
//    
//    for (NSInteger i = 0; i < 5; i ++) {
//        UIImageView *view = [UIImageView new];
//        view.frame = CGRectMake(0, 0, self.view.frame.size.width
//                                , 100);
//        view.image = [UIImage imageNamed:@"yingyong@2x"];
//        view.userInteractionEnabled = YES;
//
//        UITapGestureRecognizer *tgr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTgr:)];
//        [view addGestureRecognizer:tgr];
//        
//        [_scrollImageArr addObject:view];
//        [scrollView addSubview:view];
//    }
//    scrollView.pagingEnabled = YES;
////    scrollView.frame = CGRectMake(0, 0, self.view.frame.size.width, 100);
//    scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 5, 100);
//    
////    scrollView.backgroundColor = [UIColor redColor];
//
//    return scrollView;
//}
//- (void)viewTgr:(UITapGestureRecognizer *)tgr {
//
//    
//}
////头视图的高度
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//
//    return  100;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 85;
}

@end
