//
//  NSObject+DDHelper.h
//  DDAlertViewDemotS
//
//  Created by lovelydd on 14-6-26.
//  Copyright (c) 2014年 lovelydd. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^Block)(void);
@interface NSObject (DDHelper)

-(void)performAfterDelay:(NSTimeInterval)delay Block:(Block)block;

@end
