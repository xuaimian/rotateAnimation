//
//  CenterLayer.h
//  ZZH_LoadingView
//
//  Created by zhangzhihua on 16/6/27.
//  Copyright © 2016年 zhangzhihua. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "UIColor+Hex.h"
#import <UIKit/UIKit.h>

@interface CenterLayer : CAShapeLayer

-(void)create_textLayer;


-(void)textStarAnimation;

-(void)groupAnimation;

-(void)setGroupAnimation;

-(void)smallAnimation;

@end
