//
//  STBGradeCollection.m
//  Set The Bar
//
//  Created by Bert Muthalaly on 7/12/13.
//  Copyright (c) 2013 Bert Muthalaly. All rights reserved.
//

#import "STBGradeCollection.h"
#import "STBGrade.h"

@implementation STBGradeCollection
- (NSNumber *) calculatePercentCompleted
{
    NSUInteger numberOfGradesCompleted = 0;
    for (STBGrade *grade in self.grades) {
        if (grade.completed) {
            numberOfGradesCompleted++;
        }
    }
    return [NSNumber numberWithFloat:((float)numberOfGradesCompleted / self.grades.count)];
}
@end
