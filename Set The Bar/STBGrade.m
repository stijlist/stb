//
//  STBGrade.m
//  Set The Bar
//
//  Created by Bert Muthalaly on 6/17/14.
//  Copyright (c) 2014 Bert Muthalaly. All rights reserved.
//

#import "STBGrade.h"

@implementation STBGrade

- (NSString *) description {
    return [NSString stringWithFormat:@"Percentage: %@, Weight: %@", _percentage, _weight];
}
@end
