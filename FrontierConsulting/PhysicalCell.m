//
//  PhysicalCell.m
//  FrontierConsulting
//
//  Created by qianfeng on 15/12/21.
//  Copyright © 2015年 井威. All rights reserved.
//

#import "PhysicalCell.h"
#import "NewsModel.h"
#import <UIImageView+WebCache.h>


@interface PhysicalCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;


@end

@implementation PhysicalCell

-(void)getData:(ItemListModel *)itemListModel {
//   加载图片
    ItemImageModel *imageModel = itemListModel.itemImage;
    
    NSURL *url = [NSURL URLWithString:imageModel.imgUrl1];
    
    [self.iconImage sd_setImageWithURL:url];
//   获取标题
    self.titleLabel.text = itemListModel.itemTitle;
    
    
//    获取时间
    self.timeLabel.text = itemListModel.operate_time;
    
}

@end
