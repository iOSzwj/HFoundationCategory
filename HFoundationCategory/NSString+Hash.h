//
//  NSString+Hash.h
//
//  Created by Tom Corwine on 5/30/12..
//

#import <Foundation/Foundation.h>


//密码加密
@interface NSString (Hash)

@property (readonly) NSString *md5String;
@property (readonly) NSString *sha1String;
@property (readonly) NSString *sha256String;
@property (readonly) NSString *sha512String;

- (NSString *)hmacSHA1StringWithKey:(NSString *)key;
- (NSString *)hmacSHA256StringWithKey:(NSString *)key;
- (NSString *)hmacSHA512StringWithKey:(NSString *)key;


/** 字符串转des加密字符串*/
- (NSString *)base64StringFromKye:(NSString *)key;

/** 解密des字符串*/
- (NSString *)decodingFromBase64StringWithKye:(NSString *)key;

@end
