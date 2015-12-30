//
//  NetRequestURL.h
//  LookAhead
//
//  Created by qianfeng on 15/9/1.
//  Copyright (c) 2015年 刘强. All rights reserved.
//

#ifndef LookAhead_NetRequestURL_h
#define LookAhead_NetRequestURL_h

#define MainURL @"http://hot.news.cntv.cn/index.php?"

//新闻详情页面
/*
 参数：
 id          :  ARTI1442042277214900
 */
#define DetailURL @"http://hot.news.cntv.cn/api/Content/contentinfo?"

//视屏地址：（需要获取新闻详情中的属性“guid”）
#define VideoURL @"http://asp.cntv.lxdns.com/asp/hls/450/0303000a/3/default/%@/450.m3u8"

//要闻——首页
/*
 参数：
 controller  :  list
 action      :  getHandDataInfoNew
 handdata_id :  TDAT1372928688333145
 n1          :  3
 n2          :  10
 toutuNum    :  3
 */
#define HotSpotParameter @[@"controller":@"list" , @"action",@"getHandDataInfoNew" , @"handdata_id":@"TDAT1372928688333145" ,@"n1":@"3" , @"n2":@"10" , @"toutuNum":@"3"]
//要闻——加载
/*
 参数：
 controller  :  list
 action      :  getHandDataListInfoNew
 handdata_id :  TDAT1372928688333145
 n           :  20
 p           :  2
 toutuNum    :  3
 */
#define LoadingHotSpotParameter @[@"controller":@"list" , @"action",@"getHandDataListInfoNew" , @"handdata_id":@"TDAT1372928688333145" ,@"n":@"20" , @"p":self.page , @"toutuNum":@"3"]

//时政——首页
/*
 参数：
 controller  :  list
 action      :  getHandDataInfoNew
 handdata_id :  TDAT1414661661499136
 n1          :  1
 n2          :  10
 toutuNum    :  1
 */
#define PoliticsParameter @[@"controller":@"list" , @"action",@"getHandDataInfoNew" , @"handdata_id":@"TDAT1414661661499136" ,@"n1":@"1" , @"n2":@"10" , @"toutuNum":@"1"]
//时政——加载
/*
 参数：
 controller  :  list
 action      :  getHandDataListInfoNew
 handdata_id :  TDAT1414661661499136
 n           :  10
 p           :  2
 toutuNum    :  1
 */
#define LoadingPoliticsParameter @[@"controller":@"list" , @"action",@"getHandDataListInfoNew" , @"handdata_id":@"TDAT1414661661499136" ,@"n":@"10" , @"p":self.page , @"toutuNum":@"1"]

//军事——首页
/*
 参数：
 controller  :  list
 action      :  getHandDataInfoNew
 handdata_id :  TDAT1383125722766236
 n1          :  1
 n2          :  10
 toutuNum    :  1
 */
#define MilitaryParameter @[@"controller":@"list" , @"action",@"getHandDataInfoNew" , @"handdata_id":@"TDAT1383125722766236" ,@"n1":@"1" , @"n2":@"10" , @"toutuNum":@"1"]
//军事——加载
/*
 参数：
 controller  :  list
 action      :  getHandDataListInfoNew
 handdata_id :  TDAT1383125722766236
 n           :  10
 p           :  2
 toutuNum    :  1
 */
#define LoadingMilitaryParameter @[@"controller":@"list" , @"action",@"getHandDataListInfoNew" , @"handdata_id":@"TDAT1383125722766236" ,@"n":@"10" , @"p":self.page , @"toutuNum":@"1"]

//体育——首页
/*
 参数：
 controller  :  list
 action      :  getHandDataInfoNew
 handdata_id :  TDAT1383126274316527
 n1          :  1
 n2          :  10
 toutuNum    :  1
 */
#define SportsParameter @[@"controller":@"list" , @"action",@"getHandDataInfoNew" , @"handdata_id":@"TDAT1383126274316527" ,@"n1":@"1" , @"n2":@"10" , @"toutuNum":@"1"]
//体育——加载
/*
 参数：
 controller  :  list
 action      :  getHandDataListInfoNew
 handdata_id :  TDAT1383126274316527
 n           :  10
 p           :  2
 toutuNum    :  1
 */
#define LoadingSportsParameter @[@"controller":@"list" , @"action",@"getHandDataListInfoNew" , @"handdata_id":@"TDAT1383126274316527" ,@"n":@"10" , @"p":self.page , @"toutuNum":@"1"]

//财经——首页
/*
 参数：
 controller  :  list
 action      :  getHandDataInfoNew
 handdata_id :  TDAT1383126577835657
 n1          :  1
 n2          :  10
 toutuNum    :  1
 */
#define EconomyParameter @[@"controller":@"list" , @"action",@"getHandDataInfoNew" , @"handdata_id":@"TDAT1383126577835657" ,@"n1":@"1" , @"n2":@"10" , @"toutuNum":@"1"]
//财经——加载
/*
 参数：
 controller  :  list
 action      :  getHandDataListInfoNew
 handdata_id :  TDAT1383126577835657
 n           :  10
 p           :  2
 toutuNum    :  1
 */
#define LoadingEconomyParameter @[@"controller":@"list" , @"action",@"getHandDataListInfoNew" , @"handdata_id":@"TDAT1383126577835657" ,@"n":@"10" , @"p":self.page , @"toutuNum":@"1"]

//社会——首页
/*
 参数：
 controller  :  list
 action      :  getHandDataInfoNew
 handdata_id :  TDAT1383126850500788
 n1          :  1
 n2          :  10
 toutuNum    :  1
 */
#define SocietyParameter @[@"controller":@"list" , @"action",@"getHandDataInfoNew" , @"handdata_id":@"TDAT1383126850500788" ,@"n1":@"1" , @"n2":@"10" , @"toutuNum":@"1"]
//社会——加载
/*
 参数：
 controller  :  list
 action      :  getHandDataListInfoNew
 handdata_id :  TDAT1383126850500788
 n           :  10
 p           :  2
 toutuNum    :  1
 */
#define LoadingSocietyParameter @[@"controller":@"list" , @"action",@"getHandDataListInfoNew" , @"handdata_id":@"TDAT1383126850500788" ,@"n":@"10" , @"p":@"%ld" , @"toutuNum":self.page]

//时间轴
/*
 controller   :  list
 action       :  scrollList
 n            :  10
 p            :  1
 */
#define TimeAxisURLParameter  @[@"controller":@"list" , @"action",@"scrollList" , @"n":@"10" , @"p":self.page]

//图解新闻
/*
 controller   :  list
 action       :  morelist
 handdata_id  :  TDAT1373943452289972
 n            :  10
 p            :  1
 */
#define PicturlNewsParameter @[@"controller":@"list" , @"action",@"morelist" , @"handdata_id":@"TDAT1373943452289972" ,@"n":@"10" , @"p":self.page]
#endif
