//
//  NSString+Frame.h
//  wb
//
//  Created by hare27 on 16/3/1.
//  Copyright © 2016年 hare27. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (Frame)

-(CFStringRef)stringRef;

-(CGSize)sizeWithWidth:(CGFloat)width andFont:(UIFont *)font andLineSpace:(float)lineSpace;

-(CGSize)sizeWithSize:(CGSize)size andFont:(UIFont *)font andLineSpace:(float)lineSpace;

@end
