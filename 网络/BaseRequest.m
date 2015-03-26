//
//  BaseRequest.m
//  AUCDemo
//
//  Created by 4399 on 15/1/4.
//  Copyright (c) 2015年 4399. All rights reserved.
//

#import "BaseRequest.h"
#import "AUCAlertView.h"
#define BASE_URL  @"https://mauth.4399houtai.com"

@implementation BaseRequest
{
//     AFHTTPRequestOperationManager *_manager;
}



- (void)clearCompletionBlock {
    // nil out to break the retain cycle.
    self.successCompletionBlock = nil;
    self.failureCompletionBlock = nil;
}

- (AUCRequestMethod)requestMethod
{
    return AUCRequestMethodGet;
}

-(NSString *)baseURL
{
    return @"";
}

// 请求的URL
- (NSString *)requestUrl
{
    return @"";
}

// 请求的参数列表
- (id)requestArgument
{
    return nil;
}

-(NSDictionary *)commonParamers
{
    
    return @{
             @"phoneModel" : [AUCUtil aucMobileModel],
             @"imei" : [AUCUtil aucUDID]
             };
}


- (BOOL)validResponseObject:(id)responseObject
{
    if (!responseObject) {
        return NO;
    }
    
    if (![responseObject isKindOfClass:[NSDictionary class]]) {
        
        return NO;
    }
    
    if(![responseObject[@"status"] boolValue]){
        
        return NO;
    }
    
    return YES;
}

- (AUCRequestSerializerType)requestSerializerType {
    return AUCRequestSerializerTypeHTTP;
}

- (void)startWithCompletionBlockWith:(SuccessCompletionBlock)successCompletionBlock
                             failure:(FailureCompletionBlock)failureCompletionBlock
{
    
    self.successCompletionBlock = successCompletionBlock;
    self.failureCompletionBlock = failureCompletionBlock;
    
    if (![self checkNetworkConnection]) {
        
        dispatch_block_t confirmBlcok =^{
            self.failureCompletionBlock(self);
        };
        
        AUCAlertView *alert =[[AUCAlertView alloc] initWithTitle:@"温馨提示" message:@"没有网络,建议在手机设置中打开网络" confirmBlcok:confirmBlcok cancelBlcok:nil cancelButtonTitle:nil otherButtonTitles:@"退出", nil];
        [alert show];
        alert = nil;
        return;
    }
    
    AUCRequestMethod method = [self requestMethod];
    NSString *url = [self buildRequestUrl];
    _manager = [AFHTTPRequestOperationManager manager];
    _manager.operationQueue.maxConcurrentOperationCount = 5;
    _manager.requestSerializer.timeoutInterval = 30;
    
    id param = [self requestArgument];
    
    LogRed(@"请求的URL是:%@\n,参数是:%@",url,param);
    
    if ([self requestSerializerType] == AUCRequestSerializerTypeHTTP) {
        _manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    } else if ([self requestSerializerType] == AUCRequestSerializerTypeJSON) {
        _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    }
   
    
    switch (method) {
        case AUCRequestMethodGet:
        {
            
            [_manager GET:url parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
                
                DLog(@"返回数据是:%@\n",responseObject);
                [self handleRequestResult:operation responseObject:responseObject];
                
            }                                failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                
                 DLog(@"访问出错了Error:%@\n response:%@",[error description],operation);
                [self handleRequestResult:operation responseObject:nil];
            }];
            
        }
            break;
        case AUCRequestMethodPost:
        {
             [_manager POST:url parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
              
                 DLog(@"返回数据是:%@\n",responseObject);
                 [self handleRequestResult:operation responseObject:responseObject];
                 
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                
                DLog(@"访问出错了Error:%@\n response:%@",[error description],operation);
                [self handleRequestResult:operation responseObject:nil];
            }];
            
        }
            break;
            
        default:
            break;
    }
}
- (void)handleRequestResult:(AFHTTPRequestOperation *)operation responseObject:(id)responseObject
{
    DLog(@"statusCode :%ld",(long)operation.response.statusCode);
    
    if (operation.response.statusCode == 200) {
        
        if (self.successCompletionBlock) {
            self.successCompletionBlock(self,responseObject);
        }
    }
    else
    {
        if (self.failureCompletionBlock) {
            self.failureCompletionBlock(self);
        }
    }
    
}


- (NSString *)buildRequestUrl
{
    NSString *requestURL = @"";
    if ([[self baseURL] isEqualToString:@""]) {
        
        requestURL = [BASE_URL stringByAppendingString:[self requestUrl]];
    }
    else
    {
        requestURL = [[self baseURL] stringByAppendingString:[self requestUrl]];
    }
    
    return requestURL;
}



- (BOOL)checkNetworkConnection
{
    struct sockaddr zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sa_len = sizeof(zeroAddress);
    zeroAddress.sa_family = AF_INET;
    
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    
    if (!didRetrieveFlags) {
        printf("Error. Count not recover network reachability flags\n");
        return NO;
    }
    
    BOOL isReachable = flags & kSCNetworkFlagsReachable;
    BOOL needsConnection = flags & kSCNetworkFlagsConnectionRequired;
    return (isReachable && !needsConnection) ? YES : NO;
}
@end
