//
//  DDNavigationItem.h
//  navDemoTest
//
//  Created by lovelydd on 14-6-13.
//  Copyright (c) 2014年 lovelydd. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum : NSUInteger {
   
    DDUIBarButtonItemNormal,        //普通
    DDUIBarButtonItemBack,          //返回按钮
    
} DDNavigationItemType;
@interface DDNavigationItem : UIBarButtonItem

//设置带文字的
-(id)initWithImage:(NSString *)backImage
           setType:(DDNavigationItemType)buttonType
         setTarget:(id)target
         setAction:(SEL)action
        forControlEvents:(UIControlEvents)event;

@end
