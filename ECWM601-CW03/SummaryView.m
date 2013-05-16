//
//  SummaryView.m
//  ECWM601-CW03
//
//  Created by Snow Leopard User on 16/05/2013.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "SummaryView.h"

@implementation SummaryView

float xAxisGapSize = 10;
float yAxisGapSize = 117.5;

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
    [self drawGrid];
    // Drawing code
}


-(void) drawGrid {
    
    // BEGIN drawing grid
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1);
    [[UIColor lightGrayColor] set]; // R13: adding the lightGrayColor
    CGContextBeginPath(context);
    
    // drawing the vertical lines in the grid
    /*CGFloat ygridGaps = self.bounds.size.height / 29.4;
    CGFloat yintermediateGridGap = 29.4;
    for (int i = 0; i < ygridGaps; i++) {
        CGContextMoveToPoint(context, 0, yintermediateGridGap);
        CGContextAddLineToPoint(context, self.bounds.size.width, yintermediateGridGap);
        yintermediateGridGap = yintermediateGridGap + 29.4;
    }
    
    // drawing the horizontal lines in the grid
    CGFloat xgridGaps = self.bounds.size.width / 35;
    CGFloat xintermediateGridGap = 35;
    for (int i = 0; i < xgridGaps; i++) {
        CGContextMoveToPoint(context, xintermediateGridGap, 0);
        CGContextAddLineToPoint(context, xintermediateGridGap, self.bounds.size.height);
        xintermediateGridGap = xintermediateGridGap + 35;
    }
    
    CGContextStrokePath(context);//*/
    // END drawing grid
    
    
    // BEGIN drawing the x and y Axis
    // same lightGrayColor color but with the alpha 1 to increase the line width
    [[UIColor colorWithRed:85 green:84 blue:85 alpha:1] set];
    CGContextBeginPath(context); // beginning of the paths
    
    // X axis
    CGContextMoveToPoint(context, 35.0f, (self.bounds.size.height - 35.0f));
    CGContextAddLineToPoint(context, self.bounds.size.width, (self.bounds.size.height - 35.0f));
    
    // Y axis
    CGContextMoveToPoint(context, (35.0f), 0.0f);
    CGContextAddLineToPoint(context, (35.0f), self.bounds.size.height - 35.0f);
    
    
    CGAffineTransform xform = CGAffineTransformMake(cos(0),  sin(0), sin(0), -cos(0), 0.0,  0.0);
    CGContextSetTextMatrix(context, xform);
    CGContextSelectFont(context, "Arial", 15.f, kCGEncodingMacRoman); // setting the font properties. (font-family, font-weight, encoding type)
    CGContextSetTextDrawingMode(context, kCGTextFillStroke);
    
    // creating + Digits in X axis *********************/
    /*CGFloat xPlusDigitGap = (self.bounds.size.width/2) + xAxisGapSize;
    for (int i = 0; i < 5; i++) {
        //NSString *lable = i;
        NSString* index = [NSString stringWithFormat:@"%.2f", i];
        const char* number = [index UTF8String];
        CGContextShowTextAtPoint(context, xPlusDigitGap - 7, (self.bounds.size.height/2)+20, number, index.length);
        xPlusDigitGap = xPlusDigitGap + xAxisGapSize;
    }//*/
    
    // creating scores digits in Y axis *********************/
    CGFloat yPlusDigitGap = (self.bounds.size.height) - 35;
    for (int i = 0; i <= 5; i++) {
        NSString* index = [NSString stringWithFormat:@"%d", i*20];
        const char* number = [index UTF8String];
        CGContextShowTextAtPoint(context, 5, yPlusDigitGap, number, index.length);
        yPlusDigitGap = yPlusDigitGap - 50;
    }
    
    // Drawing the Y axis ***********************************************/
    /*CGFloat yaxis = self.bounds.size.height;
    NSLog(@"%f", yaxis);
    CGFloat yNumOfGaps = yaxis / yAxisGapSize;
    
    // main gaps
    CGFloat yMainGap = yAxisGapSize;
    for (int i = 0; i < yNumOfGaps; i++) {
        CGContextMoveToPoint(context, (self.bounds.size.width/2)-5, yMainGap);
        CGContextAddLineToPoint(context, (self.bounds.size.width/2)+5, yMainGap);
        yMainGap = yMainGap + yAxisGapSize;
    }
    
    // intermediate gap between main gaps
    CGFloat yintermediateGaps = yaxis / 29.4;
    CGFloat yintermediateGap = 29.4;
    for (int i = 0; i < yintermediateGaps; i++) {
        CGContextMoveToPoint(context, (self.bounds.size.width/2)-2.5, yintermediateGap);
        CGContextAddLineToPoint(context, (self.bounds.size.width/2)+2.5, yintermediateGap);
        yintermediateGap = yintermediateGap + 29.4;
    }
    
    // Drawing the X axis ***********************************************/
    /*CGFloat xaxis = self.bounds.size.width;
    NSLog(@"%f", xaxis);
    CGFloat xNumOfGaps = xaxis / xAxisGapSize;
    
    // main gaps
    CGFloat xMainGap = xAxisGapSize;
    for (int i = 0; i < xNumOfGaps; i++) {
        CGContextMoveToPoint(context, xMainGap, (self.bounds.size.height/2)-5);
        CGContextAddLineToPoint(context, xMainGap, (self.bounds.size.height/2)+5);
        xMainGap = xAxisGapSize + xAxisGapSize;
    }
    
    // intermediate gap between main gaps
    CGFloat xintermediateGaps = xaxis / 35;
    CGFloat xintermediateGap = 35;
    for (int i = 0; i < xintermediateGaps; i++) {
        CGContextMoveToPoint(context, xintermediateGap, (self.bounds.size.height/2)-2.5);
        CGContextAddLineToPoint(context, xintermediateGap, (self.bounds.size.height/2)+2.5);
        xintermediateGap = xintermediateGap + 35;
        
    }//*/
    
    CGContextStrokePath(context);
    // END drawing the x and y Axis
}

@end
