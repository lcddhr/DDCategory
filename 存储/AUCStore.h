//
//  AUCStore.h
//  AUCDemo
//
//  Created by on 15/1/5.
//  Copyright (c) 2015年. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UserModel;
@interface AUCStore : NSObject


+ (instancetype)sharedInstance;

/**
 *  数据库保存方法
 *
 */
- (void)storeUserModel:(UserModel *)userModel;
- (NSString *)queryUserToken:(UserModel *)userModel;


/**
 *  数据库查询方法
 *
 */
- (id)queryObjectById:(NSString *)objectId;
- (NSArray *)queryAllMessage;

/**
 *  数据库删除方法
 *
 */
- (void)deleteObjectById:(NSString *)objectId;
- (void)deleteAllObject;
@end
