//
//  TYKeyboardInputS.h
//  111
//
//  Created by dst on 15/6/12.
//  Copyright (c) 2015年 dst. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol TYKeyboardInputSDelegate<NSObject>
-(void)addComesBackButton:(UIButton*)but;
-(void)addComesBackTextField:(UITextField *)textField;
-(void)addComesBackTextview:(UITextView *)textview;
@end
@interface TYKeyboardInputS : UIView
@property(nonatomic,assign) id <TYKeyboardInputSDelegate>delegate;
- (id)initWithFrame:(CGRect)frame;
//UITextField
-(void)addSeveralControl:(int)number originy:(int)y originx:(int)x width:(int)width height:(int)height statements:(NSString *)statements nameId:(int)nameId;
-(void)addScrollView:(UIScrollView *)ScrollView;
//UITextview
-(void)addSeveralTextview:(int)number originy:(int)y originx:(int)x width:(int)width height:(int)height statements:(NSString *)statements nameId:(int)nameId;
//uilabel
-(void)addSeverallabel:(int)number originy:(int)y originx:(int)x width:(int)width height:(int)height statements:(NSString *)statements nameId:(int)nameId;
//uibutton
-(void)addSeveralbuttonoRiginy:(int)y originx:(int)x width:(int)width height:(int)height statements:(NSString *)statements nameId:(int)nameId buttonImage:(NSString *)imageName butSelectedImage:(NSString *)SelectedImage;
@end
