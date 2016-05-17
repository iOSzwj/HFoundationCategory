//
//  NSString+Frame.m
//  wb
//
//  Created by hare27 on 16/3/1.
//  Copyright © 2016年 hare27. All rights reserved.
//

#import "NSString+Frame.h"
#import <CoreText/CoreText.h>

@implementation NSString (Frame)

-(CFStringRef)stringRef{
    return (__bridge CFStringRef)self;
}

-(CGSize)sizeWithWidth:(CGFloat)width andFont:(UIFont *)font andLineSpace:(float)lineSpace{
    return [self sizeWithSize:CGSizeMake(width, MAXFLOAT) andFont:font andLineSpace:lineSpace];
}

-(CGSize)sizeWithSize:(CGSize)size andFont:(UIFont *)font andLineSpace:(float)lineSpace{
    CGFloat minimumLineHeight = font.pointSize;
    CGFloat maximumLineHeight = minimumLineHeight;
    
    CTFontRef fontRef = CTFontCreateWithName(font.fontName.stringRef, minimumLineHeight, NULL);
    CTLineBreakMode lineBreakMode = kCTLineBreakByWordWrapping;
    CTTextAlignment alignment = kCTTextAlignmentLeft;
    CTParagraphStyleRef style = CTParagraphStyleCreate((CTParagraphStyleSetting[6]){
        {kCTParagraphStyleSpecifierAlignment, sizeof(alignment), &alignment},
        {kCTParagraphStyleSpecifierMinimumLineHeight,sizeof(minimumLineHeight),&minimumLineHeight},
        {kCTParagraphStyleSpecifierMaximumLineHeight,sizeof(maximumLineHeight),&maximumLineHeight},
        {kCTParagraphStyleSpecifierMaximumLineSpacing, sizeof(lineSpace), &lineSpace},
        {kCTParagraphStyleSpecifierMinimumLineSpacing, sizeof(lineSpace), &lineSpace},
        {kCTParagraphStyleSpecifierLineBreakMode,sizeof(CTLineBreakMode),&lineBreakMode}
    },6);
    
    NSDictionary* attributes = [NSDictionary dictionaryWithObjectsAndKeys:(__bridge id)fontRef,(NSString*)kCTFontAttributeName,(__bridge id)style,(NSString*)kCTParagraphStyleAttributeName,nil];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:self attributes:attributes];
    CFAttributedStringRef attributedString = (__bridge CFAttributedStringRef)string;
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attributedString);
    CGSize result = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRangeMake(0, [string length]), NULL, size, NULL);
    CFRelease(framesetter);
    CFRelease(fontRef);
    CFRelease(style);
    string = nil;
    attributes = nil;
    return result;
}

@end
