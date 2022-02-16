//
//  ViewController.m
//  ZZH_LoadingView
//
//  Created by zhangzhihua on 16/6/27.
//  Copyright © 2016年 zhangzhihua. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+Hex.h"
#import "ZZH_LoadingView.h"

@interface ViewController ()
@property (nonatomic , strong)ZZH_LoadingView *animationView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self _initAnimationView];
    
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(50, 50, 40, 40)];
    label.text = @"label";
    
//    [self.view addSubview:label];
//    [UIView animateWithDuration:1 animations:^{
//        label.transform =CGAffineTransformScale(label.transform, 2, 2);
//    } completion:^(BOOL finished) {
//        [UIView animateWithDuration:1 animations:^{
//            label.transform=CGAffineTransformIdentity;
//        }];
//    }];

}

// 标签字体  快评页面没有数据
- (void)_initAnimationView {
    CGFloat size = 100.0;
    self.animationView = [[ZZH_LoadingView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.view.frame)/2 - size/2, CGRectGetHeight(self.view.frame)/2 - size/2, size, size)];
    //_animationView.delegate = self;
    _animationView.parentFrame = self.view.frame;
    [self.view addSubview:_animationView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_animationView groupAnimation];
}

@end
