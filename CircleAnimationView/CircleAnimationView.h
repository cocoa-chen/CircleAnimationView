//
//  CircleAnimationView.h
//  PYAdCheck
//
//  Created by 陈爱彬 on 15/3/10.
//  Copyright (c) 2015年 陈爱彬. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CircleType) {
    CircleTypeRing = 0,
    CircleTypeRound,
};

@interface CircleAnimationView : UIView

//默认是Ring类型
@property (nonatomic) CircleType circleType;
//如果circleType为CircleTypeRound，则该颜色为动画圆的颜色,默认为magentaColor
@property (nonatomic) UIColor *animatingRoundColor;

@property (nonatomic) UIColor *circleColor;
@property (nonatomic) CGFloat zoomFactor;

@end
