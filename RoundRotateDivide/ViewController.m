//
//  ViewController.m
//  RoundRotateDivide
//
//  Created by lv on 2019/1/10.
//  Copyright © 2019 lv. All rights reserved.
//

#import "ViewController.h"
#import "RoundRotateDivideView.h"


@interface ViewController ()

@property (nonatomic) RoundRotateDivideView * roundView;
@property (nonatomic) UIView *coverView;
@property (nonatomic) CGFloat angle;
@property (nonatomic) UILabel *tizhong;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _angle = -500;
    // Do any additional setup after loading the view, typically from a nib.
    
    
    _tizhong = [[UILabel alloc]initWithFrame:CGRectMake(10, 50, 150, 50)];
    
    [self.view addSubview:_tizhong];
    
    UIView *vv = [[UIView alloc]init];
    
    vv.frame = CGRectMake(0, 0, 2, self.view.bounds.size.height);
    
    vv.backgroundColor = UIColor.redColor;
    
    [self.view addSubview:vv];
    
    
    vv.center = CGPointMake(self.view.center.x, vv.center.y);
    
    
    
    _roundView = [[RoundRotateDivideView alloc ]initWithFrame:CGRectMake(0, 300, self.view.bounds.size.width * 1.5, self.view.bounds.size.width * 1.5)];

    [self.view addSubview:_roundView];


    _roundView.center = CGPointMake(self.view.center.x, _roundView.center.y);
    
    _coverView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    
    _coverView.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:_coverView];

    UIPanGestureRecognizer * panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    [_coverView addGestureRecognizer:panGesture];
    
    [_roundView showInitAngle:_angle];
    
}


-(void)panGesture:(UIPanGestureRecognizer *) gesture{
    CGPoint translation = [gesture translationInView:_coverView];
    //周长
    CGFloat perimeter =  _roundView.bounds.size.height * 0.5  * 2 * M_PI;
    //角度
    CGFloat angle = translation.x / perimeter * 360.0;


    if((_angle + angle) >= -190){
        return;
    }
    if((_angle + angle) <= -3090){
        return;
    }
    if(gesture.state == UIGestureRecognizerStateBegan){
        
    }else if(gesture.state == UIGestureRecognizerStateChanged){
        NSLog(@"滑动距离：%f",translation.x);
        NSLog(@"周长 :%f    角度：%f",perimeter,_angle + angle);
       
        [_roundView updateAngle:_angle + angle];
        
        
        float tizhong = fabs(_angle + angle);

        NSLog(@"体重：%f",tizhong / 10.0);
        
        _tizhong.text = [NSString stringWithFormat:@"体重：%f",tizhong / 10.0];
        
        
    }else if(gesture.state == UIGestureRecognizerStateEnded){
        _angle = _angle + angle;
    }
}



@end
