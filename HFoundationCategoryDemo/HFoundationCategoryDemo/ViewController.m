//
//  ViewController.m
//  HFoundationCategoryDemo
//
//  Created by hare27 on 16/5/29.
//  Copyright © 2016年 hare27. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
#import "NSObject+KVO.h"
#import "NSObject+Common.h"

@interface ViewController ()

@property(nonatomic,strong)Student *stu;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _stu = [Student new];
    
    //    [_stu addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    
    // 使用自定义的kvo方法
    [_stu h_addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
    NSLog(@"%@ %@",object,change[@"new"]);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    static int i = 0;
    i++;
    _stu.name = [NSString stringWithFormat:@"%d",i];
}
- (IBAction)show:(id)sender {
    [self showSuccessMsg:@"hello"];
}
- (IBAction)classShow:(id)sender {
    [ViewController showSuccessMsg:@"class"];
}


@end
