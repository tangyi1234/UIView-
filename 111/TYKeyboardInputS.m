//
//  TYKeyboardInputS.m
//  111
//
//  Created by dst on 15/6/12.
//  Copyright (c) 2015年 dst. All rights reserved.
//

#import "TYKeyboardInputS.h"
#import "HZFlatterViewn.h"
@interface TYKeyboardInputS ()<UITextFieldDelegate,UITextViewDelegate>

@property(nonatomic,strong) UIView*view;
@property(nonatomic,strong) UITextField *TextField;
@property(nonatomic,strong) UITextField *TextFields;
@property(nonatomic,strong) UIScrollView *ScrollView;
@property(nonatomic,strong) UIButton *doneInKeyboardButtons;
@property(nonatomic,strong) UIView *views;
@property(nonatomic,strong) UIView *Buttonviews;
@property(nonatomic,strong) UILabel *label;
@property(nonatomic,strong) UITextView *textviews;
@property(nonatomic,strong) UITextView *TextView;
@property(nonatomic,strong) UIWindow *window;
@property(nonatomic,strong) UIView *parentView;
@end
@implementation TYKeyboardInputS
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.frame = frame;
        //使用NSNotificationCenter 鍵盤出現時
        [[NSNotificationCenter defaultCenter] addObserver:self
         
                                                 selector:@selector(keyboardWasShown:)
         
                                                     name:UIKeyboardDidShowNotification object:nil];
        
        //使用NSNotificationCenter 鍵盤隐藏時
        [[NSNotificationCenter defaultCenter] addObserver:self
         
                                                 selector:@selector(keyboardWillBeHidden:)
         
                                                     name:UIKeyboardWillHideNotification object:nil];
       
    }
    
    return self;
}
//UITextField
-(void)addSeveralControl:(int)number originy:(int)y originx:(int)x width:(int)width height:(int)height statements:(NSString *)statements nameId:(int)nameId
{
    [self setss];

        _TextField = [[UITextField alloc] initWithFrame:CGRectMake(x, y, width , height)];
        _TextField.backgroundColor = [UIColor redColor];
        _TextField.textColor = [UIColor whiteColor];
        _TextField.tag = nameId;
        _TextField.placeholder= statements;
        _TextField.delegate = self;
        [self addSubview:_TextField];
    
//    HZFlatterViewn *Viewn = [[HZFlatterViewn alloc] initFraction:@"123" TheFirstOfSeveral:@"1"];
//    [Viewn show];
    //    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    //    UIViewController *topVC = appRootVC;
    //    while (topVC.presentedViewController) {
    //        topVC = topVC.presentedViewController;
    //    }
    //
    //    [topVC.view addSubview:view];
    //
    //    _parentView = nil;
    //
    //    NSArray* windows = [UIApplication sharedApplication].windows;
    //    _window = [windows objectAtIndex:0];
    //    //keep the first subview
    //    if(_window.subviews.count > 0){
    //        _parentView = [_window.subviews objectAtIndex:0];
    //    }
    //    [_parentView addSubview:view];

   }
