//
//  BallParkView.m
//  YankeesRoster
//
//  Created by Yuichi Fujiki on 10/6/12.
//  Copyright (c) 2012 Yuichi Fujiki. All rights reserved.
//

#import "BallParkView.h"

@implementation BallParkView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Draw outer sector
    [self drawOuterSector:context];
    
    // Draw inner sector
    [self drawInnerSector:context];
    
    // Draw inside field
    [self drawInfield:context];
    
    // Draw diamond
    [self drawDiamond:context];
    
    // Draw bases
    [self drawBaseAtPoint:CGPointMake(20, 170) context:context];
    [self drawBaseAtPoint:CGPointMake(115, 170) context:context];
    [self drawBaseAtPoint:CGPointMake(115, 265) context:context];
    
    [self drawHomebaseAtPoint:CGPointMake(20, 280) context:context];
    
    // Add lines
    [self drawFoulLineTo:CGPointMake(20, 22) context:context];
    [self drawFoulLineTo:CGPointMake(278, 280) context:context];
    
    // Draw home plate
    [self drawHomePlate:context];
    
    // Draw roster images
    [self drawRosterImage:[UIImage imageNamed:@"Jeter.jpeg"] atPoint:CGPointMake(90, 140) context:context];
    [self drawRosterImage:[UIImage imageNamed:@"Ichiro.jpeg"] atPoint:CGPointMake(65, 70) context:context];
    [self drawRosterImage:[UIImage imageNamed:@"ARod.jpeg"] atPoint:CGPointMake(25, 175) context:context];
    [self drawRosterImage:[UIImage imageNamed:@"Cano.jpeg"] atPoint:CGPointMake(160, 210) context:context];
    [self drawRosterImage:[UIImage imageNamed:@"Swisher.jpeg"] atPoint:CGPointMake(230, 230) context:context];
    [self drawRosterImage:[UIImage imageNamed:@"Teixeira.jpeg"] atPoint:CGPointMake(120, 270) context:context];
    [self drawRosterImage:[UIImage imageNamed:@"Granderson.jpeg"] atPoint:CGPointMake(180, 120) context:context];
    [self drawRosterImage:[UIImage imageNamed:@"Martin.jpeg"] atPoint:CGPointMake(30, 270) context:context];
    [self drawRosterImage:[UIImage imageNamed:@"Kuroda.jpeg"] atPoint:CGPointMake(95, 200) context:context];
    
    [self drawRosterImage:[UIImage imageNamed:@"Ibanez.jpeg"] atPoint:CGPointMake(240, 40) context:context];
}

- (void)drawOuterSector:(CGContextRef)context
{
    CGContextSetFillColorWithColor(context, [UIColor brownColor].CGColor);
    
    CGMutablePathRef arcPath = CGPathCreateMutable();
    CGPathAddArc(arcPath, NULL, 10, 290, 280, 0, 3 * M_PI_2, YES);
    CGPathAddLineToPoint(arcPath, NULL, 10, 290);
    CGPathAddLineToPoint(arcPath, NULL, 290, 290);
    CGContextAddPath(context, arcPath);
    
    CGContextFillPath(context);
    CGPathRelease(arcPath);
}

- (void)drawInnerSector:(CGContextRef) context
{
    CGContextSetFillColorWithColor(context, [UIColor colorWithRed:0.001 green:0.475 blue:0.002 alpha:1.000].CGColor);
    
    CGFloat startAngle = -atanf(20.f/280);
    CGFloat endAngle = -atanf(280.f/20);
    NSLog(@"From %f to %f", startAngle, endAngle);
    CGMutablePathRef arcPath = CGPathCreateMutable();
    CGPathAddArc(arcPath, NULL, 0, 300, 280, startAngle, endAngle, YES);
    CGPathAddLineToPoint(arcPath, NULL, 20, 280);
    CGPathAddLineToPoint(arcPath, NULL, 280, 280);
    CGContextAddPath(context, arcPath);
    
    CGContextFillPath(context);
    CGPathRelease(arcPath);    
}

