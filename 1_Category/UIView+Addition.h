//
//  UIView+Addition.h
//  CABaseAnimationDemo
//


#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, UIViewShadowType) {
    UIViewShadowTypeDefault,
    UIViewShadowTypeShadowPath,
};
@interface UIView (Addition)

@property(nonatomic,assign,setter = setShadowType:)UIViewShadowType shadowType;

@end
