//
//  EcononyDetailViewController.m
//  FrontierConsulting
//
//  Created by qianfeng on 15/12/22.
//  Copyright © 2015年 井威. All rights reserved.
//

#import "EcononyDetailViewController.h"

@interface EcononyDetailViewController ()

@property (nonatomic, copy) UIWebView *webView;

@end

@implementation EcononyDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.webView];
    
    [self fetchNetData];

}

- (UIWebView *)webView {
 
//    _webView = [[UIWebView alloc] init];
    if (_webView == nil) {
        _webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
     }
    
    return _webView;
}

- (void)fetchNetData {
    
    NSURL *url = [NSURL URLWithString:self.detailUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
//    加载数据
    [self.webView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
