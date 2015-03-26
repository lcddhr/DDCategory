//
//  DDAnimation.h
//  CABaseAnimationDemo
//


#import <Foundation/Foundation.h>

@interface DDAnimation : NSObject


/**
 *  纵向移动Y
 *
 *  @param time 移动时间
 *  @param y    移动到的距离
 *
 *  @return CABasicAnimation
 */
+(CABasicAnimation *)moveY:(float)time Y:(NSNumber *)y;

/**
 *  缩放
 *
 *  @param Multiple      缩放到的倍数
 *  @param orginMultiple 原始倍数
 *  @param time          缩放的时间
 *  @param repeatTimes   循环的次数
 *
 *  @return CABasicAnimation
 */
+(CABasicAnimation *)scale:(NSNumber *)Multiple orgin:(NSNumber *)orginMultiple durTimes:(float)time Rep:(float)repeatTimes;

/**
 *  点移动
 *
 *  @param point 移动到某个点
 *
 *  @return CABasicAnimation
 */
+(CABasicAnimation *)movepoint:(CGPoint )point;


/**
 *  旋转
 *
 *  @param durtime     持续时间
 *  @param degree      角度
 *  @param direction   方向
 *  @param repeatCount 重复次数
 *
 *  @return CABasicAnimation
 */
+(CABasicAnimation *)rotation:(float)durtime degree:(float)degree direction:(int)direction repeatCount:(int)repeatCount;


/**
 *  闪烁的动画
 *
 *  @param repeatTimes 闪烁次数
 *  @param time        每次闪烁的时间
 *
 *  @return CABasicAnimation
 */
+(CABasicAnimation *)opacityTimes_Animation:(float)repeatTimes durTimes:(float)time;

/**
 *  圆角
 *
 *  @param repeatTimes 重复次数
 *
 *  @return CABasicAnimation
 */
+(CABasicAnimation *)cornerRadius_Animation:(float)repeatTimes;

@end
