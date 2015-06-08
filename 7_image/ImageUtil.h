//
//  ImageUtil.h
//  AUCDemo
//
//  Created by 4399 on 15/1/29.
//  Copyright (c) 2015年 4399. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#define  AUC_GET_IMAGE(x)  [ImageUtil loadImage:x]

@interface UIImage(AUC_IMAGE)

@end

@interface ImageUtil : NSObject


+ (UIImage *)loadImage:(NSString *)imageName;


+ (CGRect )imageRect:(UIImageView *)imageView
               image:(UIImage *)image;


@end

