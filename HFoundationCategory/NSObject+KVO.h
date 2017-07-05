//
//  NSObject+KVO.h
//  响应式编程
//
//  Created by hare27 on 16/5/29.
//  Copyright © 2016年 hare27. All rights reserved.
//  利用rumtime实现了观察者模式

#import <Foundation/Foundation.h>

@interface NSObject (KVO)

/** 自定义观察者*/
-(void)h_addObserver:(_Nonnull id)observer forKeyPath:( NSString * _Nonnull )keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;

@end
