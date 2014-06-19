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

@interface STBCollectionViewLayout ()
@property NSMutableArray *currentCalculatedLayoutAttributes;
@end

@implementation STBCollectionViewLayout
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

- (CGSize)collectionViewContentSize {
    // Don't scroll horizontally
    CGFloat contentWidth = self.collectionView.bounds.size.width;
    
    // Don't scroll vertically
    CGFloat contentHeight = self.collectionView.bounds.size.height;
    
    CGSize contentSize = CGSizeMake(contentWidth, contentHeight);
    return contentSize;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    // each element's layout attributes depend on the layoutAttributes for
    // the item at the indexpath before it
    // hopefully i'll come up with a more elegant method for this than just
    // having a bag of local state to store these in
    if(self.currentCalculatedLayoutAttributes == nil) {
        _currentCalculatedLayoutAttributes = [[NSMutableArray alloc] init];
        [_currentCalculatedLayoutAttributes addObject:[[NSObject alloc] init]];
    }
    
    NSMutableArray *layoutAttributes = [[NSMutableArray alloc] init];
    NSArray *visibleIndexPaths = [self indexPathsOfItemsInRect:rect];
    
    for (NSIndexPath *indexPath in visibleIndexPaths) {
        UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:indexPath];
        [layoutAttributes addObject:attributes];
        [self.currentCalculatedLayoutAttributes addObject:attributes]; // store for future layoutAttributesForItemAtIndexPath calls
        
    }
    return [layoutAttributes copy];
}

- (UICollectionViewLayoutAttributes *) layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    STBDataSource *dataSource = self.collectionView.dataSource;
    attributes.size = [dataSource sizeForGradeAtIndexPath:indexPath givenViewSize: self.collectionView.frame.size];
    
    // to set the origin properly, we need to check the state of the grade at the indexPaths lower than this one
    // assumption: we'll lay out the items bottom to top in the same order as their indexPaths
    CGPoint cvorigin = self.collectionView.frame.origin;
    CGSize cvsize = self.collectionView.bounds.size;
    CGPoint desiredItemOrigin;
    
    if(indexPath.row == 0) {
        desiredItemOrigin = CGPointMake(cvorigin.x, cvorigin.y + cvsize.height - attributes.size.height);
    } else {
        NSIndexPath *indexPathOfItemBelow = [NSIndexPath indexPathForRow:(indexPath.row - 1) inSection:0];
        UICollectionViewLayoutAttributes *layoutAttributesForItemBelow = [self.currentCalculatedLayoutAttributes objectAtIndex:indexPathOfItemBelow.row];
        CGPoint originOfItemBelow = layoutAttributesForItemBelow.frame.origin;
        desiredItemOrigin = CGPointMake(cvorigin.x, originOfItemBelow.y - attributes.size.height) ;
    }
    
    attributes.frame = CGRectMake(desiredItemOrigin.x, desiredItemOrigin.y, attributes.size.width, attributes.size.height);
    
    // save current calculated layout attributes so that changes are visible to other cells
    [self.currentCalculatedLayoutAttributes replaceObjectAtIndex:indexPath.row withObject:attributes];
    
    return attributes;
}

- (NSArray *)indexPathsOfItemsInRect:(CGRect)rect {
    STBDataSource *dataSource = self.collectionView.dataSource;
    return [dataSource allIndexPaths];
}
@end
