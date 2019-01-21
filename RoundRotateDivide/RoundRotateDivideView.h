//
//  RoundRotateDivideView.h
//  RoundRotateDivide
//
//  Created by lv on 2019/1/10.
//  Copyright © 2019 lv. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RoundRotateDivideView : UIView
@property (nonatomic) NSMutableArray *lineList;
@property (nonatomic) NSMutableArray *labList;
-(void)showInitAngle:(CGFloat)angle;
-(void)updateAngle:(CGFloat)angle;
@end


@interface LinePoint : NSObject

@property (nonatomic) CGFloat start_x;
@property (nonatomic) CGFloat start_y;
@property (nonatomic) CGFloat end_x;
@property (nonatomic) CGFloat end_y;

@end


NS_ASSUME_NONNULL_END
