//
//  DDStringUtil.m
//  DDAlertViewDemotS
//
//  Created by lovelydd on 14-6-30.
//  Copyright (c) 2014年 lovelydd. All rights reserved.
//

#import "DDStringUtil.h"

@implementation DDStringUtil


+(BOOL)isValidatePassword:(NSString *)password
{
    NSString *passwordRegex = @"(.*[a-zA-Z]+.*[0-9]+.*)|(.*[0-9]+.*[a-zA-Z]+.*)";
    NSPredicate *passwordTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", passwordRegex];
    return [passwordTest evaluateWithObject:password];
}

+(BOOL)isValidateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}


+(BOOL) isValidateMobile:(NSString *)mobile
{
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    //    NSLog(@"phoneTest is %@",phoneTest);
    return [phoneTest evaluateWithObject:mobile];
}
@end
