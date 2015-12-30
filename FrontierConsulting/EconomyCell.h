//
//  EconomyCell.h
//  FrontierConsulting
//
//  Created by qianfeng on 15/12/21.
//  Copyright © 2015年 井威. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"

@interface EconomyCell : UITableViewCell
@property (nonatomic, copy) ItemListModel *itemListModel;

- (void)getData:(ItemListModel *)itemListModel;

@end
