//
//  SummaryView.m
//  ECWM601-CW03
//
//  Created by Tharanga S Kothalawala on 16/05/2013.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "SummaryView.h"

@implementation SummaryView

float yAxisGapSize = 51;
float graphMarginBottom = 35;
float graphMarginLeft = 35;

@synthesize scoreList;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code - got no init code atm for the graph
    }
    return self;
}

- (void) drawGraph:(NSMutableArray*) scoreArray {
    NSLog(@"UIView:drawGraph %@", scoreArray);
    self.scoreList = scoreArray;
    
    [self setNeedsDisplay];
}


/*
 * Drawing the summary view Bar graph
 */
- (void)drawRect:(CGRect)rect {
    /*
     * I have hardcoded some sample scores to show the plotting
     */
    self.scoreList = [[NSMutableArray alloc] init];
    NSString *point1 = @"40";
    NSString *point2 = @"83";
    NSString *point3 = @"56";
    NSString *point4 = @"76";
    NSString *point5 = @"60";
    NSString *point6 = @"90";
    [self.scoreList addObject:point1];
    [self.scoreList addObject:point2];
    [self.scoreList addObject:point3];
    [self.scoreList addObject:point4];
    [self.scoreList addObject:point5];
    [self.scoreList addObject:point6];
    [self.scoreList addObject:point1];
    [self.scoreList addObject:point2];
    [self.scoreList addObject:point3];
    [self.scoreList addObject:point4];
    [self.scoreList addObject:point5];
    [self.scoreList addObject:point6];
    [self.scoreList addObject:point1];
    [self.scoreList addObject:point2];
    [self.scoreList addObject:point3];
    [self.scoreList addObject:point4];
    [self.scoreList addObject:point5];
    [self.scoreList addObject:point6];
    [self.scoreList addObject:point1];
    [self.scoreList addObject:point2];
    [self.scoreList addObject:point3];
    [self.scoreList addObject:point4];
    [self.scoreList addObject:point5];
    [self.scoreList addObject:point6];
    [self.scoreList addObject:point1];
    [self.scoreList addObject:point2];
    [self.scoreList addObject:point3];
    [self.scoreList addObject:point4];
    [self.scoreList addObject:point5];
    [self.scoreList addObject:point6];//*/
    NSLog(@"pointList : %@", self.scoreList);
    NSLog(@"x: %d", [self.scoreList count]);
    
    
    
    // DRAWING HAPPENS HERE
    [self drawGrid];
    [self drawLines];
}

-(void) drawGrid {
    // BEGIN drawing graph
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1);
    [[UIColor lightGrayColor] set];
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
    
    // main Y gaps
    CGFloat yMainGap = ((self.bounds.size.height) - graphMarginBottom) - 51;
    for (int i = 0; i < 5; i++) {
        CGContextMoveToPoint(context, graphMarginLeft-5, yMainGap);
        CGContextAddLineToPoint(context, graphMarginLeft+5, yMainGap);
        yMainGap = yMainGap - 51;
    }
    // END drawing the x and y Axis
    
    
    // BEGIN drawing the axis numbers
    CGAffineTransform xform = CGAffineTransformMake(cos(0),  sin(0), sin(0), -cos(0), 0.0,  0.0);
    CGContextSetTextMatrix(context, xform);
    CGContextSelectFont(context, "Arial", 15.f, kCGEncodingMacRoman); // setting the font properties. (font-family, font-weight, encoding type)
    CGContextSetTextDrawingMode(context, kCGTextFillStroke);
    
    //CGFloat scoreGap = (self.bounds.size.width - graphMarginLeft-20 ) / [self.scoreList count];
    
    // creating ... in X axis (-)
    /*CGFloat xPlusDigitGap = scoreGap+(graphMarginBottom);
    for (int i = 0; i <= [self.scoreList count]; i++) {
        NSString* index = [NSString stringWithFormat:@"%d", i*20];
        const char* number = [index UTF8String];
        CGContextShowTextAtPoint(context, xPlusDigitGap, (self.bounds.size.height-20), number, index.length);
        xPlusDigitGap = xPlusDigitGap + scoreGap;
    }//*/
    
    // creating score digits in Y axis (|)
    CGFloat yPlusDigitGap = (self.bounds.size.height) - graphMarginBottom;
    for (int i = 0; i <= 5; i++) {
        NSString* index = [NSString stringWithFormat:@"%d", i*20];
        const char* number = [index UTF8String];
        CGContextShowTextAtPoint(context, 5, yPlusDigitGap, number, index.length);
        yPlusDigitGap = yPlusDigitGap - 50;
    }
    // END drawing the axis numbers
    
    CGContextStrokePath(context);
    // END drawing graph
}

- (void) drawLines {
    CGContextRef contextForPath = UIGraphicsGetCurrentContext();
    [[UIColor redColor] set]; // R13: adding the redColor
    CGContextBeginPath(contextForPath);
    
    // Drawing the paths according to the user defined points
    // only go through the point array if we have any points to draw
    if ([self.scoreList count] > 0) {
        CGFloat scoreGap = (self.bounds.size.width - graphMarginLeft-20) / [self.scoreList count];
        
        // creating the initial starting point of any given graph (a set of points)
        CGFloat lastXPoint = scoreGap+(graphMarginBottom);
        CGFloat lastYPoint = self.bounds.size.height-graphMarginBottom;
        //NSLog(@"x: %@", lastXPoint);
        
        for (int i = 0; i < [self.scoreList count]; i++) { //sizeof(self.array)-1
            CGFloat score = [[self.scoreList objectAtIndex:i] floatValue];
            NSLog(@"%g", score);
            
            CGContextMoveToPoint(contextForPath, lastXPoint, (self.bounds.size.height-graphMarginBottom));
            CGContextAddLineToPoint(contextForPath, lastXPoint, (self.bounds.size.height-((score / 20) * yAxisGapSize)-graphMarginBottom));
            
            lastXPoint = ((i+2) * scoreGap)+(graphMarginBottom);
            lastYPoint = (self.bounds.size.height-((score / 20) * yAxisGapSize)-graphMarginBottom);
        }
    }
    
    CGContextStrokePath(contextForPath);
}

@end
