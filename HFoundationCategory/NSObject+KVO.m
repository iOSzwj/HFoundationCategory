//
//  NSObject+KVO.m
//  响应式编程
//
//  Created by hare27 on 16/5/29.
//  Copyright © 2016年 hare27. All rights reserved.
//

#import "NSObject+KVO.h"
#import <objc/runtime.h>

#define kObserverKey @"observerKey"
#define kKeyPathKey @"KeyPathKey"

@implementation NSObject (KVO)

/** 自定义观察者*/
-(void)h_addObserver:(_Nonnull id)observer forKeyPath:( NSString * _Nonnull )keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context{
    
    // 获取子类
    NSString *className = [NSString stringWithFormat:@"%@Sub",[self class]];
    Class subClass = NSClassFromString(className);
    
    // 获取失败，就创建
    if (subClass == nil) {
        subClass = objc_allocateClassPair([self class], className.UTF8String, 0);
        objc_registerClassPair(subClass);
    }
    
    // 添加属性
    objc_setAssociatedObject(self, kObserverKey, observer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, kKeyPathKey, keyPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    // 修改类型为子类
    object_setClass(self, subClass);
    
    // 获取对应的setter方法名
    // 获取首字母
    NSString *szm = [keyPath substringToIndex:1];
    char c = *(szm.UTF8String);
    c = c + 'A'-'a';
    NSString *keyPathSetName = [NSString stringWithFormat:@"set%c%@:",c,[keyPath substringFromIndex:1]];
    // 获取keyPath对应的方法
    SEL sel = NSSelectorFromString(keyPathSetName);
    Method targetMethod = class_getInstanceMethod(subClass, sel);
    // 交换两个方法的实现
    Method newMethod = class_getInstanceMethod(subClass, @selector(h_newSetter:));
    method_exchangeImplementations(targetMethod, newMethod);
}

-(void)h_newSetter:(id)obj{
    // 先执行对应的set方法
    [self performSelector:@selector(h_newSetter:) withObject:obj];
    // 再通知观察者，我发生了变化
    id observer = objc_getAssociatedObject(self, kObserverKey);
    if ([observer respondsToSelector:@selector(observeValueForKeyPath:ofObject:change:context:)]) {
        NSString *keyPath = objc_getAssociatedObject(self, kKeyPathKey);
        [observer observeValueForKeyPath:keyPath ofObject:nil change:@{@"new":obj} context:nil];
    }
}

@end
