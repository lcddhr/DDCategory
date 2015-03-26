//
//  KeychainUtil.m
//  AUCDemo
//
//  Created by 4399 on 15/1/4.
//  Copyright (c) 2015年 4399. All rights reserved.
//

#import "KeychainUtil.h"

static NSString *kServiceName = @"AUCKeychain";

@implementation KeychainUtil


//保存
+ (void)saveParamToKeychain:(NSString *) param syKeyChain:(NSString *)sykeyChain
{
    [SFHFKeychainUtils storeUsername:sykeyChain andPassword:param forServiceName:kServiceName updateExisting:YES error:nil];
}

//删除数据
+ (void)deleteParamFromKeychain:(NSString *)sykeyChain
{
    [SFHFKeychainUtils deleteItemForUsername:sykeyChain andServiceName:kServiceName error:nil];
}

+ (NSString *)readParamFromKeychain:(NSString *)sykeyChain
{
    return [SFHFKeychainUtils getPasswordForUsername:sykeyChain andServiceName:kServiceName error:nil];
}
@end
