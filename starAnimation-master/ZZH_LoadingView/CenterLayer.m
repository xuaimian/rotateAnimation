//
//  CenterLayer.m
//  ZZH_LoadingView
//
//  Created by zhangzhihua on 16/6/27.
//  Copyright © 2016年 zhangzhihua. All rights reserved.
//

#import "CenterLayer.h"

@interface CenterLayer ()

@property (nonatomic , strong) UIBezierPath *InitPath;

@property (nonatomic , strong) UIBezierPath *smallPath;

@property (nonatomic , strong)CATextLayer *textLayer1;

@property (nonatomic , strong)CATextLayer *textLayer2;

@property (nonatomic , strong)CATextLayer *textLayer3;

@property (nonatomic , strong)CATextLayer *textLayer4;

@property (nonatomic ,strong)NSTimer *sharTimer;

@property (nonatomic , assign)NSInteger shareNum;

@end

static const CGFloat KLineWidth = 1.f;

static const CGFloat Ksize = 76.f;

@implementation CenterLayer

- (instancetype)init {
    if (self == [super init]){
        self.fillColor = [UIColor colorWithHexString:@"#2383dd"].CGColor;
        self.strokeColor = [UIColor colorWithHexString:@"#2383dd"].CGColor;
        self.lineCap = kCALineCapRound;
        self.lineJoin = kCALineJoinRound;
//        self.cornerRadius = 100;
         self.lineWidth = 10.0;
        self.path = self.InitPath.CGPath;
    }
    
    return self;
}


-(UIBezierPath *)InitPath{
    
    if (!_InitPath) {
        
        _InitPath = [[UIBezierPath alloc] init];
        
        _InitPath.lineCapStyle = kCGLineCapRound;
        
        _InitPath.lineJoinStyle = kCGLineJoinRound;
        
        [_InitPath moveToPoint:CGPointMake(0.0, Ksize)];
        
        [_InitPath addLineToPoint:CGPointMake(0.0, -KLineWidth)];
        
        [_InitPath addLineToPoint:CGPointMake(Ksize, -KLineWidth)];
        
        [_InitPath addLineToPoint:CGPointMake(Ksize, Ksize)];
        
        [_InitPath addLineToPoint:CGPointMake(-KLineWidth / 2, Ksize)];
        
        [_InitPath closePath];
        
        //self.fillColor = [UIColor colorWithHexString:@"#2383dd"].CGColor;
    }
    return _InitPath;
}

-(UIBezierPath *)smallPath{
    
    if (!_smallPath) {
        
        _smallPath = [[UIBezierPath alloc] init];
        
        _smallPath.lineCapStyle = kCGLineCapRound;
        
        _smallPath.lineJoinStyle = kCGLineJoinRound;
        
        
        _smallPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(KLineWidth / 2, KLineWidth / 2, 5, 5)];
        
        [_smallPath closePath];
        
        //self.fillColor = [UIColor colorWithHexString:@"#2383dd"].CGColor;
    }
    return _smallPath;
}



-(void)create_textLayer {
    
    //1
    self.textLayer1 = [CATextLayer layer];
    
    self.textLayer1.wrapped = YES;
    
    self.textLayer1.string = @"梅";
    
    self.textLayer1.fontSize = 28.0f;
    
    self.textLayer1.frame = CGRectMake(0, 0, 50, 50);
    
    self.textLayer1.anchorPoint = CGPointMake(0.4, 0.5);
    
    [self addSublayer:self.textLayer1];
    
    //2
    
    self.textLayer2 = [CATextLayer layer];
    
    self.textLayer2.string = @"斯";
    
    self.textLayer2.anchorPoint = CGPointMake(0.4, 0.5);
    
    self.textLayer2.fontSize = 27.5f;
    
    self.textLayer2.frame = CGRectMake(40, 1, 50, 50);
    
    [self addSublayer:self.textLayer2];
    
    //3
    
    self.textLayer3 = [CATextLayer layer];
    
    self.textLayer3.anchorPoint = CGPointMake(0.4, 0.5);
    
    self.textLayer3.string = @"医";
    
    self.textLayer3.fontSize = 28.f;
    
    self.textLayer3.frame = CGRectMake(5, 38, 50, 50);
    
    [self addSublayer:self.textLayer3];
    
    //4
    
    self.textLayer4 = [CATextLayer layer];
    
    self.textLayer4.anchorPoint = CGPointMake(0.4, 0.5);
    
    self.textLayer4.string = @"学";
    
    self.textLayer4.fontSize = 28.f;
    
    self.textLayer4.frame = CGRectMake(40, 38, 50, 50);
    
    [self addSublayer:self.textLayer4];
    
}

-(void)smallAnimation{
    self.lineWidth = 0.0;
    self.strokeColor = [UIColor clearColor].CGColor;
    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"path"];
    animation1.fromValue = (__bridge id _Nullable)(self.InitPath.CGPath);
    animation1.toValue = (__bridge id _Nullable)(self.smallPath.CGPath);
    animation1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animation1.duration = 0.8;
    animation1.removedOnCompletion = NO;
    animation1.fillMode = kCAFillModeForwards;
    
    [self addAnimation:animation1 forKey:nil];
}

-(void)groupAnimation{
    if(_shareNum >=4)return;
    _shareNum ++;
    
    //可以同时执行多个动画，组装多个动画同时执行
    CAAnimationGroup* animationGroup = [CAAnimationGroup animation];
    //旋转动画
    CAKeyframeAnimation* keyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    //没有 formValue，toValue，只有 values 数组，数组中的数据就 path 所有需要经过的一个数值
    keyframeAnimation.values = @[[NSNumber numberWithFloat:0], [NSNumber numberWithFloat:0.4], [NSNumber numberWithFloat:-0.4], [NSNumber numberWithFloat:0]];
    
    //keyTimes，到达 values 中的每个数据，所需要的时间
    //时间轴，从 0 － 1，决定了 values 中的数据变化的关键时间点
    //一定要从 0 开始到 1结束，个数要和 values 对应。如果这里有错，那么系统忽略整个参数，动画匀速执行。
    keyframeAnimation.keyTimes = @[[NSNumber numberWithFloat:0.0f], [NSNumber numberWithFloat:0.25f], [NSNumber numberWithFloat:0.75], [NSNumber numberWithFloat:1.0f]];
    
    //可以组装任意多个
    animationGroup.animations = @[keyframeAnimation];
    
    animationGroup.duration = 0.5f;
    animationGroup.removedOnCompletion = NO;
    animationGroup.fillMode = kCAFillModeForwards;
    
    switch (_shareNum) {
        case 1:{
            [self.textLayer1 addAnimation:animationGroup forKey:nil];
            
        }break;
            
        case 2:{
            [self.textLayer2 addAnimation:animationGroup forKey:nil];
        }break;
            
        case 3:{
            [self.textLayer3 addAnimation:animationGroup forKey:nil];
        }break;
            
        case 4:{
            [self.textLayer4 addAnimation:animationGroup forKey:nil];
        }break;
            
        default:
            break;
    }
}

-(void)setGroupAnimation{
    _shareNum = 0;
    [_sharTimer invalidate];
    _sharTimer = nil;
    _sharTimer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(groupAnimation) userInfo:nil repeats:YES];
}


@end
