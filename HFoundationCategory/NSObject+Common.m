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
- (void)showErrorMsg:(NSObject *)msg{
    [self hideProgress];
    MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:[self currentView] animated:YES];
    progressHUD.mode = MBProgressHUDModeText;
    
//    progressHUD.labelText = msg.description;
//    [progressHUD hide:YES afterDelay:kToastDuration];
    
    progressHUD.label.text = msg.description;
    [progressHUD hideAnimated:YES afterDelay:kToastDuration];
    
}

//显示成功提示
- (void)showSuccessMsg:(NSObject *)msg{
    [self hideProgress];
    MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:[self currentView] animated:YES];
    progressHUD.mode = MBProgressHUDModeText;
    //    progressHUD.labelText = msg.description;
    //    [progressHUD hide:YES afterDelay:kToastDuration];
    
    progressHUD.label.text = msg.description;
    [progressHUD hideAnimated:YES afterDelay:kToastDuration];
}

// 显示等待消息
- (void)showWaitingMsg:(NSString *)msg{
    [self hideProgress];
    MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:[self currentView] animated:YES];
    progressHUD.mode = MBProgressHUDModeIndeterminate;
    progressHUD.label.text = msg;
}


//显示忙
- (void)showProgress{
    MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:[self currentView] animated:YES];
//    [progressHUD hide:YES afterDelay:kToastDuration];
     [progressHUD hideAnimated:YES afterDelay:kToastDuration];
}

//隐藏提示
- (void)hideProgress{
//    [MBProgressHUD hideAllHUDsForView:[self currentView] animated:YES];
    [MBProgressHUD hideHUDForView:[self currentView] animated:YES];
}

/** 判断字符串是否为空 */
- (BOOL) isBlankString:(NSString *)string{
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

- (UIView *)currentView{
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

@end
