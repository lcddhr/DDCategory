//
//  ImageUtil.m
//  AUCDemo
//
//  Created by 4399 on 15/1/29.
//  Copyright (c) 2015年 4399. All rights reserved.
//

#import "ImageUtil.h"
#import <AVFoundation/AVFoundation.h>

@implementation ImageUtil

+ (UIImage *)loadImage:(NSString *)imageName
{
    return [UIImage imageNamed:imageName];
}



@end




@implementation UIImage (AUC_IMAGE)

- (UIImage *)duplicate
{
    CGImageRef newCgIm = CGImageCreateCopy(self.CGImage);
    UIImage *newImage = [UIImage imageWithCGImage:newCgIm scale:self.scale orientation:self.imageOrientation];
    CGImageRelease(newCgIm);
    
    return newImage;
}

//使当前图片可拉伸
- (UIImage *)stretched
{
    CGSize size = self.size;
    
    UIEdgeInsets insets = UIEdgeInsetsMake(truncf(size.height-1)/2, truncf(size.width-1)/2, truncf(size.height-1)/2, truncf(size.width-1)/2);
    
    return [self resizableImageWithCapInsets:insets];
}

//使当前图片抗锯齿(当图片在旋转时有用, 原理就是在图片周围加1px的透明像素)
- (UIImage *)antiAlias
{
    int border = 1;
    CGRect rect = CGRectMake(border, border, self.size.width-2*border, self.size.height-2*border);
    
    UIImage *img = nil;
    
    UIGraphicsBeginImageContext(CGSizeMake(rect.size.width,rect.size.height));
    [self drawInRect:CGRectMake(-1, -1, self.size.width, self.size.height)];
    img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIGraphicsBeginImageContext(self.size);
    [img drawInRect:rect];
    UIImage* antiImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return antiImage;
}

//创建纯色的图片
+ (UIImage *)imageWithColor:(UIColor *)color Size:(CGSize)size
{
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return [image stretched];
}

//imageNamed的非缓存版
+ (UIImage *)imageName:(NSString *)name
{
    NSString *path = [[[NSBundle mainBundle] bundlePath] stringByAppendingString:[NSString stringWithFormat:@"/%@",name]];
    
    return [UIImage imageWithContentsOfFile:path];
}

+ (CGRect )imageRect:(UIImageView *)imageView image:(UIImage *)image {
    
    CGRect iamgeAspectRect = AVMakeRectWithAspectRatioInsideRect(image.size, imageView.bounds);
    return iamgeAspectRect;
}

@end
