//
//  STBDataSource.m
//  Set The Bar
//
//  Created by Bert Muthalaly on 6/17/14.
//  Copyright (c) 2014 Bert Muthalaly. All rights reserved.
//

#import "STBDataSource.h"
#import "STBGrade.h"
#import "STBGradeBar.h"

@interface STBDataSource ()
@property NSMutableArray *grades;
@end

@implementation STBDataSource
- (id) init {
    if (self = [super init]) {
        _grades = [[NSMutableArray alloc] init];
        STBGrade *firstGrade = [[STBGrade alloc] init];
        [_grades addObject:firstGrade];
        
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView*)collectionView numberOfItemsInSection:(NSInteger)section {

    return [self.grades count];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    STBGradeBar *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GradeBar" forIndexPath:indexPath];
    
    cell.gradeLabel.text = [NSString stringWithFormat:@"%d", (NSInteger)roundf([[self gradeAtIndexPath:indexPath].percentage floatValue] * 100)];
    NSLog(cell.gradeLabel.text);
    NSLog(cell.debugDescription);

    
    return cell;
}

- (STBGrade *) gradeAtIndexPath:(NSIndexPath *)indexPath {
    return self.grades[indexPath.row];
}

- (CGSize) sizeForGradeAtIndexPath:(NSIndexPath *)indexPath givenViewSize:(CGSize)viewSize
{
    STBGrade *grade = self.grades[indexPath.row];
    CGFloat gradeHeight = ([grade.percentage floatValue] * [grade.weight floatValue]) * viewSize.height;
//    NSLog(@"Grade width is %f and grade height is %f", viewSize.width, gradeHeight);
    // TODO: wtf? this api is supposed to be in points, not pixels
    // i should not have to multiply by 2
    return CGSizeMake(2 * viewSize.width, 2 * gradeHeight);
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
