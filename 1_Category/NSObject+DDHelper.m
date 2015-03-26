//
//  NSObject+DDHelper.m
//  DDAlertViewDemotS
//
//  Created by lovelydd on 14-6-26.
//  Copyright (c) 2014年 lovelydd. All rights reserved.
//

#import "NSObject+DDHelper.h"

@implementation NSObject (DDHelper)


-(void)performAfterDelay:(NSTimeInterval)delay Block:(Block)block
{
    
    block = [block copy];
    [self performSelector:@selector(runBlockAfterDelay:) withObject:block afterDelay:delay];
}

- (void)runBlockAfterDelay:(Block)block
{
	if (block != nil)
		block();
}


@end
