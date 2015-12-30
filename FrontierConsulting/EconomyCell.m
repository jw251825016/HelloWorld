//
//  EconomyCell.m
//  FrontierConsulting
//
//  Created by qianfeng on 15/12/21.
//  Copyright © 2015年 井威. All rights reserved.
//

#import "EconomyCell.h"
#import "NewsModel.h"
#import <UIImageView+WebCache.h>


@interface EconomyCell ()

@end

@implementation EconomyCell {
    
    UIImageView *_imageView;
    UILabel *_titleLabel;
    UILabel *_timeLabel;
    
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _imageView = [UIImageView new];
        [self.contentView addSubview:_imageView];
        
        _titleLabel = [UILabel new];
        [self.contentView addSubview:_titleLabel];
        
        _timeLabel = [UILabel new];
        [self.contentView addSubview:_timeLabel];
        
    }
    
    return self;
}

//设置尺寸必用的方法
- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGFloat leftPadding = 10;
    CGFloat topPadding = 15;
    
    _imageView.frame = CGRectMake(leftPadding, topPadding, 100, 70);
    /*
     
     搜索float float_ = CGRectGetMaxX(CGRect rect);返回矩形右边缘的坐标
     
     CGRectGetMaxY返回矩形顶部的坐标
     
     CGRectGetMidX返回矩形中心X的坐标
     
     CGRectGetMidY返回矩形中心Y的坐标
     
     CGRectGetMinX返回矩形左边缘的坐标
     
     CGRectGetMinY返回矩形底部的坐标
     */
    
    /*
     一般我们向cell中添加子视图，有两种方式
     
     1、[cell addSubview:]
     
     2、[cell.contentView addSubview:]
     
     区别在于进行cell编辑时，比如cell内容向左移或者右移时，第一种方式子视图不会移动，第二可以，所以这种情况一般使用第二种方式。
     
     还有在设置backgroundColor时，使用cell设置时左移或者右移颜色是不会变的，而用cell.contentCell设置时，移动后的空白会显示cell的默认颜色，这种情况视实际情况选择。
     
     其实这两种方式在大多数情况是一样，不用纠结。
     */
    _titleLabel.frame = CGRectMake(leftPadding + CGRectGetMaxX(_imageView.frame), CGRectGetMinY(_imageView.frame), 200, 40);
    _titleLabel.font = [UIFont systemFontOfSize:14];
    _titleLabel.numberOfLines = 0;

    
    _timeLabel.frame = CGRectMake(7*leftPadding + CGRectGetMaxX(_imageView.frame), CGRectGetMaxY(_imageView.frame)-topPadding, self.contentView.frame.size.width - 2*_imageView.frame.size.width, 15);
    _timeLabel.font = [UIFont systemFontOfSize:13];
    
}

- (void)getData:(ItemListModel *)itemListModel {
    _itemListModel = itemListModel;
    
    NSURL *url = [NSURL URLWithString:itemListModel.itemImage.imgUrl1];
//    而placeholder为预显示的图片
    [_imageView sd_setImageWithURL:url placeholderImage:nil];
    
    _titleLabel.text = itemListModel.itemTitle;
    
    _timeLabel.text = itemListModel.operate_time;
    
}









- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
