//
//  STBDataSource.h
//  Set The Bar
//
//  Created by Bert Muthalaly on 6/17/14.
//  Copyright (c) 2014 Bert Muthalaly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STBGrade.h"

@interface STBDataSource : NSObject<UICollectionViewDataSource>
- (NSArray *) allIndexPaths;
- (CGSize) sizeForGradeAtIndexPath:(NSIndexPath *)indexPath givenViewSize:(CGSize)viewSize;

- (STBGrade *) gradeAtIndexPath:(NSIndexPath *)indexPath;
@end
