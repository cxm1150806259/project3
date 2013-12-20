//
//  CXMQuartzFunView.h
//  iPainter1.0
//
//  Created by Leo_champion on 13-12-20.
//  Copyright (c) 2013年 Leo_champion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CXMQuartzFunView : UIView
@property (nonatomic) CGPoint firstTouch;
@property (nonatomic) CGPoint lastTouch;
@property (nonatomic) UIColor *currentColor;
@property (nonatomic) int currentSize;
@end
