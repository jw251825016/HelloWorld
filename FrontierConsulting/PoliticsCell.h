//
//  PoliticsCell.h
//  FrontierConsulting
//
//  Created by qianfeng on 15/12/22.
//  Copyright © 2015年 井威. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"

@interface PoliticsCell : UITableViewCell

@property (nonatomic, copy) ItemListModel *itemListModel;

- (void)getData:(ItemListModel *)itemListModel;

@end
