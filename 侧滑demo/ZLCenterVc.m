



//
//  ZLCenterVc.m
//  侧滑demo
//
//  Created by 征里 on 16/7/11.
//  Copyright © 2016年 征里. All rights reserved.
//

#import "ZLCenterVc.h"

@implementation ZLCenterVc

- (void)viewDidLoad{
    self.view.backgroundColor = [UIColor grayColor];
 
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"123" style:UIBarButtonItemStylePlain target:self action:@selector(leftAction)];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(leftAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}


- (void)leftAction{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"leftAction" object:nil];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

@end
