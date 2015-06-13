//
//  ViewController.m
//  111
//
//  Created by dst on 15/6/11.
//  Copyright (c) 2015年 dst. All rights reserved.
//

#import "ViewController.h"
#import "TYKeyboardInputS.h"
//#import "HZFlatterViewn.h"
@interface ViewController ()<UITextFieldDelegate,TYKeyboardInputSDelegate>
{
    
    UITextField *textFields;
    UIScrollView *ScrollView;
}
@property(nonatomic,strong)TYKeyboardInputS *views;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    int width = (int)[UIScreen mainScreen].bounds.size.width;
    int height = (int)[UIScreen mainScreen].bounds.size.height;
    ScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    ScrollView.backgroundColor = [UIColor redColor];
    ScrollView.contentSize = CGSizeMake(width, height +600);
    [self.view addSubview:ScrollView];

    _views = [[TYKeyboardInputS alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    _views.delegate = self;
    [_views addSeveralControl:1 originy:170 originx:10 width:width -20 height:50 statements:@"输入" nameId:1];
    [_views addSeveralTextview:1 originy:10 originx:10 width:width -20 height:150 statements:@"qyyuu" nameId:1];
    [_views addSeverallabel:1 originy:170 originx:10 width:width-20 height:200 statements:@"主人，不管你遇到什么问题或者任何建议，希望您给我们反馈。药药产品部的伙伴将积极改进，以满足您的每一次购物需求，谢谢！我们的QQ交流群：445950604；24h客服热线：4006063111" nameId:1];
    [_views addScrollView:ScrollView];
    _views.backgroundColor = [UIColor whiteColor];
    [ScrollView addSubview:_views];

}
-(void)addComesBackButton:(UIButton *)but
{
    NSLog(@"but.tag:%d",but.tag);
}
-(void)addComesBackTextField:(UITextField *)textField
{
    NSLog(@"textField.tag:%d",textField.tag);
}
-(void)addComesBackTextview:(UITextView *)textview
{
    NSLog(@"textview.tag:%d",textview.tag);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
