//
//  NSObject+Model.m
//  runTimeDemo
//
//  Created by hare27 on 16/5/24.
//  Copyright © 2016年 hare27. All rights reserved.
//

#import "NSObject+Model.h"
#import <objc/runtime.h>





@implementation NSObject (Model)

/** 字典转模型*/
+(instancetype)objWithKeyValues:(NSDictionary *)dict{
    
    id obj = [[self alloc] init];
    
    // 用来标记属性列表的个数
    unsigned int ivarCount;
    
    // 获取类中的所有成员属性,并将属性列表的个数，赋值给count
    Ivar *ivarList = class_copyIvarList(self, &ivarCount);
    
    // 遍历所有成员属性
    for (int i = 0; i < ivarCount; i++) {
        
        Ivar ivar = ivarList[i];
        // 获取成员属性名_statuses
        NSString *name = [NSString stringWithUTF8String:ivar_getName(ivar)];
        // 成员属性名->字典中的key:_statuses->statuses
        NSString *key = [name substringFromIndex:1];
        
        // 获取字典中的value
        id value;
        // 排除系统关键字
        if ([self respondsToSelector:@selector(modelReplaceKeyForSystem)] ) {
            if ([self modelReplaceKeyForSystem][key]) {
                value = dict[[self modelReplaceKeyForSystem][key]];
            }else{
                value = dict[key];
            }
        }else{
            value = dict[key];
        }
        
        // 如果是字典
        if ([value isKindOfClass:[NSDictionary class]]) {
            // 获取成员变量的类型 @"HIndexStatusUserM"
            NSString *className = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
            // 转换@"HIndexStatusUserM"->HIndexStatusUserM
            NSRange range = [className rangeOfString:@"\""];
            className = [className substringFromIndex:range.location+range.length];
            range = [className rangeOfString:@"\""];
            className = [className substringToIndex:range.location];
            
            // 设置
            Class classM = NSClassFromString(className);
            value = [classM objWithKeyValues:value];
        
        // 如果是数组
        }else if([value isKindOfClass:[NSArray class]]){
            // 如果有实现这个方法
            if ([self respondsToSelector:@selector(modelClassForArr)]) {
                // 设置
                Class classModel = [self modelClassForArr][key];
                value = [classModel objArrWithKeyValuesArr:value];
            }
        }
        // value非nil才赋值
        if (value) {
            
            [obj setValue:value forKey:key];
        }
    }
    
    return obj;
}

/** 字典数组转模型数组*/
+(NSArray *)objArrWithKeyValuesArr:(NSArray<NSDictionary *> *)dictArr{
    NSMutableArray *marr = [NSMutableArray array];
    for (NSDictionary *dict in dictArr) {
        if ([dict isKindOfClass:[NSDictionary class]]) {
            [marr addObject:[self objWithKeyValues:dict]];
        }
    }
    return marr.count ? [marr copy] : nil;
}

@end
