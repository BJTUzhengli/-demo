//
//  UIView+Extension.m
//  Zhi
//
//  Created by 征里 on 16/6/3.
//  Copyright © 2016年 meitu. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)
- (void)setY:(CGFloat)y{
    self.frame = CGRectMake(self.frame.origin.x,
                            y,
                            self.frame.size.width,
                            self.frame.size.height);
}

- (CGFloat)y{
    return self.frame.origin.y;
}

- (void)setX:(CGFloat)x{
 self.frame = CGRectMake(x,
                         self.frame.origin.y,
                         self.frame.size.width,
                         self.frame.size.height);
}
- (CGFloat)x{
    return self.frame.origin.x;
}

- (void)setWidth:(CGFloat)width{
    self.frame = CGRectMake(self.frame.origin.x,
                            self.frame.origin.y
                            , width,
                            self.frame.size.height);
}
- (CGFloat)width{
    return self.frame.size.width;
}
- (CGFloat)height{
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height{
    self.frame = CGRectMake(self.frame.origin.x,
                            self.frame.origin.y,
                            self.frame.size.height,
                            height);
}
- (CGFloat)centerX{
    return self.center.x;
}
- (void)setCenterX:(CGFloat)centerX{
    self.center = CGPointMake(centerX, self.center.y);
}
- (CGFloat)centerY{
    return self.center.y;
}
- (void)setCenterY:(CGFloat)centerY{
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGSize)size{
    return self.frame.size;
}
- (void)setSize:(CGSize)size{
    self.frame = CGRectMake(self.frame.origin.x
                            , self.frame.origin.y
                            , size.width, size.height);
}



@end
