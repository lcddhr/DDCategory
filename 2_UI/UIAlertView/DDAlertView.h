//
//  DDAlertView.h
//  DDAlertViewDemotS
//
//  Created by lovelydd on 14-6-26.
//  Copyright (c) 2014年 lovelydd. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DDAlertView;

typedef void(^AlertBlock)(DDAlertView *alertView, BOOL cancelled, NSInteger buttonIndex);
@interface DDAlertView : UIAlertView


- (id)initWithTitle:(NSString *)title
            message:(NSString *)message
       clickedBlock:(AlertBlock) clickedBlock
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;
@end
