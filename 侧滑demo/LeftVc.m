//
//  LeftVc.m
//  侧滑demo
//
//  Created by 征里 on 16/7/11.
//  Copyright © 2016年 征里. All rights reserved.
//

#import "LeftVc.h"
#import "UIView+Extension.h"
#define testValue 300
@implementation LeftVc


- (instancetype)init{
    if (self = [super init]) {
        self.tabelViewLeft = testValue;
    }
    return self;
}
- (void)viewDidLoad{
    

    UIView *tableview = [[UIView alloc] init];
    

    tableview.frame = CGRectMake(self.view.width - testValue, 0, testValue, self.view.height);
    
    tableview.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:tableview];

}
@end
