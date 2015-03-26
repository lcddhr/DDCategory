//
//  DDSwipeMenu.h
//  DDSwipeMenuDemo
//
//  Created by lovelydd on 14-6-20.
//  Copyright (c) 2014年 lovelydd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDSwipeMenuItem.h"

@class DDSwipeMenu;
@protocol DDSwipeMenuDelegate <NSObject>

@optional
-(void)DDSwipeMenu:(DDSwipeMenu *)menu didSelectItemAtIndex:(NSInteger)index;
-(void)DDSwipeMenu:(DDSwipeMenu *)menu selectedItemTitle:(NSString *)title;

@end

@interface DDSwipeMenu : UIView<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, retain) DDSwipeMenuItem *selectedItem;
@property(nonatomic, assign) id <DDSwipeMenuDelegate> delegate;
-(instancetype) initWithItem:(NSArray *)items addToViewController:(id)viewController;


-(void)showMenu;
-(void)hideMenu;
@end
