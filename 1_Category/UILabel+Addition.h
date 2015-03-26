//
//  UILabel+Addition.h
//  xibDemo
//
//  Created by lovelydd on 14-5-31.
//  Copyright (c) 2014年 lovelydd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Addition)

//UILabel高度自适应
@property(nonatomic,setter = setAutoResize:) BOOL autoResize;

//UILabel高度自适应,可以用来获取高度,传入的size的高度height必须为0
- (CGSize)boundingRectWithSize:(CGSize)size;


//设置文字在最顶部
- (void)alignTop;
//设置文字在最底部
- (void)alignBottom;

//设置label内容某段范围文字不同颜色
-(void)labelTextRangeColor:(UIColor *)color range:(NSRange)range;
@end
