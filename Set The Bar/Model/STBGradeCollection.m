//
//  STBGradeCollection.m
//  Set The Bar
//
//  Created by Bert Muthalaly on 7/12/13.
//  Copyright (c) 2013 Bert Muthalaly. All rights reserved.
//

#import "STBGradeCollection.h"
#import "STBGrade.h"
// private properties
@interface STBGradeCollection ()
@property NSMutableArray *grades;
@end

@implementation STBGradeCollection
- (NSNumber *) calculateAverage
{
    float total = 0;
    float totalPossible = 0;
    for (STBGrade *grade in self.grades) {
        total += ((float)grade.gradeEarned * grade.weight);
        totalPossible += ((float)grade.gradeMax * grade.weight);
    }
    return [NSNumber numberWithFloat: (float)total / totalPossible];
}
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
- (void) addGrade:(STBGrade *)gradeToAdd
{
    [self.grades addObject:gradeToAdd];
}
@end
