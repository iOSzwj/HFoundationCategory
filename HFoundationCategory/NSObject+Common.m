//
//  NSObject+Common.m
//  FDPublic
//
//  Created by 刘伟 on 15/6/19.
//  Copyright (c) 2015年 timShadow. All rights reserved.
//

#import "NSObject+Common.h"
#import "MBProgressHUD.h"

#define kToastDuration     1

@implementation NSObject (Common)

//显示失败提示
+ (void)showErrorMsg:(NSObject *)msg{
    [self hideProgress];
    MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:[self currentView] animated:YES];
    progressHUD.mode = MBProgressHUDModeText;
    
    //    progressHUD.labelText = msg.description;
    //    [progressHUD hide:YES afterDelay:kToastDuration];
    
    progressHUD.label.text = msg.description;
    [progressHUD hideAnimated:YES afterDelay:kToastDuration];
    
}
//显示失败提示
- (void)showErrorMsg:(NSObject *)msg{
    [self.class showErrorMsg:msg];
}

//显示成功提示
+ (void)showSuccessMsg:(NSObject *)msg{
    [self hideProgress];
    MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:[self currentView] animated:YES];
    progressHUD.mode = MBProgressHUDModeText;
    progressHUD.label.text = msg.description;
    [progressHUD hideAnimated:YES afterDelay:kToastDuration];
}
//显示成功提示
- (void)showSuccessMsg:(NSObject *)msg{
    [self.class showSuccessMsg:msg];
}

// 显示等待消息
+ (void)showWaitingMsg:(NSString *)msg{
    [self hideProgress];
    MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:[self currentView] animated:YES];
    progressHUD.mode = MBProgressHUDModeIndeterminate;
    progressHUD.label.text = msg;
}
// 显示等待消息
- (void)showWaitingMsg:(NSString *)msg{
    [self.class showWaitingMsg:msg];
}

//显示忙
+ (void)showProgress{
    MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:[self currentView] animated:YES];
    [progressHUD hideAnimated:YES afterDelay:kToastDuration];
}
//显示忙
- (void)showProgress{
    [self.class showProgress];
}

//隐藏提示
+ (void)hideProgress{
    [MBProgressHUD hideHUDForView:[self currentView] animated:YES];
}
//隐藏提示
- (void)hideProgress{
    [self.class hideProgress];
}

/** 判断字符串是否为空 */
+ (BOOL) isBlankString:(NSString *)string{
    if ([string isKindOfClass:[NSString class]] == NO) {
        return YES;
    }
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if([string isEqualToString:@"(null)"]){
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}
/** 判断字符串是否为空 */
- (BOOL) isBlankString:(NSString *)string{
    return [self.class isBlankString:string];
}

+ (UIView *)currentView{
    UIViewController *controller = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    
    if ([controller isKindOfClass:[UITabBarController class]]) {
        controller = [(UITabBarController *)controller selectedViewController];
    }
    if([controller isKindOfClass:[UINavigationController class]]) {
        controller = [(UINavigationController *)controller visibleViewController];
    }
    if (!controller) {
        return [UIApplication sharedApplication].keyWindow;
    }
    return controller.view;
}
- (UIView *)currentView{
    return [self.class currentView];
}

@end
