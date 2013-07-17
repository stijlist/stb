//
//  STBGradeBarView.h
//  Set The Bar
//
//  Created by Bert Muthalaly on 7/8/13.
//  Copyright (c) 2013 Bert Muthalaly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STBGradeBarView : UIView
// - (void)drag:(UIPanGestureRecognizer *)gesture;
- (void)drawGradeLabel:(NSString *)grade;
@property CGFloat verticalScaleFactor;
@property UILabel *gradeLabel;
@end
