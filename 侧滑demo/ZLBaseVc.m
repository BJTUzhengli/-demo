


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
@property (nonatomic, strong)UIViewController *the_centerVc;
@property (nonatomic, assign)BOOL showLeftView;

@property (nonatomic,assign) CGPoint originalPoint;

@property (nonatomic, assign) CGFloat offset;
@property (nonatomic, assign) CGFloat margin;
@end

@implementation ZLBaseVc


- (void)viewDidLoad{
    
    [super viewDidLoad];

}

- (instancetype)initWithLeftVc:(UIViewController *)leftVc centerVc:(UIViewController *)centerVc offset:(CGFloat)offset margin:(CGFloat)margin{
    if (self = [super init]) {
        self.offset = offset;
        self.margin = margin;

        self.the_leftVc = leftVc;
        self.the_centerVc = centerVc;
        

        [self setUpSubviewsWithLeftVc:leftVc centerVc:centerVc];
        [self setUpPanGe];

        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(leftAction) name:@"leftAction" object:nil];
    }
    return self;
}

- (void)setUpSubviewsWithLeftVc:(UIViewController *)leftVc centerVc:(UIViewController *)centerVc{
    

    
    self.contentView = [[UIView alloc] init];
    self.contentView.frame = CGRectMake( - _offset,
                                        0,
                                        self.view.width + _offset,
                                        self.view.height);
    self.contentView.backgroundColor = [UIColor clearColor];

    [self.view addSubview:self.contentView];

    self.the_leftVc.view.x = - (self.the_leftVc.view.width -  _offset);
    
    self.the_centerVc.view.x = _offset;
    
    
    
    [self.contentView addSubview:self.the_centerVc.view];
    [self.contentView addSubview:self.the_leftVc.view];
    self.contentView.userInteractionEnabled = YES;
    
    [self addChildViewController:self.the_centerVc];
    [self addChildViewController:self.the_leftVc];
    
}



- (void)setUpPanGe{
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAc:)];
    
    pan.delegate = self;
    [self.contentView addGestureRecognizer:pan];
    
}

- (void)panAc:(UIPanGestureRecognizer *)pan{
    
    CGPoint currentPoint = [pan locationInView:self.contentView];
    CGFloat HoriDistance = currentPoint.x - self.originalPoint.x;
    if (self.contentView.x + HoriDistance <= 0 && self.contentView.x + HoriDistance > -_offset) {
        self.contentView.x += HoriDistance;
    }
    CGFloat contentViewMoveDistance =  _offset + self.contentView.x;
    
    if (pan.state == UIGestureRecognizerStateEnded) {
        if (contentViewMoveDistance > ZLScreenWidth * 0.5) {
            [self holdContentView];
        }else if (HoriDistance < ZLScreenWidth * 0.5){
            [self resetContentView];
        }
    }
    
}



- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    self.originalPoint = [gestureRecognizer locationInView:self.contentView];
    NSLog(@"%lf",self.originalPoint.x);
    
    if (_originalPoint.x > _offset && _originalPoint.x < 100.0f) {
        return NO;
    }
    return YES;
}

- (void)resetContentView{
    self.showLeftView = NO;


    [UIView animateWithDuration:0.5 animations:^{
        self.contentView.x = - self.offset;

    } completion:^(BOOL finished) {
    }];
}

- (void)holdContentView{

    self.showLeftView = YES;

    [UIView animateWithDuration:0.5 animations:^{
        self.contentView.x = 0;

    } completion:^(BOOL finished) {

    }];
}


- (void)leftAction{
    if (self.showLeftView) {
        [self resetContentView];
    }else{
        [self holdContentView];
    }
}






@end
