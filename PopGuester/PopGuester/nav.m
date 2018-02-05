//
//  nav.m
//  PopGuester
//
//  Created by apple on 2018/2/5.
//  Copyright © 2018年 yangchao. All rights reserved.
//

#import "nav.h"

@interface nav ()<UIGestureRecognizerDelegate>

@end

@implementation nav

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"interactive-%@",self.interactivePopGestureRecognizer);
    //<UIScreenEdgePanGestureRecognizer: 0x151ec4950; state = Possible; delaysTouchesBegan = YES; view = <UILayoutContainerView 0x151ea7b40>; target= <(action=handleNavigationTransition:, target=<_UINavigationInteractiveTransition 0x151ec4500>)>>
    
    //自定义 滑动返回，现将系统自带的 interactivePopGestureRecognizer 设置为NO；
    //然后创建PanGestureRecogniner .触发系统的target 和 action 。这样就必须先获取系统 的 target 和 action
    UIGestureRecognizer * gesture =self.interactivePopGestureRecognizer;
    gesture.enabled = NO;
    UIView * gestureView = gesture.view;
    
    UIPanGestureRecognizer * pangesture = [[UIPanGestureRecognizer alloc]init];
    pangesture.delegate = self;
    [gestureView addGestureRecognizer:pangesture];
    
    //获取系统手势的 target 数组
    NSMutableArray * targets = [gesture valueForKey:@"_targets"];
    
    id gestureRegusterTarget = [targets firstObject];
    
    //获取target
    id navigationTarget = [gestureRegusterTarget valueForKey:@"_target"];
    
    /**
     *  通过前面的打印，我们从控制台获取出来它的方法签名。
     */
    SEL handleTransition = NSSelectorFromString(@"handleNavigationTransition:");
    /**
     *  创建一个与系统一模一样的手势，我们只把它的类改为UIPanGestureRecognizer
     */
    [pangesture addTarget:navigationTarget action:handleTransition];
}

-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    /**
     *  这里有两个条件不允许手势执行，1、当前控制器为根控制器；2、如果这个push、pop动画正在执行（私有属性）
     */
    return self.viewControllers.count != 1 && ![[self valueForKey:@"_isTransitioning"] boolValue];
}



@end
