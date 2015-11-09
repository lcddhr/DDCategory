//
//  PopoverView.h
//  ArrowView
//
//  Created by guojiang on 4/9/14.
//  Copyright (c) 2014年 LINAICAI. All rights reserved.
//

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com

#import <UIKit/UIKit.h>

@protocol PopoverViewDelegate;

@interface PopoverView : UIView

// 一般使用以下两个方法即可
-(id)initWithPoint:(CGPoint)point titles:(NSArray *)titles imageNames:(NSArray *)images;
-(void)show;

// 如下两个方法一般不会用到
-(void)dismiss;
-(void)dismiss:(BOOL)animated;

@property (nonatomic, assign) id<PopoverViewDelegate> delegate;

@end

@protocol PopoverViewDelegate <NSObject>

- (void)didSelectedRowAtIndex:(NSInteger)index;

@end