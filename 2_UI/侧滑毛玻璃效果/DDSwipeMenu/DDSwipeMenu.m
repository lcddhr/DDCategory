//
//  DDSwipeMenu.m
//  DDSwipeMenuDemo
//
//  Created by lovelydd on 14-6-20.
//  Copyright (c) 2014年 lovelydd. All rights reserved.
//

#import "DDSwipeMenu.h"
#import "UIView+Screenshot.h"
#import "UIImage+blurrEffect.h"

#define BACKGROUND_COLOR [UIColor colorWithWhite:1 alpha:0.2]
#define GENERIC_IMAGE_FRAME CGRectMake(0, 0, 40, 40)


#define MENU_FRAME_X 0
#define MENU_FRAME_Y 0
#define MENU_FRAME_WIDTH 175
#define MENU_FRAME_HEIGHT [UIScreen mainScreen].bounds.size.height

#define MAIN_VIEW_TAG 100
#define TITLE_LABLE_TAG 101
#define IMAGE_VIEW_TAG 102

static BOOL isOpen = NO;
@interface DDSwipeMenu ()
{
    NSArray *itemsArray;
    UITableView *sideTable;
    UIImageView *backgroundView;
}


@end
@implementation DDSwipeMenu


-(instancetype) initWithItem:(NSArray *)items addToViewController:(id)viewController
{
    if ((self = [super init])) {
     
        [self initView:viewController];
        itemsArray = items;
    }
    
    return self;
}

-(void)initView:(id)viewController
{
    self.frame = (CGRect){-MENU_FRAME_WIDTH,MENU_FRAME_Y,MENU_FRAME_X,MENU_FRAME_HEIGHT};
    self.backgroundColor = BACKGROUND_COLOR;
    
    sideTable = [[UITableView alloc]initWithFrame:CGRectMake(MENU_FRAME_X, MENU_FRAME_Y, MENU_FRAME_WIDTH, MENU_FRAME_HEIGHT) style:UITableViewStyleGrouped];
    
    
    
    //毛玻璃视图
    UIView *controllerView = ((UIViewController *)viewController).view;
    CGSize screenshotSize = (CGSize){MENU_FRAME_WIDTH,MENU_FRAME_HEIGHT};
    UIImage *screenImage = [controllerView screenshot:screenshotSize];
    UIImage *blurredImage = [screenImage blurredImageWithRadius:10.0f iterations:5 tintColor:nil];
    backgroundView = [[UIImageView alloc] initWithImage:blurredImage];
    backgroundView.frame = (CGRect){MENU_FRAME_WIDTH,MENU_FRAME_Y,MENU_FRAME_WIDTH,MENU_FRAME_HEIGHT};
    backgroundView.alpha = 0;
    [self addSubview:backgroundView];
    
    sideTable.delegate = self;
    sideTable.dataSource = self;
    sideTable.alpha = 0;
    sideTable.backgroundColor = BACKGROUND_COLOR;
    sideTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    sideTable.showsVerticalScrollIndicator = NO;
    isOpen = NO;
    [self addSubview:sideTable];
   
    //添加手势
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    tapGes.numberOfTapsRequired = 2;
    
    UISwipeGestureRecognizer *swipeGesLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(hideMenu)];
    swipeGesLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    
    
    UISwipeGestureRecognizer *swipeGesRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(showMenu)];
    swipeGesRight.direction = UISwipeGestureRecognizerDirectionRight;
    [controllerView addSubview:self];
    [controllerView addGestureRecognizer:tapGes];
    [controllerView addGestureRecognizer:swipeGesLeft];
    [controllerView addGestureRecognizer:swipeGesRight];
    
}

#pragma mark - Gesture Action

-(void)tapAction
{
    if (isOpen) {
        
        [self hideMenu];
    }
    else
    {
        [self showMenu];
    }
}

