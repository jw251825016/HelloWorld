//
//  NavBarController.m
//  FrontierConsulting
//
//  Created by qianfeng on 15/12/17.
//  Copyright © 2015年 井威. All rights reserved.
//

#import "NavBarController.h"

@interface NavBarController ()

@end

@implementation NavBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)addNavgationItemWithImageName:(NSString *)imageName aSelector:(SEL)aSelector isLeft:(BOOL)isLeft {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 50, 50);
    UIImage *image = [UIImage imageNamed:imageName];
    
    [button setBackgroundImage:image forState:UIControlStateNormal];
    if (aSelector) {
        if ([self respondsToSelector:aSelector]) {
            [button addTarget:self action:aSelector forControlEvents:UIControlEventTouchUpInside];
        }
    }
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    if (isLeft) {
        self.navigationItem.leftBarButtonItem = barButtonItem;
    } else {
        self.navigationItem.rightBarButtonItem = barButtonItem;
    }
    
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
