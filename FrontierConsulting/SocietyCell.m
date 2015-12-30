//
//  SocietyCell.m
//  FrontierConsulting
//
//  Created by qianfeng on 15/12/19.
//  Copyright © 2015年 井威. All rights reserved.
//

#import "SocietyCell.h"
#import <UIImageView+WebCache.h>
#import "NewsModel.h"

@interface SocietyCell ()

@property (weak, nonatomic) IBOutlet UIImageView *IconIamge;

@property (weak, nonatomic) IBOutlet UILabel *TitleLabel;

@property (weak, nonatomic) IBOutlet UILabel *TimeLabel;


@end

@implementation SocietyCell

- (void)getData:(ItemListModel *)itemListModel {
//   加载图片
    ItemImageModel *imageModel = itemListModel.itemImage;
    
    NSURL *url = [NSURL URLWithString:imageModel.imgUrl1];
    
    [self.IconIamge sd_setImageWithURL:url];
    
//    获取标题
    self.TitleLabel.text = itemListModel.itemTitle;
//    获取时间
    self.TimeLabel.text = itemListModel.operate_time;
    
}
@end