-(void)hideMenu
{
    if(isOpen){
        [UIView animateWithDuration:0.5 animations:^{
            self.frame = (CGRect){-MENU_FRAME_WIDTH, MENU_FRAME_Y, MENU_FRAME_WIDTH, MENU_FRAME_HEIGHT};
            sideTable.frame = (CGRect){-sideTable.frame.origin.x,sideTable.frame.origin.y,MENU_FRAME_WIDTH,MENU_FRAME_HEIGHT};
            sideTable.alpha = 0;
            backgroundView.alpha = 0;
            backgroundView.frame = (CGRect){MENU_FRAME_WIDTH, 0, MENU_FRAME_WIDTH, MENU_FRAME_HEIGHT};
        }];
        isOpen = NO;
    }
}

-(void)showMenu{
    if(!isOpen){
        [UIView animateWithDuration:0.5 animations:^{
            
            self.frame = (CGRect){MENU_FRAME_X, MENU_FRAME_Y, MENU_FRAME_WIDTH, MENU_FRAME_HEIGHT};
            sideTable.frame = (CGRect){sideTable.frame.origin.x,sideTable.frame.origin.y,MENU_FRAME_WIDTH,MENU_FRAME_HEIGHT};
            sideTable.alpha = 1;
            backgroundView.alpha = 1;
            backgroundView.frame = (CGRect){0, 0, MENU_FRAME_WIDTH, MENU_FRAME_HEIGHT};
        } completion:^(BOOL finished) {
            
        }];
        isOpen = YES;
    }
}

#pragma mark TableView Delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [itemsArray count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(DDSwipeMenu:didSelectItemAtIndex:)]) {
        
        [self.delegate DDSwipeMenu:self didSelectItemAtIndex:indexPath.row];
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(DDSwipeMenu:selectedItemTitle:)]) {
        
        //TODO:把点击的名字传过去
        [self.delegate DDSwipeMenu:self selectedItemTitle:@"123"];
    }
    
    self.selectedItem = itemsArray[indexPath.row];
    if (self.selectedItem.completeBlock) {
        
        self.selectedItem.completeBlock(self.selectedItem);
    }
    [sideTable deselectRowAtIndexPath:indexPath animated:YES];
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellIdentifier = @"cellIdentifier";
    UIView *circleView = nil;
    UILabel *titleLabel = nil;
    UIImageView *imageView = nil;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    DDSwipeMenuItem *item = itemsArray[indexPath.row];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.backgroundColor = [UIColor clearColor];
        
        circleView = [[UIView alloc]initWithFrame:CGRectMake(10, 10, 55, 55)];
        circleView.tag = MAIN_VIEW_TAG;
        circleView.backgroundColor = [UIColor clearColor];
        circleView.layer.borderWidth = 0.5;
        circleView.layer.borderColor = [UIColor colorWithWhite:0.3 alpha:0.7].CGColor;
        circleView.layer.cornerRadius = circleView.bounds.size.height/2;
        circleView.clipsToBounds = YES;
        [cell.contentView addSubview:circleView];
        
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(85, 10.0, 120, 60)];
        titleLabel.tag = TITLE_LABLE_TAG;
        titleLabel.textColor = [UIColor colorWithWhite:0.2 alpha:1];
        titleLabel.font = [UIFont fontWithName:@"Avenir Next" size:16];
        
        [cell.contentView addSubview:titleLabel];
        
        imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 32, 32)];
        imageView.tag = IMAGE_VIEW_TAG;
        imageView.center = circleView.center;
        [cell.contentView addSubview:imageView];
    }
    else
    {
        circleView = (UIView *)[cell.contentView viewWithTag:MAIN_VIEW_TAG];
        titleLabel = (UILabel *)[cell.contentView viewWithTag:TITLE_LABLE_TAG];
        imageView = (UIImageView *)[cell.contentView viewWithTag:IMAGE_VIEW_TAG];
    }
    
    titleLabel.text = item.title;
    imageView.image = item.imageView.image;
    return cell;
}


@end
