//
//  STBGrade.m
//  Set The Bar
//
//  Created by Bert Muthalaly on 6/17/14.
//  Copyright (c) 2014 Bert Muthalaly. All rights reserved.
//

#import "STBGrade.h"

@implementation STBGrade
- (id) init { // just a convenience for now; TODO: rip this out
    if (self = [super init]) {
        _weight = @0.5;
        _percentage = @1.0;
    }
    return self;
}
//- (id) initWithPercentage:(NSNumber *)percentage andWeight:(NSNumber *)weight {
//    if(self = [super init]) {
//        _weight = @1.0;
//        _percentage = @1.0;
//    }
//    return self;
//}
- (NSString *) description {
    return [NSString stringWithFormat:@"Percentage: %@, Weight: %@", _percentage, _weight];
}
@end
