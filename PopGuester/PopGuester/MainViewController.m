//
//  MainViewController.m
//  PopGuester
//
//  Created by apple on 2018/2/5.
//  Copyright © 2018年 yangchao. All rights reserved.
//

#import "MainViewController.h"
#import "NextViewController.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NextViewController * nextView = [[NextViewController alloc]init];
    [self.navigationController pushViewController:nextView animated:YES];
}
@end
