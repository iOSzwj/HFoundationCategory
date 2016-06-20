//
//  NSString+HRLegal.m
//  Email
//
//  Created by 张文军 on 15/8/19.
//  Copyright (c) 2015年 hare. All rights reserved.
//

#import "NSString+Legal.h"

@implementation NSString (Legal)

/** 判断字符串本身是否为合法的qq*/
-(BOOL)isQQ{
    // 第一个为1-9后面跟上4-10个数字
    NSString *pattern = @"^[1-9]\\d{4,10}$";
    return [self match:pattern];
}

/** 判断字符串本身是否为合法的邮箱账号*/
-(BOOL)isEmail{
    
    // 邮箱首位只能是数字或字母，后面跟数字或字母或下滑线,加@加邮箱后缀
    NSString *pattern = @"^[A-Z0-9a-z]{1}[A-Z0-9a-z_]@(qq.com|sohu.com||163.com||163.net||126.com||188.com||139.com||qq.vip.com||hotmail.com||gmail.com||TOM.com||foxmail.com||sina.com||yahoo.com||yahoo.cn||msn.cn||live.com)$";
    return [self match:pattern];
}

/** 判断字符串本身是否为合法的手机号*/
-(BOOL)isPhoneNumber{
    // 第一位是1，第二位是3578中得一位，后面跟9位的数字
    return [self match:@"^1[3578]{1}\\d{9}$"];
}

/** 判断字符串本身是否为合法的ip地址*/
-(BOOL)isIPAddress{
    // 192.168.0.1
    NSString *pattern = @"^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}$";
    return [self match:pattern];
}

/** 判断字符串本身是否为合法的URL*/
-(BOOL)isURL{
    // 192.168.0.1
    NSString *urlPattern = @"(http|ftp|https):\\/\\/[\\w\\-_]+(\\.[\\w\\-_]+)+([\\w\\-\\.,@?^=%&amp;:/~\\+#]*[\\w\\-\\@?^=%&amp;/~\\+#])?";
    return [self match:urlPattern];
}

/** 传入一个规则，判断自己是否符合这个规则*/
-(BOOL)match:(NSString *)pattern{
    
    NSPredicate *prediate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",pattern];
    
    return [prediate evaluateWithObject:self];
}

@end
