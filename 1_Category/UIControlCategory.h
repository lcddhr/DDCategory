//
//  UIControlCategory.h
//  AUCDemo
//
//  Created by 4399 on 15/2/15.
//  Copyright (c) 2015年 4399. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl(AUCUIControl)

- (void)handleControlEvent:(UIControlEvents)event withBlock:(void(^)(id sender))block;
@end


@interface UIControlCategory : UIControl

@end
