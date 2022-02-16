//
//  ZZH_LoadingView.m
//  ZZH_LoadingView
//
//  Created by zhangzhihua on 16/6/27.
//  Copyright © 2016年 zhangzhihua. All rights reserved.
//

#import "ZZH_LoadingView.h"
#import "CenterLayer.h"
#import "UIColor+Hex.h"
#import "circleLayer.h"


@interface ZZH_LoadingView ()

@property (nonatomic, strong)CenterLayer *centerLayer;


@property (nonatomic , strong)circleLayer *CircleLayer;
@end

@implementation ZZH_LoadingView


- (instancetype) initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self addCircleLayer];
    }
    return self;
}


- (CenterLayer *)centerLayer {
    if (!_centerLayer) {
        _centerLayer = [[CenterLayer alloc] init];
    }
    return _centerLayer;
}

- (circleLayer *)CircleLayer {
    if (!_CircleLayer) {
        _CircleLayer = [[circleLayer alloc] init];
    }
    return _CircleLayer;
}


-(void)addCircleLayer {
    [self.layer addSublayer:self.centerLayer];
    [self.centerLayer create_textLayer];
//    [self.centerLayer textStarAnimation];
    [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(groupAnimation) userInfo:nil repeats:NO];
}

-(void)groupAnimation{
    [self.centerLayer setGroupAnimation];
    
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(rotatView) userInfo:nil repeats:NO];
}

-(void)rotatView{
    NSLog(@"1111");
    CAAnimationGroup* animationGroup = [CAAnimationGroup animation];
    
    //旋转动画
    
    self.layer.anchorPoint = CGPointMake(0.5, 0.5);
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = @(M_PI * 4);
    rotationAnimation.removedOnCompletion = true;
    
//    CAKeyframeAnimation* keyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"bounds"];
//    //没有 formValue，toValue，只有 values 数组，数组中的数据就 path 所有需要经过的一个数值
//    keyframeAnimation.values = @[[NSValue valueWithCGRect:CGRectMake(0, 0, self.frame.size.width *1, self.frame.size.width *1)], [NSValue valueWithCGRect:CGRectMake(0, 0, self.frame.size.width *1.3, self.frame.size.width *1.3)], [NSValue valueWithCGRect:CGRectMake(0, 0, self.frame.size.width *0.4, self.frame.size.width *0.4)], [NSValue valueWithCGRect:CGRectMake(0, 0, self.frame.size.width *0, self.frame.size.width *0)]];
    
    //keyTimes，到达 values 中的每个数据，所需要的时间
    //时间轴，从 0 － 1，决定了 values 中的数据变化的关键时间点
    //一定要从 0 开始到 1结束，个数要和 values 对应。如果这里有错，那么系统忽略整个参数，动画匀速执行。
//    keyframeAnimation.keyTimes = @[[NSNumber numberWithFloat:0.0f], [NSNumber numberWithFloat:0.25f], [NSNumber numberWithFloat:0.75], [NSNumber numberWithFloat:1.0f]];
    
    
    
    CABasicAnimation *keyframeAnimation = [CABasicAnimation animationWithKeyPath:@"bounds"];
    keyframeAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 0, 0)];
    keyframeAnimation.removedOnCompletion = true;
    
    //可以组装任意多个
    animationGroup.animations = @[rotationAnimation];
    
    animationGroup.duration = 0.8;
    animationGroup.removedOnCompletion = true;
    //animationGroup.fillMode = kCAFillModeForwards;
    [self.layer addAnimation:animationGroup forKey:nil];
    [self.centerLayer smallAnimation];
    
    [NSTimer scheduledTimerWithTimeInterval:0.9 target:self selector:@selector(circlrLayer) userInfo:nil repeats:NO];
}

-(void)circlrLayer{
    [_centerLayer removeFromSuperlayer];
    [self.layer addSublayer:self.CircleLayer];
    [self.CircleLayer expand];
    [NSTimer scheduledTimerWithTimeInterval:0.55 target:self selector:@selector(addImageView) userInfo:nil repeats:NO];
    
}


-(void)addImageView{
    UIView *view = [self superview];
    
    UIImageView *ADView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1242.png"]];
    ADView.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height);
    [view addSubview:ADView];
}


@end
