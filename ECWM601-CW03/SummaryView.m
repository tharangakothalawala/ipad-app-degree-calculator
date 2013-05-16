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
float graphMarginBottom = 35;
float graphMarginLeft = 35;

@synthesize scoreList;

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
    /*
     CGContextRef contextForPath = UIGraphicsGetCurrentContext();
     [[UIColor redColor] set]; // R13: adding the redColor
     CGContextBeginPath(contextForPath);
     
     
     * The code seems to be not working when the pointArray set inside the drawPaths method
     * So I have hardcoded a smaple of points to show how I am drawing the points in the graph
     *
    self.scoreList = [[NSMutableArray alloc] init];
    NSString *point1 = @"0";
    NSString *point2 = @"25";
    NSString *point3 = @"35";
    NSString *point4 = @"45";
    NSString *point5 = @"86";
    NSString *point6 = @"64";
    [self.scoreList addObject:point1];
    [self.scoreList addObject:point2];
    [self.scoreList addObject:point3];
    [self.scoreList addObject:point4];
    [self.scoreList addObject:point5];
    [self.scoreList addObject:point6];
    NSLog(@"pointList : %@", self.scoreList);
    //NSLog(@"x: %@", [self.scoreList count]);
    
    // Drawing the paths according to the user defined points
    // only go through the point array if we have any points to draw
    if ([self.scoreList count] > 0) {
        //NSArray *initialGaphPoints = [[self.scoreList objectAtIndex:0] componentsSeparatedByString:@","];
        //CGFloat score = [[self.scoreList objectAtIndex:0] floatValue];
        
        
        // creating the initial starting point of any given graph (a set of points)
        CGFloat lastXPoint = 20.0f;
        CGFloat lastYPoint = [[self.scoreList objectAtIndex:0] floatValue];
        // scaling for the static grid
        NSLog(@"x: %@", lastXPoint);
        
        for (int i = 1; i < [self.scoreList count]; i++) { //sizeof(self.array)-1
            CGFloat score = [[self.scoreList objectAtIndex:i] floatValue];
            CGFloat yPoint = score * 20;
            
            CGContextMoveToPoint(contextForPath, lastXPoint, lastYPoint);
            CGContextAddLineToPoint(contextForPath, i * 20, yPoint);
            
            lastXPoint = i * 20;
            lastYPoint = yPoint;
        }
    }
    
    CGContextStrokePath(contextForPath);
    //*/
    
    [self drawGrid];
    // Drawing code
}


