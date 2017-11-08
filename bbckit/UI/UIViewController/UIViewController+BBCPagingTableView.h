//
//  UIViewController+BBCPagingTableView.h
//  BBCKit
//
//  Created by carusd on 16/7/28.
//  Copyright © 2016年 duowan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BBC_loadDataWithBeginId)(long long);
typedef void(^BBC_handleLoadedDataCallback)(id);
typedef NSArray *(^BBC_fetchDataFromRsp)(id);
typedef BOOL(^BBC_fetchIsNoMoreFromRsp)(id);
typedef long long (^BBC_fetchBeginIdFromRsp)(id);

@interface UIViewController (BBCPagingTableView)

@property (nonatomic, strong) UITableView *bbc_tableView;
@property (nonatomic, strong) UIView *bbc_noMoreIndicatorFooterView; // table footer view
@property (nonatomic, strong) UIView *bbc_hasMoreIndicatorFooterView; // table footer view

@property (nonatomic, strong) NSMutableArray *bbc_dataArray; // 所有数据
@property (nonatomic, readonly) BOOL bbc_noMore; // 是不是已经加载完所有数据
@property (nonatomic, readonly) long long bbc_beginId; // 比如饭盒的动态id，就需要这么大, 这个用NSString比较好
@property (nonatomic, readonly) BOOL bbc_loadingPagingData; // 是否加载中

@property (nonatomic, copy) BBC_loadDataWithBeginId bbc_loadDataWithBeginId;

- (void)monitorScrollWithScrollView:(UIScrollView *)scrollView;

- (void)prefetchingWithMonitorScrollView:(UIScrollView *)scrollView ratio:(CGFloat)ratio;

- (void)bbc_handleLoadedData:(id)rsp;
@property (nonatomic, copy) BBC_handleLoadedDataCallback bbc_handleLoadedDataCallback;
@property (nonatomic, copy) BBC_fetchDataFromRsp bbc_fetchDataFromRsp;
@property (nonatomic, copy) BBC_fetchIsNoMoreFromRsp bbc_fetchIsNoMoreFromRsp;
@property (nonatomic, copy) BBC_fetchBeginIdFromRsp bbc_fetchBeginIdFromRsp;

@end
