//
//  UIViewController+BBCPagingTableView.m
//  BBCKit
//
//  Created by carusd on 16/7/28.
//  Copyright © 2016年 duowan. All rights reserved.
//

#import "UIViewController+BBCPagingTableView.h"
#import <objc/runtime.h>


@implementation UIViewController (BBCPagingTableView)

- (void)monitorScrollWithScrollView:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.y + scrollView.frame.size.height + 20 >= scrollView.contentSize.height && self.bbc_loadingPagingData == NO && !self.bbc_noMore) {
        
        [self _bbc_loadDataWithBeginId:self.bbc_beginId];
    }
}

- (void)prefetchingWithMonitorScrollView:(UIScrollView *)scrollView ratio:(CGFloat)ratio{
    CGSize contentSize = scrollView.contentSize;
    CGPoint contentOffset = scrollView.contentOffset;
    
    if (ratio >= 1. || ratio < 0.5 ) ratio = 0.8;
    
    if ((contentOffset.y + CGRectGetHeight(scrollView.bounds)) / contentSize.height > ratio && self.bbc_loadingPagingData == NO && !self.bbc_noMore) {
        
        [self _bbc_loadDataWithBeginId:self.bbc_beginId];
    }
    
}

- (void)_bbc_loadDataWithBeginId:(long long)beginId {
    if (self.bbc_loadDataWithBeginId) {
        self.bbc_loadingPagingData = YES;
        self.bbc_loadDataWithBeginId(beginId);
    }
}

- (void)bbc_handleLoadedData:(id)rsp {
    if (self.bbc_fetchIsNoMoreFromRsp) {
        self.bbc_noMore = self.bbc_fetchIsNoMoreFromRsp(rsp);
        self.bbc_beginId = self.bbc_fetchBeginIdFromRsp(rsp);
        NSArray *incomingData = self.bbc_fetchDataFromRsp(rsp);
        [self.bbc_dataArray addObjectsFromArray:incomingData];
        self.bbc_loadingPagingData = NO;
        
        if (self.bbc_noMore) {
            self.bbc_tableView.tableFooterView = self.bbc_noMoreIndicatorFooterView;
        } else {
            self.bbc_tableView.tableFooterView = self.bbc_hasMoreIndicatorFooterView;
        }
    }
    
    if (self.bbc_handleLoadedDataCallback) {
        self.bbc_handleLoadedDataCallback(rsp);
    }
}

- (void)setBbc_tableView:(UITableView *)tableView {
    self.bbc_dataArray = [NSMutableArray array];
    objc_setAssociatedObject(self, (__bridge const void *)@"bbc_tableView", tableView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UITableView *)bbc_tableView {
    return objc_getAssociatedObject(self, (__bridge const void *)(@"bbc_tableView"));
}

- (void)setBbc_noMoreIndicatorFooterView:(UIView *)view {
    objc_setAssociatedObject(self, (__bridge const void *)@"bbc_noMoreIndicatorFooterView", view, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)bbc_noMoreIndicatorFooterView {
    return objc_getAssociatedObject(self, (__bridge const void *)(@"bbc_noMoreIndicatorFooterView"));
}

- (void)setBbc_hasMoreIndicatorFooterView:(UIView *)view {
    objc_setAssociatedObject(self, (__bridge const void *)@"bbc_hasMoreIndicatorFooterView", view, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)bbc_hasMoreIndicatorFooterView {
    return objc_getAssociatedObject(self, (__bridge const void *)(@"bbc_hasMoreIndicatorFooterView"));
}

- (void)setBbc_dataArray:(NSMutableArray *)array {
    objc_setAssociatedObject(self, (__bridge const void *)@"bbc_dataArray", array, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableArray *)bbc_dataArray {
    return objc_getAssociatedObject(self, (__bridge const void *)(@"bbc_dataArray"));
}

- (void)setBbc_noMore:(BOOL)noMore {
    objc_setAssociatedObject(self, (__bridge const void *)@"bbc_noMore", @(noMore), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)bbc_noMore {
    NSNumber *noMoreNum = objc_getAssociatedObject(self, (__bridge const void *)(@"bbc_noMore"));
    return noMoreNum.boolValue;
}

- (void)setBbc_beginId:(long long)bbc_beginId {
    objc_setAssociatedObject(self, (__bridge const void *)@"bbc_beginId", @(bbc_beginId), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (long long)bbc_beginId {
    NSNumber *beginIdNum = objc_getAssociatedObject(self, (__bridge const void *)(@"bbc_beginId"));
    return beginIdNum.longLongValue;
}

- (void)setBbc_loadingPagingData:(BOOL)loadingPagingData {
    objc_setAssociatedObject(self, (__bridge const void *)@"bbc_loadingPagingData", @(loadingPagingData), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)bbc_loadingPagingData {
    NSNumber *loadingPagingDataNum = objc_getAssociatedObject(self, (__bridge const void *)(@"bbc_loadingPagingData"));
    return loadingPagingDataNum.boolValue;
}


- (void)setBbc_loadDataWithBeginId:(BBC_loadDataWithBeginId)bbc_loadDataWithBeginId {
    objc_setAssociatedObject(self, (__bridge const void *)@"bbc_loadDataWithBeginId", bbc_loadDataWithBeginId, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (BBC_loadDataWithBeginId)bbc_loadDataWithBeginId {
    return objc_getAssociatedObject(self, (__bridge const void *)(@"bbc_loadDataWithBeginId"));
}

- (void)setBbc_handleLoadedDataCallback:(BBC_handleLoadedDataCallback)bbc_handleLoadedDataCallback {
    objc_setAssociatedObject(self, (__bridge const void *)@"bbc_handleLoadedDataCallback", bbc_handleLoadedDataCallback, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (BBC_handleLoadedDataCallback)bbc_handleLoadedDataCallback {
    return objc_getAssociatedObject(self, (__bridge const void *)(@"bbc_handleLoadedDataCallback"));
}

- (void)setBbc_fetchDataFromRsp:(BBC_fetchDataFromRsp)bbc_fetchDataFromRsp {
    objc_setAssociatedObject(self, (__bridge const void *)@"bbc_fetchDataFromRsp", bbc_fetchDataFromRsp, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (BBC_fetchDataFromRsp)bbc_fetchDataFromRsp {
    return objc_getAssociatedObject(self, (__bridge const void *)(@"bbc_fetchDataFromRsp"));
}

- (void)setBbc_fetchIsNoMoreFromRsp:(BBC_fetchIsNoMoreFromRsp)bbc_fetchIsNoMoreFromRsp {
    objc_setAssociatedObject(self, (__bridge const void *)@"bbc_fetchIsNoMoreFromRsp", bbc_fetchIsNoMoreFromRsp, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (BBC_fetchIsNoMoreFromRsp)bbc_fetchIsNoMoreFromRsp {
    return objc_getAssociatedObject(self, (__bridge const void *)(@"bbc_fetchIsNoMoreFromRsp"));
}

- (void)setBbc_fetchBeginIdFromRsp:(BBC_fetchBeginIdFromRsp)bbc_fetchBeginIdFromRsp {
    objc_setAssociatedObject(self, (__bridge const void *)@"bbc_fetchBeginIdFromRsp", bbc_fetchBeginIdFromRsp, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (BBC_fetchBeginIdFromRsp)bbc_fetchBeginIdFromRsp {
    return objc_getAssociatedObject(self, (__bridge const void *)(@"bbc_fetchBeginIdFromRsp"));
}

@end
