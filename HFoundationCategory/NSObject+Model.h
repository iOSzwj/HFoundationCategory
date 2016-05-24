//
//  NSObject+Model.h
//  runTimeDemo
//
//  Created by hare27 on 16/5/24.
//  Copyright © 2016年 hare27. All rights reserved.
//  

#import <Foundation/Foundation.h>

@protocol HModelDelegate <NSObject>

@optional
/** 返回数组里包含的类型*/
+(NSDictionary<NSString *,Class> *)modelClassForArr;
/** 替换关键字,后一个放系统关键字:@{@"ID":@"id"}*/
+(NSDictionary<NSString *,NSString *> *)modelReplaceKeyForSystem;

@end


@interface NSObject (Model)<HModelDelegate>

/** 字典转模型*/
+(instancetype)objWithKeyValues:(NSDictionary *)dict;

/** 字典数组转模型数组*/
+(NSArray *)objArrWithKeyValuesArr:(NSArray<NSDictionary *> *)dictArr;

@end
