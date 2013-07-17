//
//  STBGradeCollection.h
//  Set The Bar
//
//  Created by Bert Muthalaly on 7/12/13.
//  Copyright (c) 2013 Bert Muthalaly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STBGrade.h"

@interface STBGradeCollection : NSObject
- (NSNumber *) calculateAverage;
- (NSNumber *) calculatePercentCompleted;
- (void) addGrade:(STBGrade *)gradeToAdd;
@end
