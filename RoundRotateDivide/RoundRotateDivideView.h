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
@property (nonatomic) NSMutableArray *labTextList;
@property (nonatomic) NSMutableArray *labList;
-(void)showInitAngle:(CGFloat)angle;
-(void)updateAngle:(CGFloat)angle;
@end

NS_ASSUME_NONNULL_END