-(void) drawGrid {
    
    // BEGIN drawing grid
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1);
    [[UIColor lightGrayColor] set]; // R13: adding the lightGrayColor
    CGContextBeginPath(context);

    // BEGIN drawing the x and y Axis
    // same lightGrayColor color but with the alpha 1 to increase the line width
    [[UIColor colorWithRed:85 green:84 blue:85 alpha:1] set];
    CGContextBeginPath(context); // beginning of the paths
    
    // X axis
    CGContextMoveToPoint(context, graphMarginLeft, (self.bounds.size.height - graphMarginBottom));
    CGContextAddLineToPoint(context, self.bounds.size.width, (self.bounds.size.height - graphMarginBottom));
    
    // Y axis
    CGContextMoveToPoint(context, graphMarginLeft, 0.0f);
    CGContextAddLineToPoint(context, graphMarginLeft, self.bounds.size.height - graphMarginBottom);
    
    
    CGAffineTransform xform = CGAffineTransformMake(cos(0),  sin(0), sin(0), -cos(0), 0.0,  0.0);
    CGContextSetTextMatrix(context, xform);
    CGContextSelectFont(context, "Arial", 15.f, kCGEncodingMacRoman); // setting the font properties. (font-family, font-weight, encoding type)
    CGContextSetTextDrawingMode(context, kCGTextFillStroke);
    
    // creating + Digits in X axis *********************/
    CGFloat xPlusDigitGap = graphMarginBottom;
    for (int i = 0; i <= 10; i++) {
        NSString* index = [NSString stringWithFormat:@"%d", i*20];
        const char* number = [index UTF8String];
        CGContextShowTextAtPoint(context, xPlusDigitGap, (self.bounds.size.height-20), number, index.length);
        xPlusDigitGap = xPlusDigitGap + graphMarginBottom;
    }//*/
    
    // creating scores digits in Y axis *********************/
    CGFloat yPlusDigitGap = (self.bounds.size.height) - graphMarginBottom;
    for (int i = 0; i <= 5; i++) {
        NSString* index = [NSString stringWithFormat:@"%d", i*20];
        const char* number = [index UTF8String];
        CGContextShowTextAtPoint(context, 5, yPlusDigitGap, number, index.length);
        yPlusDigitGap = yPlusDigitGap - 50;
    }
    
    CGContextStrokePath(context);
    
    ///////////////////////////////////////////////////////////////////////////////////////

    // END drawing the x and y Axis
    
    CGContextRef contextForPath = UIGraphicsGetCurrentContext();
    [[UIColor redColor] set]; // R13: adding the redColor
    CGContextBeginPath(contextForPath);
    
    /*
     * The code seems to be not working when the pointArray set inside the drawPaths method
     * So I have hardcoded a smaple of points to show how I am drawing the points in the graph
     */
    self.scoreList = [[NSMutableArray alloc] init];
    NSString *point1 = @"90";
    NSString *point2 = @"100";
    NSString *point3 = @"70";
    NSString *point4 = @"60";
    NSString *point5 = @"80";
    NSString *point6 = @"40";
    [self.scoreList addObject:point1];
    [self.scoreList addObject:point2];
    [self.scoreList addObject:point3];
    [self.scoreList addObject:point4];
    [self.scoreList addObject:point5];
    [self.scoreList addObject:point6];//*/
    NSLog(@"pointList : %@", self.scoreList);
    //NSLog(@"x: %@", [self.scoreList count]);
    
    // Drawing the paths according to the user defined points
    // only go through the point array if we have any points to draw
    if ([self.scoreList count] > 0) {
        //NSArray *initialGaphPoints = [[self.scoreList objectAtIndex:0] componentsSeparatedByString:@","];
        //CGFloat score = [[self.scoreList objectAtIndex:0] floatValue];
        
        
        // creating the initial starting point of any given graph (a set of points)
        CGFloat lastXPoint = graphMarginBottom;
        CGFloat lastYPoint = self.bounds.size.height-graphMarginBottom;
        // scaling for the static grid
        
        // scaling the user defined paths (commented due to a error of not showing the lines)
        //lastXPoint = lastXPoint / xStartingNumber;
        //lastYPoint = lastYPoint / xStartingNumber;
        //lastXPoint = lastXPoint + (lastXPoint * 175);
        //lastYPoint = lastYPoint + (lastYPoint * 117.5);
        // correctly positioning, without starting form the original view (x and y) starting points
        //lastXPoint = self.bounds.size.width/2 + lastXPoint;
        //lastYPoint = self.bounds.size.height/2 - lastYPoint;
        NSLog(@"x: %@", lastXPoint);
        
        for (int i = 1; i < [self.scoreList count]; i++) { //sizeof(self.array)-1
            CGFloat score = [[self.scoreList objectAtIndex:i] floatValue];
            //CGFloat xPoint = [[graphPoints objectAtIndex:0] floatValue];
            //CGFloat yPoint = [[graphPoints objectAtIndex:1] floatValue];
            NSLog(@"%g", score);
            //CGFloat *scale = (score / 20) * 50;
            // scaling the user defined paths
            //xPoint = xPoint / xStartingNumber;
            //yPoint = yPoint / xStartingNumber;
            //xPoint = xPoint + (xPoint * 175);
            //CGFloat yPoint = score * 20;
            //xPoint = self.bounds.size.width/2 + xPoint;
            //yPoint = self.bounds.size.height/2 - yPoint;
            
            CGContextMoveToPoint(contextForPath, lastXPoint, lastYPoint);
            CGContextAddLineToPoint(contextForPath, (i+1) * 20, (self.bounds.size.height-((score / 20) * 51)-graphMarginBottom));
            
            lastXPoint = (i+1) * 20;
            lastYPoint = (self.bounds.size.height-((score / 20) * 51)-graphMarginBottom);
        }
    }//*/
    
    CGContextStrokePath(contextForPath);
}

@end
