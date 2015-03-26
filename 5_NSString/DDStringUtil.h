//
//  DDStringUtil.h
//  DDAlertViewDemotS
//
//  Created by lovelydd on 14-6-30.
//  Copyright (c) 2014年 lovelydd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDStringUtil : NSObject
/*
 *
 *邮箱验证
 *
 */

+(BOOL)isValidateEmail:(NSString *)email;
/*
 *
 *手机号码验证，手机号以13， 15，18开头，八个 \d 数字字符
 *
 */
+(BOOL) isValidateMobile:(NSString *)mobile;

/*
 *
 *密码验证，密码必须大于7位  而且包含字母
 *
 */
+(BOOL)isValidatePassword:(NSString *)password;
@end
