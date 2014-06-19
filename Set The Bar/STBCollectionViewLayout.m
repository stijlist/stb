//
//  STBCollectionViewLayout.m
//  Set The Bar
//
//  Created by Bert Muthalaly on 6/17/14.
//  Copyright (c) 2014 Bert Muthalaly. All rights reserved.
//

#import "STBCollectionViewLayout.h"
#import "STBViewController.h"
#import "STBDataSource.h"

@implementation STBCollectionViewLayout
- (CGSize)collectionViewContentSize
{
    // Don't scroll horizontally
    CGFloat contentWidth = self.collectionView.bounds.size.width;
    
    // Don't scroll vertically
    CGFloat contentHeight = self.collectionView.bounds.size.height;
    
    CGSize contentSize = CGSizeMake(contentWidth, contentHeight);
    return contentSize;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *layoutAttributes = [[NSMutableArray alloc] init];
    NSArray *visibleIndexPaths = [self indexPathsOfItemsInRect:rect];
    for (NSIndexPath *indexPath in visibleIndexPaths) {
        UICollectionViewLayoutAttributes *attributes =
        [self layoutAttributesForItemAtIndexPath:indexPath];
        [layoutAttributes addObject:attributes];
    }
    
    return [layoutAttributes copy];
}

- (UICollectionViewLayoutAttributes *) layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
//    NSLog(@"CollectionView sizes:");
//    NSLog(@"Frame size: height is %f and width is %f.", self.collectionView.frame.size.height, self.collectionView.frame.size.width);
//    NSLog(@"Bounds size: height is %f and width is %f.", self.collectionView.bounds.size.height, self.collectionView.bounds.size.width);
    STBDataSource *dataSource = self.collectionView.dataSource;
    attributes.size = [dataSource sizeForGradeAtIndexPath:indexPath givenViewSize: self.collectionView.frame.size];
    CGPoint cvorigin = self.collectionView.frame.origin;
    attributes.frame = CGRectMake(cvorigin.x, cvorigin.y, attributes.size.width, attributes.size.height);
    return attributes;
}

- (NSArray *)indexPathsOfItemsInRect:(CGRect)rect {
    STBDataSource *dataSource = self.collectionView.dataSource;
    return [dataSource allIndexPaths];
}
@end
