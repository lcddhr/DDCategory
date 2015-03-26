//
//  UIDevice+DDHardware.m
//  DDAlertViewDemotS
//
//  Created by lovelydd on 14-6-26.
//  Copyright (c) 2014年 lovelydd. All rights reserved.
//

#import "UIDevice+DDHardware.h"
#import <sys/sysctl.h>

@implementation UIDevice (DDHardware)


- (NSString *)getSystemInfoByName:(char *)typeSpecifier {
    size_t size;
    sysctlbyname(typeSpecifier, NULL, &size, NULL, 0);
    
    char *answer = malloc(size);
    sysctlbyname(typeSpecifier, answer, &size, NULL, 0);
    
    NSString *results = [NSString stringWithCString:answer encoding: NSUTF8StringEncoding];
    
    free(answer);
    return results;
}

- (NSString *)platform {
    return [self getSystemInfoByName:"hw.machine"];
}

- (NSString *)hwmodel {
    return [self getSystemInfoByName:"hw.model"];
}

- (DDPlatformType)platformType {
    NSString *platform = [self platform];
    
    if ([platform isEqualToString:@"iPhone1,1"])    return DDPlatformTypeiPhone2G;
    if ([platform isEqualToString:@"iPhone1,2"])    return DDPlatformTypeiPhone3G;
    if ([platform isEqualToString:@"iPhone2,1"])    return DDPlatformTypeiPhone3GS;
    if ([platform isEqualToString:@"iPhone3,1"])    return DDPlatformTypeiPhone4;
    if ([platform isEqualToString:@"iPhone3,2"])    return DDPlatformTypeiPhone4;
    if ([platform isEqualToString:@"iPhone3,3"])    return DDPlatformTypeiPhone4;
    if ([platform isEqualToString:@"iPhone4,1"])    return DDPlatformTypeiPhone4s;
    if ([platform isEqualToString:@"iPhone5,1"])    return DDPlatformTypeiPhone5;
    if ([platform isEqualToString:@"iPhone5,2"])    return DDPlatformTypeiPhone5;
    if ([platform isEqualToString:@"iPhone5,3"])    return DDPlatformTypeiPhone5c;
    if ([platform isEqualToString:@"iPhone5,4"])    return DDPlatformTypeiPhone5c;
    if ([platform isEqualToString:@"iPhone6,1"])    return DDPlatformTypeiPhone5s;
    if ([platform isEqualToString:@"iPhone6,2"])    return DDPlatformTypeiPhone5s;
    if ([platform isEqualToString:@"iPod1,1"])      return DDPlatformTypeiPodTouch1G;
    if ([platform isEqualToString:@"iPod2,1"])      return DDPlatformTypeiPodTouch2G;
    if ([platform isEqualToString:@"iPod3,1"])      return DDPlatformTypeiPodTouch3G;
    if ([platform isEqualToString:@"iPod4,1"])      return DDPlatformTypeiPodTouch4G;
    if ([platform isEqualToString:@"iPod5,1"])      return DDPlatformTypeiPodTouch5G;
    if ([platform isEqualToString:@"iPad1,1"])      return DDPlatformTypeiPad1G;
    if ([platform isEqualToString:@"iPad2,1"])      return DDPlatformTypeiPad2;
    if ([platform isEqualToString:@"iPad2,2"])      return DDPlatformTypeiPad2;
    if ([platform isEqualToString:@"iPad2,3"])      return DDPlatformTypeiPad2;
    if ([platform isEqualToString:@"iPad2,4"])      return DDPlatformTypeiPad2;
    if ([platform isEqualToString:@"iPad2,5"])      return DDPlatformTypeiPadMini1G;
    if ([platform isEqualToString:@"iPad2,6"])      return DDPlatformTypeiPadMini1G;
    if ([platform isEqualToString:@"iPad2,7"])      return DDPlatformTypeiPadMini1G;
    if ([platform isEqualToString:@"iPad3,1"])      return DDPlatformTypeiPad3;
    if ([platform isEqualToString:@"iPad3,2"])      return DDPlatformTypeiPad3;
    if ([platform isEqualToString:@"iPad3,3"])      return DDPlatformTypeiPad3;
    if ([platform isEqualToString:@"iPad3,4"])      return DDPlatformTypeiPad4;
    if ([platform isEqualToString:@"iPad3,5"])      return DDPlatformTypeiPad4;
    if ([platform isEqualToString:@"iPad3,6"])      return DDPlatformTypeiPad4;
    if ([platform isEqualToString:@"iPad4,1"])      return DDPlatformTypeiPadAir;
    if ([platform isEqualToString:@"iPad4,2"])      return DDPlatformTypeiPadAir;
    if ([platform isEqualToString:@"iPad4,3"])      return DDPlatformTypeiPadAir;
    if ([platform isEqualToString:@"iPad4,4"])      return DDPlatformTypeiPadMini2G;
    if ([platform isEqualToString:@"iPad4,5"])      return DDPlatformTypeiPadMini2G;
    if ([platform isEqualToString:@"iPad4,6"])      return DDPlatformTypeiPadMini2G;
    if ([platform isEqualToString:@"i386"])         return DDPlatformTypeSimulator;
    if ([platform isEqualToString:@"x86_64"])       return DDPlatformTypeSimulator;
    if ([platform hasPrefix:@"iPhone"])             return DDPlatformTypeUnknowniPhone;
    if ([platform hasPrefix:@"iPad"])               return DDPlatformTypeUnknowniPad;
    if ([platform hasPrefix:@"iPod"])               return DDPlatformTypeUnknowniPod;
    
    return DDPlatformTypeUnknown;
}

