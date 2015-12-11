//
//  ViewController.m
//  MoveRectangle-1
//
//  Created by Joker on 15/12/11.
//  Copyright © 2015年 Joker. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *Blue;
@property (weak, nonatomic) IBOutlet UIImageView *Red;
@property (weak, nonatomic) IBOutlet UIImageView *Yellow;

#define BlueFrame CGRectMake(20, 20, 100, 100)
#define RedFrame CGRectMake(130, 280, 100, 100)
#define YellowFrame CGRectMake(220, 520, 100, 100)
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _Blue.frame = BlueFrame;
    _Red.frame = RedFrame;
    _Yellow.frame = YellowFrame;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    //判断是不是在需要处理的区域内
    //需要处理 先放大 然后移动中心点 到 点击的那个点
    //先取出点击的point (self.view)
    UITouch *Touch = [touches anyObject];
    
    CGPoint location = [Touch locationInView:self.view];
//    if (CGRectContainsPoint(_Blue.frame, location)) {
//        [UIView animateWithDuration:0.2 animations:^{
//            _Blue.center = location;
//            _Blue.transform = CGAffineTransformMakeScale(1.2, 1.2);
//        }];
//    }
//    if (CGRectContainsPoint(_Red.frame, location)) {
//        [UIView animateWithDuration:0.2 animations:^{
//            _Red.center = location;
//            _Red.transform = CGAffineTransformMakeScale(1.2, 1.2);
//        }];
//    }
//    if (CGRectContainsPoint(_Yellow.frame, location)) {
//        [UIView animateWithDuration:0.2 animations:^{
//            _Yellow.center = location;
//            _Yellow.transform = CGAffineTransformMakeScale(1.2, 1.2);
//        }];
//    }
//    if (Touch.tapCount == 2) {
//        [self resetFrames];
//    }
    
    
    //需要设置UIImageView 与用户交互 为YES
    //如果需要处理，把对应的imageView放大1.2，更改imageView的center为点击的point
    if (CGRectContainsPoint(_Blue.frame, location)
        ||CGRectContainsPoint(_Red.frame, location)
        ||CGRectContainsPoint(_Yellow.frame, location)) {
        //取出触摸发生的视图
        UIImageView *imageView = (UIImageView *)Touch.view;
        imageView.center = location;
        imageView.transform = CGAffineTransformMakeScale(1.2, 1.2);
        [UIView animateWithDuration:0.5 animations:^{
            
        }];
    }else{
        if (Touch.tapCount == 2) {
            [self resetFrames];
        }
    }

    
}
//重置frame
-(void)resetFrames{
    [UIView animateWithDuration:0.5 animations:^{
        _Blue.frame = BlueFrame;
        _Red.frame = RedFrame;
        _Yellow.frame = YellowFrame;
    }];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch *Touch = [touches anyObject];
    CGPoint location = [Touch locationInView:self.view];
    if (CGRectContainsPoint(_Blue.frame, location)) {
        
        [UIView animateWithDuration:0.2 animations:^{
            _Blue.center = location;
        }];
    }
    if (CGRectContainsPoint(_Red.frame, location)) {
        [UIView animateWithDuration:0.2 animations:^{
            _Red.center = location;
        }];
    }
    if (CGRectContainsPoint(_Yellow.frame, location)) {
        [UIView animateWithDuration:0.2 animations:^{
            _Yellow.center = location;
        }];
    }
}
- (void)touchesEstimatedPropertiesUpdated:(NSSet *)touches {
    
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    
    UIImageView *imgView = (UIImageView *)touch.view;
    
    [UIView animateWithDuration:0.5 animations:^{
        imgView.transform = CGAffineTransformIdentity;
    }];
}

//触摸时不松开 锁屏
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
