//
//  KeychainUtil.h
//  AUCDemo
//
//  Created by 4399 on 15/1/4.
//  Copyright (c) 2015年 4399. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SFHFKeychainUtils.h"
#import "AUCKeychainName.h"

@interface KeychainUtil : NSObject

//保存
+ (void)saveParamToKeychain:(NSString *) param syKeyChain:(NSString *)sykeyChain;

//删除数据
+ (void)deleteParamFromKeychain:(NSString *)sykeyChain;

//读取数据
+ (NSString *)readParamFromKeychain:(NSString *)sykeyChain;

@end
