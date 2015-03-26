//
//  DDAlertView.m
//  DDAlertViewDemotS
//
//  Created by lovelydd on 14-6-26.
//  Copyright (c) 2014年 lovelydd. All rights reserved.
//

#import "DDAlertView.h"

@interface DDAlertView () <UIAlertViewDelegate>

@property (copy, nonatomic) AlertBlock clickedBlock;

@end
@implementation DDAlertView

- (id)initWithTitle:(NSString *)title
            message:(NSString *)message
       clickedBlock:(AlertBlock)clickedBlock
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitles:(NSString *)otherButtonTitles, ...

{
    
    self = [self initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil ];
    
    if (self) {
        _clickedBlock = clickedBlock;
        va_list _arguments;
        va_start(_arguments, otherButtonTitles);
        for (NSString *key = otherButtonTitles; key != nil; key = (__bridge NSString *)va_arg(_arguments, void *)) {
            [self addButtonWithTitle:key];
        }
        va_end(_arguments);
    }
    return self;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    _clickedBlock(self, buttonIndex==self.cancelButtonIndex, buttonIndex);
}

@end