- (NSString *)platformString {
    switch ([self platformType]) {
        case DDPlatformTypeUnknown:             return @"Unknow";
        case DDPlatformTypeiPad1G:              return @"iPad 1G";
        case DDPlatformTypeiPad2:               return @"iPad 2";
        case DDPlatformTypeiPad3:               return @"iPad 3";
        case DDPlatformTypeiPad4:               return @"iPad 4";
        case DDPlatformTypeiPadAir:             return @"iPad Air";
        case DDPlatformTypeiPadMini1G:          return @"iPad Mini 1G";
        case DDPlatformTypeiPadMini2G:          return @"iPad Mini 2G";
        case DDPlatformTypeiPhone2G:            return @"iPhone 2G";
        case DDPlatformTypeiPhone3G:            return @"iPhone 3G";
        case DDPlatformTypeiPhone3GS:           return @"iPhone 3GS";
        case DDPlatformTypeiPhone4:             return @"iPhone 4";
        case DDPlatformTypeiPhone4s:            return @"iPhone 4s";
        case DDPlatformTypeiPhone5:             return @"iPhone 5";
        case DDPlatformTypeiPhone5c:            return @"iPhone 5c";
        case DDPlatformTypeiPhone5s:            return @"iPhone 5s";
        case DDPlatformTypeiPodTouch1G:         return @"iPod Touch 1G";
        case DDPlatformTypeiPodTouch2G:         return @"iPod Touch 2G";
        case DDPlatformTypeiPodTouch3G:         return @"iPod Touch 3G";
        case DDPlatformTypeiPodTouch4G:         return @"iPod Touch 4G";
        case DDPlatformTypeiPodTouch5G:         return @"iPod Touch 5G";
        case DDPlatformTypeAppleTV2G:           return @"Apple TV 2G";
        case DDPlatformTypeAppleTV3G:           return @"Apple TV 3G";
        case DDPlatformTypeSimulator:           return @"Simulator";
        case DDPlatformTypeUnknowniPhone:       return @"Unknown iPhone";
        case DDPlatformTypeUnknowniPod:         return @"Unknown iPod";
        case DDPlatformTypeUnknowniPad:         return @"Unknown iPad";
    }
    return nil;
}

@end
