//
//  LeftVc.m
//  侧滑demo
//
//  Created by 征里 on 16/7/11.
//  Copyright © 2016年 征里. All rights reserved.
//

#import "LeftVc.h"
#import "UIView+Extension.h"
#import "Head.h"

@interface LeftVc()<UITableViewDelegate>

@end
@implementation LeftVc


- (void)viewDidLoad{
    
    UITableView *tableview = [[UITableView alloc] init];
    tableview.delegate = self;


    tableview.frame = CGRectMake(self.view.width - tableviewWidth, 0, tableviewWidth, self.view.height);
    
    tableview.backgroundColor = [UIColor whiteColor];
    
    
    [self.view addSubview:tableview];

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}
@end
