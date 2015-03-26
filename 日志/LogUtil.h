//
//  LogUtil.h
//  AUCDemo
//
//  Created by 4399 on 15/1/4.
//  Copyright (c) 2015年 4399. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ENABLE_ASSERT_STOP          1
//debug
#define  AUCDEBUG  0
#if AUCDEBUG
#define DLog(fmt, ...)              NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#define DETAIL_LOG(format, ...)     NSLog((@"%@ [Line %d] " format), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#define POINT_LOG(name, point)      NSLog(@"%@ : %@", name, NSStringFromCGPoint(point))
#define SIZE_LOG(name, size)        NSLog(@"%@ : %@", name, NSStringFromCGSize(size))
#define RECT_LOG(name, rect)        NSLog(@"%@ : %@", name, NSStringFromCGRect(rect))
#define TRACE(format, ...)          NSLog([NSString stringWithFormat:@"%@.%@:%@",\
                                            [self class],NSStringFromSelector(_cmd),format], ##__VA_ARGS__)
#else
#   define DLog(...)
#define DETAIL_LOG(format, ...)
#define POINT_LOG(name, point)
#define SIZE_LOG(name, size)
#define RECT_LOG(name, rect)
#define TRACE(format, ...)
#endif


#define XCODE_COLORS_ESCAPE_MAC @"\033["
#define XCODE_COLORS_ESCAPE_IOS @"\xC2\xA0["
#define XCODE_COLORS_ESCAPE  XCODE_COLORS_ESCAPE_MAC
#define XCODE_COLORS_RESET_FG  XCODE_COLORS_ESCAPE @"fg;" // Clear any foreground color
#define XCODE_COLORS_RESET_BG  XCODE_COLORS_ESCAPE @"bg;" // Clear any background color
#define XCODE_COLORS_RESET     XCODE_COLORS_ESCAPE @";"   // Clear any foreground or

//background color
#define LogBlue(frmt, ...)  NSLog((XCODE_COLORS_ESCAPE @"fg0,150,255;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#define LogRed(frmt, ...)   NSLog((XCODE_COLORS_ESCAPE @"fg250,0,0;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#define LogGreen(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"8fg0,235,30;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)

// assert
#ifdef ENABLE_ASSERT_STOP
#define APP_ASSERT_STOP                     {LogRed(@"APP_ASSERT_STOP"); NSAssert1(NO, @" \n\n\n===== APP Assert. =====\n%s\n\n\n", __PRETTY_FUNCTION__);}
#define APP_ASSERT(condition)               {NSAssert(condition, @" ! Assert");}
#else
#define APP_ASSERT_STOP                     do {} while (0);
#define APP_ASSERT(condition)               do {} while (0);
#endif

#define  AUC_STRING(fmt,...) [NSString stringWithFormat:(fmt),##__VA_ARGS__]
@interface LogUtil : NSObject

@end
