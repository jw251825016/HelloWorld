//
//  PoliticsCell.m
//  FrontierConsulting
//
//  Created by qianfeng on 15/12/22.
//  Copyright © 2015年 井威. All rights reserved.
//

#import "PoliticsCell.h"
#import "NewsModel.h"
#import <UIImageView+WebCache.h>


@implementation PoliticsCell {
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

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGFloat leftPadding = 15;
    CGFloat topPadding = 10;
    
    _imageView.frame = CGRectMake(leftPadding, topPadding, 100, 70);
    
    _titleLabel.frame = CGRectMake(leftPadding + CGRectGetMaxX(_imageView.frame), CGRectGetMinX(_imageView.frame), 200, 40);
    _titleLabel.numberOfLines = 0;
    _titleLabel.font = [UIFont systemFontOfSize:15];
    
    _timeLabel.frame = CGRectMake(7*leftPadding + CGRectGetMaxX(_imageView.frame), CGRectGetMaxY(_imageView.frame)-topPadding, self.contentView.frame.size.width - 2*_imageView.frame.size.width, 15);
    _timeLabel.font = [UIFont systemFontOfSize:13];
    
}

- (void)getData:(ItemListModel *)itemListModel {
    _itemListModel = itemListModel;
    
    NSURL *url = [NSURL URLWithString:itemListModel.itemImage.imgUrl1];
    
    [_imageView sd_setImageWithURL:url];
    
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