- (void) drawInfield:(CGContextRef) context
{
    CGContextSetFillColorWithColor(context, [UIColor brownColor].CGColor);
    
    CGMutablePathRef arcPath = CGPathCreateMutable();
    CGPathAddArc(arcPath, NULL, 10, 290, 180, 0, 3 * M_PI_2, YES);
    CGPathAddLineToPoint(arcPath, NULL, 10, 290);
    CGPathAddLineToPoint(arcPath, NULL, 190, 290);
    CGContextAddPath(context, arcPath);
    
    CGContextFillPath(context);
    CGPathRelease(arcPath);
}

- (void) drawDiamond:(CGContextRef) context
{
    CGContextSetFillColorWithColor(context, [UIColor colorWithRed:0.001 green:0.475 blue:0.002 alpha:1.000].CGColor);
    
    CGMutablePathRef rectPath = CGPathCreateMutable();
    CGPathAddRect(rectPath, NULL, CGRectMake(20, 170, 110, 110));
    
    CGContextAddPath(context, rectPath);
    CGContextFillPath(context);
    CGPathRelease(rectPath);
}

- (void) drawBaseAtPoint:(CGPoint)point context:(CGContextRef)context
{
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    
    CGMutablePathRef rectPath = CGPathCreateMutable();
    CGPathAddRect(rectPath, NULL, CGRectMake(point.x, point.y, 15, 15));
    
    CGContextAddPath(context, rectPath);
    CGContextFillPath(context);
    CGPathRelease(rectPath);
}

- (void) drawHomebaseAtPoint:(CGPoint)point context:(CGContextRef)context
{
    CGMutablePathRef homebasePath = CGPathCreateMutable();
    CGPathMoveToPoint(homebasePath, NULL, point.x, point.y);
    CGPathAddLineToPoint(homebasePath, NULL, point.x + 15, point.y);
    CGPathAddLineToPoint(homebasePath, NULL, point.x + 20, point.y - 5);
    CGPathAddLineToPoint(homebasePath, NULL, point.x + 5, point.y - 20);
    CGPathAddLineToPoint(homebasePath, NULL, point.x, point.y - 15);
    
    CGContextAddPath(context, homebasePath);
    CGContextFillPath(context);
    CGPathRelease(homebasePath);
}

- (void) drawFoulLineTo:(CGPoint)point context:(CGContextRef)context
{
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    CGMutablePathRef linePath = CGPathCreateMutable();
    
    CGPathMoveToPoint(linePath, NULL, 20, 280);
    CGPathAddLineToPoint(linePath, NULL, point.x, point.y);
    
    CGContextAddPath(context, linePath);
    CGContextStrokePath(context);
    CGPathRelease(linePath);
}

- (void)drawHomePlate:(CGContextRef)context
{
    CGContextSaveGState(context);
    
    CGContextTranslateCTM(context, 0.f, 300.f);
    CGContextRotateCTM(context, -M_PI_4);
    
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextSetLineWidth(context, 10.f);
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, 105, - 7.5);
    CGPathAddLineToPoint(path, NULL, 105, + 7.5);
    
    CGContextAddPath(context, path);
    CGContextStrokePath(context);
    
    CGPathRelease(path);
    
    CGContextRestoreGState(context);
}

- (void) drawRosterImage:(UIImage *)image atPoint:(CGPoint)point context:(CGContextRef)context
{
    CGContextSaveGState(context);
    
    CGContextScaleCTM(context, 1, -1);
    CGContextTranslateCTM(context, 0, -300);
    CGContextScaleCTM(context, 0.5, 0.5);
    
    CGPoint pointInNewCoord = CGPointMake(point.x * 2, (300 - point.y) * 2);
    
    CGPoint origin = CGPointMake(pointInNewCoord.x - image.size.width / 2, pointInNewCoord.y - image.size.height / 2);
    CGRect frame = (CGRect){origin, image.size};
    
    CGContextDrawImage(context, frame, image.CGImage);
    
    CGContextRestoreGState(context);
}
@end
