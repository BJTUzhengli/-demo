


//
//  ZLBaseVc.m
//  侧滑demo
//
//  Created by 征里 on 16/7/11.
//  Copyright © 2016年 征里. All rights reserved.
//

#import "ZLBaseVc.h"
#import "UIView+Extension.h"
#import "LeftVc.h"
#define ZLScreenWidth [UIScreen mainScreen].bounds.size.width
#define ZLScreenHeight [UIScreen mainScreen].bounds.size.height

#define maxMagrin ZLScreenWidth * 0.55



@interface ZLBaseVc()<UIGestureRecognizerDelegate>



@property (nonatomic, strong)UIView *contentView;
@property (nonatomic, strong)UIViewController *the_leftVc;

@property (nonatomic, assign)BOOL showLeftView;

@property (nonatomic,assign) CGPoint originalPoint;

@property (nonatomic, strong) UIView *actionView;

@property (nonatomic, assign) CGFloat offset;
@property (nonatomic, assign) CGFloat margin;
@end

@implementation ZLBaseVc


- (void)viewDidLoad{
    
    [super viewDidLoad];

}

- (instancetype)initWithLeftVc:(UIViewController *)leftVc offset:(CGFloat)offset margin:(CGFloat)margin{
    if (self = [super init]) {
        self.offset = offset;
        self.margin = margin;
        
        [self setUpSubviewsWithLeftVc:leftVc ];
        [self setUpPanGe];
        
    }
    return self;
}

- (void)setUpSubviewsWithLeftVc:(UIViewController *)leftVc{
    
    self.the_leftVc = leftVc;

    
    self.contentView = [[UIView alloc] init];
    self.contentView.backgroundColor = [UIColor grayColor];
    self.contentView.frame = CGRectMake( - _offset,
                                        0,
                                        self.view.width + _offset,
                                        self.view.height);
    [self.view addSubview:self.contentView];
    
    self.actionView = [[UIView alloc] init];
    self.actionView.frame = self.view.frame;
    self.actionView.width = self.contentView.width;
    
    self.the_leftVc.view.x = - (self.the_leftVc.view.width -  _offset);
    self.the_leftVc.view.y = 0;
    
    
    [self.contentView addSubview:self.the_leftVc.view];
    self.actionView.backgroundColor = [UIColor orangeColor];
    self.actionView.alpha  = 0.4;
    [self.contentView addSubview:self.actionView];
    
    [self addChildViewController:self.the_leftVc];
    
}



- (void)setUpPanGe{
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAc:)];
    
    pan.delegate = self;
    [self.actionView addGestureRecognizer:pan];
    
}

- (void)panAc:(UIPanGestureRecognizer *)pan{
    
    CGPoint currentPoint = [pan locationInView:self.actionView];
    CGFloat HoriDistance = currentPoint.x - self.originalPoint.x;

    self.contentView.x = self.contentView.x > _margin ? self.contentView.x : self.contentView.x + HoriDistance ;
    CGFloat contentViewMoveDistance =  _offset + self.contentView.x;
    NSLog(@"%lf",contentViewMoveDistance);
    
    
    if (pan.state == UIGestureRecognizerStateEnded) {
        if (contentViewMoveDistance > ZLScreenWidth * 0.5) {
            [self holdContentView];
        }else if (HoriDistance < ZLScreenWidth * 0.5){
            [self resetContentView];
        }
    }
    
}



- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    self.originalPoint = [gestureRecognizer locationInView:self.actionView];
    return YES;
}

- (void)resetContentView{

    self.actionView.userInteractionEnabled = NO;

    [UIView animateWithDuration:0.5 animations:^{
        self.contentView.x = - self.offset;

    } completion:^(BOOL finished) {
        self.actionView.userInteractionEnabled = YES;
    }];
}

- (void)holdContentView{

    self.actionView.userInteractionEnabled = NO;

    [UIView animateWithDuration:0.5 animations:^{
        self.contentView.x = 0;

    } completion:^(BOOL finished) {
        self.actionView.userInteractionEnabled = YES;

    }];
}






@end
