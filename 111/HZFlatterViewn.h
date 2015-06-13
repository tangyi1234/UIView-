//
//  HZFlatterViewn.h
//  财金圈
//
//  Created by HZD on 15/2/13.
//  Copyright (c) 2015年 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HZFlatterViewnDelegate <NSObject>//设置协议
-(void)FlatterViewn;//创建方法
@end
@interface HZFlatterViewn : UIView
-(id)initFraction:(NSString *)Fraction TheFirstOfSeveral:(NSString *)data;
- (void)show;
@property (nonatomic, assign) id<HZFlatterViewnDelegate> delegate;
@end
