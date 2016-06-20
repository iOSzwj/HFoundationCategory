//
//  NSString+file.m
//  YHappy
//
//  Created by hare27 on 16/6/20.
//  Copyright © 2016年 hare27. All rights reserved.
//

#import "NSString+file.h"

@implementation NSString (file)

-(long)fileSize{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDirectory = NO;
    if ([fileManager fileExistsAtPath:self isDirectory:&isDirectory]) {
        long fileSize = 0;
        if (isDirectory) {
            
            NSArray *filePathArr = [fileManager subpathsOfDirectoryAtPath:self error:nil];
            for (NSString *filePath in filePathArr) {
                NSString *fullSubpath = [self stringByAppendingPathComponent:filePath];
                fileSize += [fileManager attributesOfItemAtPath:fullSubpath error:nil].fileSize;
            }
            
        }else{
            fileSize = [fileManager attributesOfItemAtPath:self error:nil].fileSize;
        }
        return fileSize;
    }else{
        return 0;
    }
}

@end
