
//
//  BaseRequest.h
//  AUCDemo
//
//  Created by 4399 on 15/1/4.
//  Copyright (c) 2015年 4399. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "AUCUtil.h"

typedef NS_ENUM(NSInteger , AUCRequestMethod) {
    AUCRequestMethodGet = 0,
    AUCRequestMethodPost,
    AUCRequestMethodHead,
    AUCRequestMethodPut,
    AUCRequestMethodDelete,
};

typedef NS_ENUM(NSInteger , AUCRequestSerializerType) {
    AUCRequestSerializerTypeHTTP = 0,
    AUCRequestSerializerTypeJSON,
};


@class BaseRequest;
typedef void(^SuccessCompletionBlock)(BaseRequest *baseRequest ,id responseObject);
typedef void(^FailureCompletionBlock)(BaseRequest *baseRequest);

@interface BaseRequest : NSObject


@property (nonatomic, strong) AFHTTPRequestOperation *requestOperation;
@property (nonatomic,strong)AFHTTPRequestOperationManager *manager;

@property (nonatomic,copy)SuccessCompletionBlock successCompletionBlock;
@property (nonatomic,copy)FailureCompletionBlock failureCompletionBlock;

- (void)startWithCompletionBlockWith:(SuccessCompletionBlock)successCompletionBlock
                             failure:(FailureCompletionBlock)failureCompletionBlock;

- (void)setCompletionBlockWithSuccess:(SuccessCompletionBlock)successCompletionBlock
                              failure:(FailureCompletionBlock)failureCompletionBlock;

- (void)clearCompletionBlock;

//覆盖实现这些方法
// Http请求的方法
- (AUCRequestMethod)requestMethod;
- (AUCRequestSerializerType)requestSerializerType;

-(NSString *)baseURL;
// 请求的URL
- (NSString *)requestUrl;

// 请求的参数列表
- (id)requestArgument;
-(NSDictionary *)commonParamers;

- (BOOL)validResponseObject:(id)responseObject;

@end
