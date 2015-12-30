//
//  DetailViewController.m
//  FrontierConsulting
//
//  Created by qianfeng on 15/12/17.
//  Copyright © 2015年 井威. All rights reserved.
//

#import "DetailViewController.h"
#import <WebKit/WebKit.h>


@interface DetailViewController ()
{
    WKWebView *_webView;
}
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createWebView];
}

- (void)createWebView
{
    _webView = [[WKWebView alloc] init];
    _webView.frame = self.view.bounds;
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.requestUrl]]];
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
