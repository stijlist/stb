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
        STBGrade *secondGrade = [[STBGrade alloc] init];
        [_grades addObject:secondGrade];
        
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView*)collectionView numberOfItemsInSection:(NSInteger)section {

    return [self.grades count];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    STBGradeBar *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GradeBar" forIndexPath:indexPath];
    
    cell.gradeLabel.text = [NSString stringWithFormat:@"%d", (NSInteger)round([[self gradeAtIndexPath:indexPath].percentage floatValue] * 100)];
    cell.layer.borderColor = UIColor.blueColor.CGColor;
    cell.layer.borderWidth = 1.0;

    
    return cell;
}

- (STBGrade *) gradeAtIndexPath:(NSIndexPath *)indexPath {
    return self.grades[indexPath.row];
}

- (CGSize) sizeForGradeAtIndexPath:(NSIndexPath *)indexPath givenViewSize:(CGSize)viewSize
{
    STBGrade *grade = self.grades[indexPath.row];
    CGFloat gradeHeight = ([grade.percentage floatValue] * [grade.weight floatValue]) * viewSize.height;
    return CGSizeMake(viewSize.width, gradeHeight);
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
