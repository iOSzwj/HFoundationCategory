//
//  NSObject+Common.h
//  HBase
//  显示提示信息的分类
//  Created by jiyingxin on 15/6/19.
//  Copyright (c) 2015年 timShadow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Common)

//显示失败提示
- (void)showErrorMsg:(NSObject *)msg;
+ (void)showErrorMsg:(NSObject *)msg;

//显示成功提示
- (void)showSuccessMsg:(NSObject *)msg;
+ (void)showSuccessMsg:(NSObject *)msg;

// 显示等待消息
- (void)showWaitingMsg:(NSString *)msg;
+ (void)showWaitingMsg:(NSString *)msg;

//显示忙
- (void)showProgress;
+ (void)showProgress;

//隐藏提示
- (void)hideProgress;
+ (void)hideProgress;

/** 判断字符串是否为空 */
- (BOOL) isBlankString:(NSString *)string;
+ (BOOL) isBlankString:(NSString *)string;

@end
