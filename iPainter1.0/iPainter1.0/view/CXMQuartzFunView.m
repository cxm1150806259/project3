//
//  CXMQuartzFunView.m
//  iPainter1.0
//
//  Created by Leo_champion on 13-12-20.
//  Copyright (c) 2013年 Leo_champion. All rights reserved.
//

#import "CXMQuartzFunView.h"
#import "Constants.h"
#import "ImageData.h"

@implementation CXMQuartzFunView
@synthesize firstTouch,lastTouch,currentColor,currentSize;
-(id)initWithCoder:(NSCoder *)aDecoder
{
    if(self = [super initWithCoder:aDecoder]){
        currentColor = [UIColor blackColor];
        currentSize = 2;
        
        [ImageData setImage:[[UIImage alloc] initWithCIImage:nil]];
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGPoint drawPoint = CGPointMake(0, 0);
    
    [[ImageData getImage] drawAtPoint:drawPoint];
    
    CGContextSetLineWidth(context, (CGFloat)currentSize);
    CGContextSetStrokeColorWithColor(context, currentColor.CGColor);
    CGContextMoveToPoint(context, firstTouch.x, firstTouch.y);
    CGContextAddLineToPoint(context, lastTouch.x, lastTouch.y);
    CGContextStrokePath(context);
    
    CGImageRef contextImage = CGBitmapContextCreateImage(context);
    UIImage *resultImage = [UIImage imageWithCGImage:contextImage];
    [ImageData setImage:resultImage];
    contextImage = nil;
    resultImage = nil;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    firstTouch = [touch locationInView:self];
    lastTouch = firstTouch;
    [self setNeedsDisplay];
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    firstTouch = lastTouch;
    lastTouch = [touch locationInView:self];
    [self setNeedsDisplay];
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    firstTouch = lastTouch;
    lastTouch = [touch locationInView:self];
    [self setNeedsDisplay];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
