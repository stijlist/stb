//
//  STBGradeBarView.m
//  Set The Bar
//
//  Created by Bert Muthalaly on 7/8/13.
//  Copyright (c) 2013 Bert Muthalaly. All rights reserved.
//

#import "STBGradeBarView.h"

@implementation STBGradeBarView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawGradeLabel:(NSString *)grade
{
    UILabel *gradeLabel = [[UILabel alloc] initWithFrame:self.bounds];
    gradeLabel.text = grade;
    [self addSubview:gradeLabel];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    UIBezierPath *boundingRect = [UIBezierPath bezierPathWithRect:self.bounds];
    [[UIColor whiteColor] setFill];
    UIRectFill(self.bounds);
    [[UIColor blackColor] setStroke];
    [boundingRect stroke];
}


@end
