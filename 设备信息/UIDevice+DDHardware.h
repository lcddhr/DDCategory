//
//  UIDevice+DDHardware.h
//  DDAlertViewDemotS
//
//  Created by lovelydd on 14-6-26.
//  Copyright (c) 2014年 lovelydd. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    DDPlatformTypeUnknown,
    
    DDPlatformTypeiPad1G,
    DDPlatformTypeiPad2,
    DDPlatformTypeiPad3,
    DDPlatformTypeiPad4,
    DDPlatformTypeiPadAir,
    
    DDPlatformTypeiPadMini1G,
    DDPlatformTypeiPadMini2G,
    
    DDPlatformTypeiPhone2G,
    DDPlatformTypeiPhone3G,
    DDPlatformTypeiPhone3GS,
    DDPlatformTypeiPhone4,
    DDPlatformTypeiPhone4s,
    DDPlatformTypeiPhone5,
    DDPlatformTypeiPhone5c,
    DDPlatformTypeiPhone5s,
    
    DDPlatformTypeiPodTouch1G,
    DDPlatformTypeiPodTouch2G,
    DDPlatformTypeiPodTouch3G,
    DDPlatformTypeiPodTouch4G,
    DDPlatformTypeiPodTouch5G,
    
    DDPlatformTypeAppleTV2G,
    DDPlatformTypeAppleTV3G,
    
    DDPlatformTypeSimulator,
    
    DDPlatformTypeUnknowniPhone,
    DDPlatformTypeUnknowniPod,
    DDPlatformTypeUnknowniPad
    
} DDPlatformType;
@interface UIDevice (DDHardware)

- (NSString *)platform;
- (DDPlatformType)platformType;
- (NSString *)platformString;
@end
