//
//  STBDataSource.m
//  Set The Bar
//
//  Created by Bert Muthalaly on 6/17/14.
//  Copyright (c) 2014 Bert Muthalaly. All rights reserved.
//

#import "STBDataSource.h"
#import "STBGrade.h"

@interface STBDataSource ()
@property NSMutableArray *grades;
@end

@implementation STBDataSource
- (id) init {
    if (self = [super init]) {
        _grades = [[NSMutableArray alloc] init];
        STBGrade *firstGrade = [[STBGrade alloc] init];
        STBGrade *secondGrade = [[STBGrade alloc] init];
        [_grades addObject:firstGrade];
        [_grades addObject:secondGrade];
        
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView*)collectionView numberOfItemsInSection:(NSInteger)section {

    return [self.grades count];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    STBGrade *grade = [self.grades objectAtIndex:indexPath.row];
    NSLog(@"Grade: %@", grade);
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GradeBar" forIndexPath:indexPath];
    return cell;
}

- (STBGrade *) gradeAtIndexPath:(NSIndexPath *)indexPath {
    return self.grades[indexPath.row];
}

- (CGSize) sizeForGradeAtIndexPath:(NSIndexPath *)indexPath givenViewSize:(CGSize)viewSize
{
    STBGrade *grade = self.grades[indexPath.row];
    // TODO: WHAT THE F$%# THIS API IS SUPPOSED TO BE IN POINTS NOT PIXELS
    // I SHOULD NOT HAVE TO MULTIPLY BY 2
    CGFloat gradeHeight = 2 *([grade.percentage floatValue] * [grade.weight floatValue]) * viewSize.height;
    NSLog(@"Grade width is %f and grade height is %f", viewSize.width, gradeHeight);
    return CGSizeMake(2 * viewSize.width, gradeHeight);
}

- (NSArray *) allIndexPaths {
    NSMutableArray *indexPaths = [NSMutableArray array];
    [self.grades enumerateObjectsUsingBlock:^(id grade, NSUInteger idx, BOOL *stop) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:idx inSection:0];
        [indexPaths addObject:indexPath];
    }];
    return indexPaths;
}
@end