-(void)addSeveralTextview:(int)number originy:(int)y originx:(int)x width:(int)width height:(int)height statements:(NSString *)statements nameId:(int)nameId
{
    
    _TextView = [[UITextView alloc] initWithFrame:CGRectMake(x, y, width, height)];
    _TextView.delegate = self;
    _TextView.tag = nameId;
    _TextView.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:_TextView];
    _label = [[UILabel alloc] initWithFrame:CGRectMake(x, y, width, 30)];
    _label.hidden = NO;
    _label.backgroundColor = [UIColor whiteColor];
    _label.textColor = [UIColor lightGrayColor];
    _label.text = statements;
    [self addSubview:_label];
    
}
-(void)addSeverallabel:(int)number originy:(int)y originx:(int)x width:(int)width height:(int)height statements:(NSString *)statements nameId:(int)nameId
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(x, y, width, height)];
    label.tag = nameId;
    label.textAlignment = NSTextAlignmentLeft;
    label.numberOfLines = 0;
    
    label.lineBreakMode = NSLineBreakByCharWrapping;

    label.text = statements;
    label.font = [UIFont systemFontOfSize:14];
    [self addSubview:label];
}
-(void)addSeveralbuttonoRiginy:(int)y originx:(int)x width:(int)width height:(int)height statements:(NSString *)statements nameId:(int)nameId buttonImage:(NSString *)imageName butSelectedImage:(NSString *)SelectedImage 
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(x, y, width, height);
    button.tag = nameId;
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:SelectedImage] forState:UIControlStateSelected];
    [button addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    label.text = statements;
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    [button addSubview:label];
}
-(void)button:(UIButton *)but
{
    if ([_delegate respondsToSelector:@selector(addComesBackButton:)]) {
        [_delegate addComesBackButton:but];
    }
}
//实现当键盘出现的时候计算键盘的高度大小。用于输入框显示位置
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    int height = (int)[UIScreen mainScreen].bounds.size.height;
    NSDictionary* info = [aNotification userInfo];
    //kbSize即為鍵盤尺寸 (有width, height)
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;//得到鍵盤的高度
//    NSLog(@"hight_hitht:%f",kbSize.height);
//    NSLog(@"%f",_TextFields.frame.origin.y);
    if (_TextFields != nil) {
        int hs = (int)_TextFields.frame.origin.y;
        int jhs = (int)kbSize.height+10;
        if (hs+jhs > height) {
            NSLog(@"hs+jhs - height:%d",hs+jhs - height);
            int and = (int)(hs+jhs - height)+100;
            [UIView animateWithDuration:0.25 animations:^{
                if (_ScrollView != nil) {
                    _ScrollView.contentOffset = CGPointMake(0,0);
                }
                
                self.transform = CGAffineTransformMakeTranslation(0, -and);
            }];
        }

    }else if(_textviews != nil){
        int hs = (int)_textviews.frame.origin.y;
        int jhs = (int)kbSize.height+10;
        if (hs+jhs > height) {
            NSLog(@"hs+jhs - height:%d",hs+jhs - height);
            int and = (int)(hs+jhs - height)+100;
            [UIView animateWithDuration:0.25 animations:^{
                if (_ScrollView != nil) {
                    _ScrollView.contentOffset = CGPointMake(0,0);
                }
                
                self.transform = CGAffineTransformMakeTranslation(0, -and);
            }];
        }

    }
   
    if ( _Buttonviews.hidden == YES) {
        
        _Buttonviews.hidden = NO;
    }

}
-(void)addScrollView:(UIScrollView *)ScrollView
{
    _ScrollView = ScrollView;
}
//当键盘隐藏的时候
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    if (_TextFields != nil) {
        if ([_delegate respondsToSelector:@selector(addComesBackTextField:)]) {
            [_delegate addComesBackTextField:_TextFields];
        }
    }else if(_textviews != nil){
        if ([_delegate respondsToSelector:@selector(addComesBackTextview:)]) {
            [_delegate addComesBackTextview:_textviews];
        }
    }
    if ( _Buttonviews.hidden == NO) {
        
        _Buttonviews.hidden = YES;
    }
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [_TextField resignFirstResponder];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [UIView animateWithDuration:0.25 animations:^{
        self.transform = CGAffineTransformMakeTranslation(0, 0);
    }];
    
    [_TextFields resignFirstResponder];
    return YES;
}
////开始编辑时触发，文本字段将成为first responder
- (void)textFieldDidBeginEditing:(UITextField *)textField{

    _TextFields = textField;
    NSLog(@"textField.frame.size.height:%f,%f",textField.frame.size.height,textField.frame.origin.y);

}
-(void)setss
{
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100,100, 200, 200)];
//    view.backgroundColor = [UIColor yellowColor];
    UIView *viewsn=[UIApplication sharedApplication].delegate.window.rootViewController.view;
    

    //获取主屏高度
    CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    _Buttonviews = [[UIView alloc] initWithFrame:CGRectMake(0, screenHeight - 285, screenWidth, 80)];
    _Buttonviews.backgroundColor= [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1];
    _Buttonviews.hidden = YES;
//    [self addSubview:_Buttonviews];
    [viewsn addSubview:_Buttonviews];
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
-(void)Buttons
{
    [_TextFields resignFirstResponder];
    //    _doneInKeyboardButtons.hidden = YES;
    _Buttonviews.hidden = YES;
    [_TextView resignFirstResponder];
}
-(void)finishActions
{
    [_TextFields resignFirstResponder];
    //    _doneInKeyboardButtons.hidden = YES;
    _Buttonviews.hidden = YES;
    [_TextView resignFirstResponder];
    //    //从视图中移除掉
    //    [_doneInKeyboardButtons removeFromSuperview];
}
//内容发生改变编辑
- (void)textViewDidChange:(UITextView *)textView
{
    _textviews = textView;
    //    NSLog(@"textView.text:%@",textView.text);
    if (![textView.text isEqualToString:@""]) {
        _label.hidden = YES;
    }else if([textView.text isEqualToString:@""]){
        _label.hidden = NO;
    }
}


@end
