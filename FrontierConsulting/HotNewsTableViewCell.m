//
//  HotNewsTableViewCell.m
//  FrontierConsulting
//
//  Created by qianfeng on 15/12/19.
//  Copyright © 2015年 井威. All rights reserved.
//

#import "HotNewsTableViewCell.h"
#import <UIImageView+WebCache.h>

@interface HotNewsTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *IconView;

@property (weak, nonatomic) IBOutlet UILabel *TitleLabel;

@property (weak, nonatomic) IBOutlet UILabel *TimeLabel;


@end

@implementation HotNewsTableViewCell

- (void)getData:(ItemListModel *)listModel {
//    加载头像
//listModel.itemImage 的属性得赋给对象，所以用ItemImageModel创建对象来接受他
    ItemImageModel *imageModel = listModel.itemImage;
    

    NSURL *url = [NSURL URLWithString:imageModel.imgUrl1];
//    NSLog(@"%@",url);
//  从网络加载图片
    [self.IconView sd_setImageWithURL:url];
 
    
    //设置新闻的标题
    self.TitleLabel.text = listModel.itemTitle;
    
    //设置时间
    self.TimeLabel.text = listModel.operate_time;
}


@end
