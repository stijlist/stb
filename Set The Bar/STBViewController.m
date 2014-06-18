//
//  STBViewController.m
//  Set The Bar
//
//  Created by Bert Muthalaly on 7/5/13.
//  Copyright (c) 2013 Bert Muthalaly. All rights reserved.
//

#import "STBViewController.h"
#import "STBDataSource.h"

@interface STBViewController ()
@end

@implementation STBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)handlePan:(UIPanGestureRecognizer *)sender {
    
    CGPoint initialPoint = [sender locationInView:self.collectionView];
    CGPoint translation = [sender translationInView:self.collectionView];
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:initialPoint];
    
    STBDataSource *dataSource = self.collectionView.dataSource;
    STBGrade *grade = [dataSource gradeAtIndexPath:indexPath];
    CGFloat collectionViewHeight = self.collectionView.bounds.size.height;
    CGFloat maxGradeHeight = [grade.weight floatValue] * collectionViewHeight;
    CGFloat translationAsPercentageOfMaxHeight = translation.x / maxGradeHeight;
    NSNumber *newPercentage = [NSNumber numberWithFloat:([grade.percentage floatValue] - translationAsPercentageOfMaxHeight)];
    grade.percentage = newPercentage;
    NSLog(@"New grade value: %@", grade);
    [sender setTranslation:CGPointZero inView:self.collectionView];
    [[self collectionView] reloadData];
}


@end
