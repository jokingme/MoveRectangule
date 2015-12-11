//
//  ViewController.m
//  MoveRectangle
//
//  Created by Joker on 15/12/11.
//  Copyright © 2015年 Joker. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *Blue;
@property (weak, nonatomic) IBOutlet UIImageView *red;
@property (weak, nonatomic) IBOutlet UIImageView *Yellow;

#define BlueFrame CGRectMake(50, 80, 100, 100)
#define RedFrame CGRectMake(125, 280, 100, 100)
#define YellowFrame CGRectMake(220, 480, 100, 100)
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _Blue.frame = BlueFrame;
    _red.frame = RedFrame;
    _Yellow.frame = YellowFrame;
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

//获取点击的点
- (CGPoint)locationInTouch:(NSSet *)touchs {
    
    
    UITouch *touch = [touchs anyObject];
    
    return [touch locationInView:self.view];
}

- (BOOL)isImageViewContainsPoint:(CGPoint)location {
    if (CGRectContainsPoint(_Blue.frame, location) || CGRectContainsPoint(_red.frame, location) || CGRectContainsPoint(_Yellow.frame, location)) {
        return YES;
    }
    return NO;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    //判断是不是在需要处理的区域内
    //需要处理 先放大 然后移动中心点 到 点击的那个点
    //先取出点击的point (self.view)
    
    CGPoint location = [self locationInTouch:touches];
    if (CGRectContainsPoint(_Blue.frame, location)) {
        [UIView animateWithDuration:0.2 animations:^{
            _Blue.center = location;
        }];
    }
    if (CGRectContainsPoint(_red.frame, location)) {
        [UIView animateWithDuration:0.2 animations:^{
            _red.center = location;
        }];
    }
    if (CGRectContainsPoint(_Yellow.frame, location)) {
        [UIView animateWithDuration:0.2 animations:^{
            _Yellow.center = location;
        }];
    }
}


- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
   
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    CGPoint location = [self locationInTouch:touches];
    if (CGRectContainsPoint(_Blue.frame, location)) {
        
        [UIView animateWithDuration:0.2 animations:^{
            _Blue.center = location;
        }];
    }
    if (CGRectContainsPoint(_red.frame, location)) {
        [UIView animateWithDuration:0.2 animations:^{
            _red.center = location;
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

//触摸时不松开 锁屏
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
