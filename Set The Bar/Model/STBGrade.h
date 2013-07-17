//
//  STBGrade.h
//  Set The Bar
//
//  Created by Bert Muthalaly on 7/12/13.
//  Copyright (c) 2013 Bert Muthalaly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STBGrade : NSObject
@property NSUInteger gradeEarned;
@property NSUInteger gradeMax;
@property float weight;
@property BOOL completed;
@property NSDate *dateOfGrade;
@end
