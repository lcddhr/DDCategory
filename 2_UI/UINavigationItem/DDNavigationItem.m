//
//  DDNavigationItem.m
//  navDemoTest
//
//  Created by lovelydd on 14-6-13.
//  Copyright (c) 2014年 lovelydd. All rights reserved.
//

#import "DDNavigationItem.h"

@implementation DDNavigationItem


//设置带文字的
-(id)initWithImage:(NSString *)backImage
           setType:(DDNavigationItemType)buttonType
         setTarget:(id)target
         setAction:(SEL)action
  forControlEvents:(UIControlEvents)event
{
    
    
    
    if (self = [super init]) {
        UIButton *button = [[UIButton alloc] init];
        if (buttonType == DDUIBarButtonItemNormal) {
            button.frame = CGRectMake(0, 0, 32, 32);
            [button setImage:[UIImage imageNamed:backImage] forState:UIControlStateNormal];
            button.imageEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 0);
        }
        else
        {
            
            [button setBackgroundImage:[[UIImage imageNamed:backImage] stretchableImageWithLeftCapWidth:7 topCapHeight:7] forState:UIControlStateNormal];
             button.frame = CGRectMake(0, 0, 40, 32);
        }
        
        [button addTarget:target action:action forControlEvents:event];
        
        
        
        self.customView =  button;
    }
    
    return self;
}
@end
