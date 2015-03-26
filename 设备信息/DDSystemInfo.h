//
//  DDSystemInfo.h
//  DDAlertViewDemotS
//
//  Created by lovelydd on 14-6-26.
//  Copyright (c) 2014年 lovelydd. All rights reserved.
//

#import <Foundation/Foundation.h>

#define IOS7_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )
#define IOS6_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"6.0"] != NSOrderedAscending )
#define IOS5_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"5.0"] != NSOrderedAscending )
#define IOS4_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"4.0"] != NSOrderedAscending )
#define IOS3_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"3.0"] != NSOrderedAscending )
#define IS_IPHONE                       ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
#define IS_IPAD                         ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
#define IS_iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)


@interface DDSystemInfo : NSObject

/*
 *  系统版本,输出结果类型:iPhone OS 7.1
 *
 */
+ (NSString *)osVersion;

/*
 *  app版本
 *
 */
+ (NSString *)appVersion;

/*
 *  设备类型，是iphone4 还是iphone5
 *
 */

+ (NSString *)deviceModel;

/*
 * 有没有越狱
 *
 */
+ (BOOL)isJailBroken;


+ (NSString *)jailBreaker;

@end
