//
//  HZFlatterViewn.m
//  财金圈
//
//  Created by HZD on 15/2/13.
//  Copyright (c) 2015年 Admin. All rights reserved.
//
#define labelWidth 250.0f
#define labelHeight 50.0f
#define spacing 30.0f
#import "HZFlatterViewn.h"

@interface HZFlatterViewn()
@property (nonatomic, strong) UIView *backImageView;
@property (nonatomic, assign) CGRect afterFrame;
@property (nonatomic, weak) NSTimer *myTimer;
@property (nonatomic, weak) NSString *data;
@property(nonatomic,strong) UIButton *doneInKeyboardButtons;
@property(nonatomic,strong) UIView *views;
@property(nonatomic,strong) UIView *Buttonviews;
@end
@implementation HZFlatterViewn
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(id)initFraction:(NSString *)Fraction TheFirstOfSeveral:(NSString *)data
{
    self = [super init];
    if (self) {
         self.backgroundColor = [UIColor yellowColor];
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0,labelWidth, labelHeight)];
        if ([data isEqualToString:@"1"]) {
            view.backgroundColor = [UIColor yellowColor];
            view.alpha = 0.8;
        }else{
            view.backgroundColor = [UIColor blackColor];
            view.alpha = 0.5;
        }
        
        //获取主屏高度
        CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
        CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
        _Buttonviews = [[UIView alloc] initWithFrame:CGRectMake(0,0, labelWidth, labelHeight)];
        _Buttonviews.backgroundColor= [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1];
        _Buttonviews.hidden = YES;
        [self addSubview:_Buttonviews];
        //初始化完成按钮
        _doneInKeyboardButtons = [UIButton buttonWithType:UIButtonTypeCustom];
        
        
        _doneInKeyboardButtons.frame = CGRectMake(_Buttonviews.frame.size.width -70, 0, 70, 40);
        
        //    _doneInKeyboardButtons.hidden = YES;
        //根据按钮不同状态设图片
        [_doneInKeyboardButtons setTitle:@"完成" forState:UIControlStateNormal];
        [_doneInKeyboardButtons setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_doneInKeyboardButtons addTarget:self action:@selector(finishActions) forControlEvents:UIControlEventTouchUpInside];
        [_Buttonviews addSubview:_doneInKeyboardButtons];
        
        //初始化完成按钮
        UIButton *Buttons = [UIButton buttonWithType:UIButtonTypeCustom];
        
        
        Buttons.frame = CGRectMake(0, 0, 70, 40);
        
        //    Buttons.hidden = YES;
        //根据按钮不同状态设图片
        [Buttons setTitle:@"取消" forState:UIControlStateNormal];
        [Buttons setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [Buttons addTarget:self action:@selector(Buttons) forControlEvents:UIControlEventTouchUpInside];
        [_Buttonviews addSubview:Buttons];
        _views = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 0.5)];
        _views.backgroundColor= [UIColor lightGrayColor];
        
        [_Buttonviews addSubview:_views];
        //下部白色
        UIView *ciaView = [[UIView alloc] initWithFrame:CGRectMake(0, 40, _Buttonviews.frame.size.width, 30)];
        ciaView.backgroundColor = [UIColor whiteColor];
        [_Buttonviews addSubview:ciaView];
        
        //下部线
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 40, _Buttonviews.frame.size.width, 0.5)];
        lineView.backgroundColor = [UIColor lightGrayColor];
        [_Buttonviews addSubview:lineView];
        
        
    }
    return self;
}


//-(void)scrollTimer
//{
//
//   [ self removeFromSuperview];
//    //关闭定时器
//   [_myTimer setFireDate:[NSDate distantFuture]];
//    
//}
-(void)show{
    
    UIViewController *topVC = [self appRootViewController];
    int vheight = (int)([UIScreen mainScreen].bounds.size.height);
    int vwidth = (int)([UIScreen mainScreen].bounds.size.width);
    
    self.frame = CGRectMake(0,0,400 , 400);

    [topVC.view addSubview:self];
}
- (UIViewController *)appRootViewController
{
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = appRootVC;
    while (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    return topVC;
}
- (void)removeFromSuperview
{
    [self.backImageView removeFromSuperview];
    self.backImageView = nil;
    UIViewController *topVC = [self appRootViewController];
    CGRect afterFrame = CGRectMake((CGRectGetWidth(topVC.view.bounds) - labelWidth) * 0.5, CGRectGetHeight(topVC.view.bounds), labelWidth, labelHeight);
    
    [UIView animateWithDuration:0.35f delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.frame = afterFrame;
        
    } completion:^(BOOL finished) {
        [super removeFromSuperview];
    }];
}
- (void)willMoveToSuperview:(UIView *)newSuperview
{
    if (newSuperview == nil) {
        return;
    }
    UIViewController *topVC = [self appRootViewController];
    
    if (!self.backImageView) {
        self.backImageView = [[UIView alloc] initWithFrame:topVC.view.bounds];
        self.backImageView.backgroundColor = [UIColor blackColor];
        if ([self.data isEqualToString:@"1"]) {
            self.backImageView.alpha = 0.6f;
        }else{
           self.backImageView.alpha = 0.0f;
        }
        
        self.backImageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    }
    [topVC.view addSubview:self.backImageView];
    
    
    int vheight = (int)([UIScreen mainScreen].bounds.size.height);
    int vwidth = (int)([UIScreen mainScreen].bounds.size.width);
    self.afterFrame = CGRectMake(spacing,vheight/2 ,vwidth -(spacing *2) , labelHeight);
    
    
    [UIView animateWithDuration:0.0f delay:0.0 options:UIViewAnimationOptionCurveEaseIn               animations:^{
        
        self.frame = _afterFrame;
        self.alpha = 1;
    } completion:^(BOOL finished) {
    }];
    [super willMoveToSuperview:newSuperview];
    
//     _myTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(scrollTimer) userInfo:nil repeats:NO];
}
@end
