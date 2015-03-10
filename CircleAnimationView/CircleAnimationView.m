//
//  CircleAnimationView.m
//  PYAdCheck
//
//  Created by 陈爱彬 on 15/3/10.
//  Copyright (c) 2015年 陈爱彬. All rights reserved.
//

#import "CircleAnimationView.h"

@interface CircleAnimationView()
{
    CGFloat radius;
}
@property (nonatomic,strong) CAShapeLayer *circleLayer;
@property (nonatomic,strong) CAShapeLayer *ringLayer;
@end
@implementation CircleAnimationView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _circleColor = [UIColor colorWithRed:31/255.f green:100/255.f blue:1 alpha:1.f];
        _zoomFactor = 6;
        [self setup];
        [self startAnimation];
    }
    return self;
}
- (void)setup
{
    self.backgroundColor = [UIColor clearColor];
    radius = CGRectGetWidth(self.frame) / 4;

    self.circleLayer = [CAShapeLayer layer];
    self.circleLayer.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(CGRectGetWidth(self.frame) / 2 - radius, CGRectGetHeight(self.frame) / 2 - radius, radius * 2, radius * 2) cornerRadius:radius].CGPath;
    self.circleLayer.strokeColor = _circleColor.CGColor;
    self.circleLayer.fillColor = _circleColor.CGColor;
    self.circleLayer.lineWidth = 1.f;
    
    self.ringLayer = [CAShapeLayer layer];
    self.ringLayer.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(CGRectGetWidth(self.frame) / 2 - radius, CGRectGetHeight(self.frame) / 2 - radius, radius * 2, radius * 2) cornerRadius:radius].CGPath;
    self.ringLayer.strokeColor = _circleColor.CGColor;
    self.ringLayer.fillColor = nil;
    self.ringLayer.lineWidth = 1.f;
    
    [self.layer addSublayer:self.circleLayer];
    [self.layer addSublayer:self.ringLayer];
}
- (void)setCircleColor:(UIColor *)circleColor
{
    _circleColor = circleColor;
    self.circleLayer.strokeColor = _circleColor.CGColor;
    self.circleLayer.fillColor = _circleColor.CGColor;
    self.ringLayer.strokeColor = _circleColor.CGColor;
}
- (void)startAnimation
{
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue = @1.f;
    opacityAnimation.toValue = @0.f;
    opacityAnimation.duration = 2.5f;
    [self.ringLayer addAnimation:opacityAnimation forKey:@"alpha"];
    
    UIBezierPath *originPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(CGRectGetWidth(self.frame) / 2 - radius, CGRectGetHeight(self.frame) / 2 - radius, radius * 2, radius * 2) cornerRadius:radius];
    UIBezierPath *finalPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(CGRectGetWidth(self.frame) / 2 - radius * _zoomFactor, CGRectGetHeight(self.frame) / 2 - radius * _zoomFactor, radius * 2 * _zoomFactor, radius * 2 * _zoomFactor) cornerRadius:radius * _zoomFactor];
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    pathAnimation.fromValue = (__bridge id)(originPath.CGPath);
    pathAnimation.toValue = (__bridge id)(finalPath.CGPath);
    pathAnimation.duration = 2.5f;
    pathAnimation.delegate = self;
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.ringLayer addAnimation:pathAnimation forKey:@"pathAnimation"];
    
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (flag) {
        [self startAnimation];
    }
}
@end
