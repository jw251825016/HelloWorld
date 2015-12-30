//
//  NewsModel.h
//  FrontierConsulting
//
//  Created by qianfeng on 15/12/19.
//  Copyright © 2015年 井威. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface ItemImageModel : JSONModel

@property (nonatomic, copy) NSString *imgUrl1;
@property (nonatomic, copy) NSString *imgUrl3;
@property (nonatomic, copy) NSString *imgUrl2;


@end

@protocol ItemListModel
@end

@interface ItemListModel : JSONModel

@property (nonatomic, copy) NSString *pubDate;
@property (nonatomic, copy) NSString *detailUrl;
@property (nonatomic, copy) NSString *itemID;
@property (nonatomic, copy) NSString *tagDesc;
@property (nonatomic, copy) NSString *allow_praise;
@property (nonatomic, copy) NSString *itemType;
@property (nonatomic, copy) NSString *videoPlayID;
@property (nonatomic, copy) NSString *photoCount;
@property (nonatomic, copy) NSString *imageNum;
@property (nonatomic, copy) NSString *commentNum;
@property (nonatomic, copy) NSString *allow_share;
@property (nonatomic, copy) NSString *num;
@property (nonatomic, copy) NSString *operate_time;
@property (nonatomic, copy) NSString *videoLength;
@property (nonatomic, copy) NSString *allow_comment;
@property (nonatomic, copy) NSString *itemBrief;
@property (nonatomic, copy) NSString *itemTitle;
@property (nonatomic, copy) NSString *brief;
@property (nonatomic, copy) NSString *tagColor;
@property (nonatomic, strong) ItemImageModel *itemImage;
@end

@interface NewsModel : JSONModel

@property (nonatomic, copy) NSString *total;
@property (nonatomic, copy) NSString *serverTime;
@property (nonatomic, strong) NSMutableArray<ItemListModel> *itemList;



@end
