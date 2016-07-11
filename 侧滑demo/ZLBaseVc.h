//
//  ZLBaseVc.h
//  侧滑demo
//
//  Created by 征里 on 16/7/11.
//  Copyright © 2016年 征里. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZLBaseVc : UIViewController


/**
 *  制定一个左滑控制器
 *
 *  @param leftVc
 *  @param offset 控制器的可偏移量 建议设置为自定义控制器的view宽度
 *  @param margin 可偏移量基础上的距屏幕边缘的间隔
 *
 *  @return
 */
- (instancetype)initWithLeftVc:(UIViewController *)leftVc offset:(CGFloat)offset margin:(CGFloat)margin;


@end
