//
//  RoundRotateDivideView.m
//  RoundRotateDivide
//
//  Created by lv on 2019/1/10.
//  Copyright © 2019 lv. All rights reserved.
//

#import "RoundRotateDivideView.h"

@implementation RoundRotateDivideView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _labList = [[NSMutableArray alloc]init];
        _labTextList = [[NSMutableArray alloc]init];
        CAShapeLayer *solidLine =  [CAShapeLayer layer];
        CGMutablePathRef solidPath =  CGPathCreateMutable();
        solidLine.lineWidth = 1.0f ;
        solidLine.strokeColor = [UIColor blackColor].CGColor;
        solidLine.fillColor = [UIColor clearColor].CGColor;
        CGPathAddEllipseInRect(solidPath, nil, self.bounds);
        solidLine.path = solidPath;
        CGPathRelease(solidPath);
        [self.layer addSublayer:solidLine];
        
        [self drawScaleValueWithDivide:360];

    }
    return self;
}


-(void)drawScaleValueWithDivide:(NSInteger)divide{
    CGFloat angle = 360.0 / divide;//单个刻度角度
//    NSLog(@"角度%f",angle);
    for(int i = 0 ; i < divide ; i++){
        [_labTextList addObject:[NSString stringWithFormat:@"%d",i]];
        CGFloat height = 10;
        CGFloat width = 1;
        CGFloat cha = 10;
        CGFloat radian = i * angle * M_PI / 180.0;
//        NSLog(@"旋转弧度radian:%f",radian);
        CGFloat aradian = 90 * M_PI / 180.0;///方向修正
        if(i%10 == 0){
            height = 20;
            width = 1;
            cha = cha * 1.5;
            
            UILabel *lab = [[UILabel alloc]init];
            lab.frame = CGRectMake(0, 0, 30, 20);
            lab.text = [NSString stringWithFormat:@"%d",i/10];
            CGFloat radian = i * angle * M_PI / 180.0;
            CGFloat x = (self.bounds.size.height * 0.5 - 33)* cosf(radian);
            CGFloat y = (self.bounds.size.height * 0.5 - 33)* sinf(radian);
            lab.center = CGPointMake(x + self.bounds.size.height * 0.5, y + self.bounds.size.height * 0.5);
            lab.layer.affineTransform = CGAffineTransformMakeRotation(radian + aradian);
            lab.font = [UIFont systemFontOfSize:12];
            lab.textAlignment = NSTextAlignmentCenter;
            [_labList addObject:lab];
            [self addSubview:lab];
        }else if(i % 5 == 0){
            height = 15;
            width = 1;
            cha = cha * 1.25;
        }
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
        line.backgroundColor = UIColor.blackColor;
        CGFloat x = (self.bounds.size.height * 0.5 + 5 - cha)* cosf(radian);
        CGFloat y = (self.bounds.size.height * 0.5 + 5 - cha)* sinf(radian);
        line.center = CGPointMake(x + self.bounds.size.height * 0.5, y + self.bounds.size.height * 0.5);
        line.layer.affineTransform = CGAffineTransformMakeRotation(radian - aradian);
        [self addSubview:line];
    }
    
}


-(void)showInitAngle:(CGFloat)angle{
    int du = (int) angle / 10;
    int quan = abs(du) / 36;
    for (int i = 0 ; i < _labList.count; i++) {
        UILabel *lab = (UILabel *) _labList[i];
        lab.text = [NSString stringWithFormat:@"%d",quan * 36 + i];
    }
    //弧度
    CGFloat radian = (angle - 90) * M_PI / 180.0;;
    self.layer.affineTransform = CGAffineTransformMakeRotation(radian);
}


-(void)updateAngle:(CGFloat)angle{
    //弧度
    CGFloat radian = (angle - 90) * M_PI / 180.0;;
    self.layer.affineTransform = CGAffineTransformMakeRotation(radian);
    
    int zdu = (int) (angle - 90) / 10;
    int zquan = abs(zdu) / 36;
    int zyu = abs(zdu) % 36;
//    NSLog(@"左lab度：%d 左圈 ：%d 左余：%d",zdu,zquan,zyu);
    UILabel *zlab = (UILabel *) _labList[zyu];
    zlab.text = [NSString stringWithFormat:@"%d",zquan * 36 + zyu];
    
    
    int ydu = (int) (angle + 180.0 - 90) / 10;
    int yquan = abs(ydu) / 36;
    int yyu = abs(ydu) % 36;
//    NSLog(@"右lab度：%d 右圈 ：%d 右余：%d",ydu,yquan,yyu);
    UILabel *ylab = (UILabel *) _labList[yyu];
    ylab.text = [NSString stringWithFormat:@"%d",yquan * 36 + yyu];
    
    
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
