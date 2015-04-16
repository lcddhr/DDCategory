//
//  AUCAssert.h
//  AUCDemo
//
//  Created by 4399 on 15/2/16.
//  Copyright (c) 2015年 4399. All rights reserved.
//

#import <Foundation/Foundation.h>


// 构建错误
#define AUCBuildError(error, msg) \
if (error) *error = [NSError errorWithDomain:msg code:250 userInfo:nil];

/**
 * 断言
 * @param condition   条件
 * @param returnValue 返回值
 */
#define AUCAssertError(condition, returnValue, error, msg) \
if ((condition) == NO) { \
AUCBuildError(error, msg); \
return returnValue;\
}

#define AUCAssert2(condition, returnValue) \
if ((condition) == NO) return returnValue;

/**
 * 断言
 * @param condition   条件
 */
#define AUCAssert(condition) AUCAssert2(condition, )

/**
 * 断言
 * @param param         参数
 * @param returnValue   返回值
 */
#define AUCAssertParamNotNil2(param, returnValue) \
AUCAssert2((param) != nil, returnValue)

/**
 * 断言
 * @param param   参数
 */
#define AUCAssertParamNotNil(param) AUCAssertParamNotNil2(param, )

@interface AUCAssert : NSObject

@end
