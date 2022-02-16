//
//  circleLayer.m
//  ZZH_LoadingView
//
//  Created by M-SJ077 on 16/6/28.
//  Copyright © 2016年 zhangzhihua. All rights reserved.
//

#import "circleLayer.h"
#import "UIColor+Hex.h"
#import <UIKit/UIKit.h>
@interface circleLayer ()

@property (strong, nonatomic) UIBezierPath *circleSmallPath;
@property (strong, nonatomic) UIBezierPath *circleBigPath;

@end

@implementation circleLayer

- (instancetype)init {
    
    if (self == [super init]) {
        self.fillColor = [UIColor colorWithHexString:@"#2383dd"].CGColor;
        self.path = self.circleSmallPath.CGPath;
        self.contents = (id)[UIImage imageNamed:@"1242.png"].CGImage;
    }
    return self;
}

- (UIBezierPath *)circleSmallPath {
    if (!_circleSmallPath) {
        _circleSmallPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50.0, 50.0, 0.0, 0.0)];
    }
    return _circleSmallPath;
}
- (UIBezierPath *)circleBigPath {
    if (!_circleBigPath) {
        _circleBigPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(-350,-350, 800, 800)];
    }
    return _circleBigPath;
}


- (void)expand {
    CABasicAnimation *expandAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    expandAnimation.fromValue = (__bridge id _Nullable)(self.circleSmallPath.CGPath);
    expandAnimation.toValue = (__bridge id _Nullable)(self.circleBigPath.CGPath);
    expandAnimation.duration = 0.5;
    expandAnimation.fillMode = kCAFillModeForwards;
    expandAnimation.removedOnCompletion = NO;
    [self addAnimation:expandAnimation forKey:nil];
    
}

@end
