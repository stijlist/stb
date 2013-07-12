//
//  STBGradeCollection.h
//  Set The Bar
//
//  Created by Bert Muthalaly on 7/12/13.
//  Copyright (c) 2013 Bert Muthalaly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STBGradeCollection : NSObject
@property NSArray *grades;
- (NSUInteger) calculateAverage;
- (NSNumber *) calculatePercentCompleted;
@end
