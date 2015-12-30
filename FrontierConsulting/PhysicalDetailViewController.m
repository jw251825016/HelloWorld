//
//  PhysicalDetailViewController.m
//  FrontierConsulting
//
//  Created by qianfeng on 15/12/22.
//  Copyright © 2015年 井威. All rights reserved.
//

#import "PhysicalDetailViewController.h"

@interface PhysicalDetailViewController ()

@property (nonatomic, copy) UIWebView *webView;

@end

@implementation PhysicalDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.webView];
    
    [self fetchNetData];
}

- (UIWebView *)webView {
    
    if (_webView == nil) {
        _webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    }
    
    return _webView;
}

- (void)fetchNetData {
    
    NSURL *url = [NSURL URLWithString:self.detailUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
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
