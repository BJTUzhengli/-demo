


//
//  ZLBaseVc.m
//  侧滑demo
//
//  Created by 征里 on 16/7/11.
//  Copyright © 2016年 征里. All rights reserved.
//

#import "ZLBaseVc.h"
#import "UIView+Extension.h"
#define ZLScreenWidth [UIScreen mainScreen].bounds.size.width
#define ZLScreenHeight [UIScreen mainScreen].bounds.size.height

#define maxMagrin ZLScreenWidth * 0.55



@interface ZLBaseVc()<UIGestureRecognizerDelegate>



@property (nonatomic, strong)UIView *contentView;
@property (nonatomic, strong)UIViewController *leftVc;

@property (nonatomic, assign)BOOL showLeftView;

@property (nonatomic,assign) CGPoint originalPoint;

@property (nonatomic, strong) UIView *actionView;
@end

@implementation ZLBaseVc


- (void)viewDidLoad{
    
    [super viewDidLoad];

}


- (instancetype)initWithLeftVc:(UIViewController *)leftVc{
    if (self = [super init]) {
        
        self.contentView = [[UIView alloc] init];
        [self.view addSubview:self.contentView];
        self.actionView = [[UIView alloc] init];
        self.leftVc = leftVc;
        [self addChildViewController:self.leftVc];
        CGFloat contentX = - leftVc.view.width;
        CGFloat contentWidth = leftVc.view.width + self.view.width;
        self.contentView.frame = CGRectMake(contentX, 0, contentWidth, self.view.height);
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.leftVc.view];
        
        self.actionView.size = self.view.size;
        self.actionView.x = self.contentView.width - self.leftVc.view.width;
        self.actionView.y = 0;
        [self.contentView addSubview:self.actionView];

        [self setUpPanGe];
        

    }
    
    return self;
}



- (void)setUpPanGe{
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAc:)];
    
    pan.delegate = self;
    [self.contentView addGestureRecognizer:pan];
    
}

- (void)panAc:(UIPanGestureRecognizer *)pan{
    
    CGPoint currentPoint = [pan locationInView:self.actionView];
    CGFloat HoriDistance = currentPoint.x - self.originalPoint.x;
    self.contentView.x += HoriDistance;
    
    CGFloat contentViewMoveDistance = self.contentView.x + self.leftVc.view.width;
    NSLog(@"%lf",contentViewMoveDistance);
    if (pan.state == UIGestureRecognizerStateEnded) {
        if (contentViewMoveDistance> maxMagrin) {
            [self holdContentView];
        }else if (HoriDistance < maxMagrin){
            [self resetContentView];
        }
    }
}



- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    self.originalPoint = [gestureRecognizer locationInView:self.actionView];
    
//    CGPoint startPoint = [gestureRecognizer locationInView:self.contentView];
//    
//    if (startPoint.x - self.leftVc.view.width > 40) {
//        return NO;
//    }
    return YES;
}

- (void)resetContentView{
    self.showLeftView = NO;
    [UIView animateWithDuration:0.5
                     animations:^{
                         CGFloat contentX = - _leftVc.view.width;
                         CGFloat contentWidth = _leftVc.view.width + self.view.width;
                         self.contentView.frame = CGRectMake(contentX, 0, contentWidth, self.view.height);
                     }];
}

- (void)holdContentView{
    self.showLeftView = YES;
    [UIView animateWithDuration:0.5
                     animations:^{
                         CGFloat contentViewShouldHoldX =  - self.leftVc.view.width + maxMagrin;
                         self.contentView.x = contentViewShouldHoldX;
                     }];
}






@end
