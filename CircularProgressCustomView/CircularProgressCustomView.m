//
//  CircularProgressCustomView.m
//  CircularProgressCustomView
//
//  Created by Anant Kannaik on 20/06/18.
//  Copyright © 2018 Anant Kannaik. All rights reserved.
//

#import "CircularProgressCustomView.h"

@interface CircularProgressCustomView ()

@end

@implementation CircularProgressCustomView {
    CGFloat startAngle;
    CGFloat endAngle;
}

- (id)initWithCoder:(NSCoder*)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        
        self.percent = 100.0;
        
        // Determine our start and stop angles for the arc (in radians)
        startAngle = M_PI * 1.5;
        endAngle = startAngle + (M_PI * 2);
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    // Display our percentage as a string
    NSString *textContent = [NSString stringWithFormat:@"%d", self.percent];
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    
    // Create our arc, with the correct angles
    [bezierPath addArcWithCenter:CGPointMake(rect.size.width / 2, rect.size.height / 2) radius:25 startAngle:startAngle endAngle:(endAngle - startAngle) * (_percent / 100.0) + startAngle clockwise:YES];
    
    // Set the display for the path, and stroke it
    bezierPath.lineWidth = 3;
    [[UIColor redColor] setStroke];
    [bezierPath stroke];
    
    // Text Drawing
    UIFont *font = [UIFont fontWithName: @"Helvetica-Bold" size: 20.0];
    CGSize size = [textContent sizeWithAttributes:@{NSFontAttributeName:font}];
    CGRect textRect = CGRectMake(rect.origin.x, rect.origin.y + (rect.size.height - size.height)/2, rect.size.width, rect.size.height);
    [[UIColor blackColor] setFill];
    NSMutableParagraphStyle *paragraphStyle = NSMutableParagraphStyle.new;
    paragraphStyle.alignment                = NSTextAlignmentCenter;
    paragraphStyle.lineBreakMode            = NSLineBreakByWordWrapping;
    [textContent drawInRect:textRect withAttributes:@{NSParagraphStyleAttributeName:paragraphStyle, NSFontAttributeName:font}];
}

@end
