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
//    [self performSelectorInBackground:@selector(mutateFirstGrade) withObject:nil];
}
- (void)mutateFirstGrade {
    // setup
    STBDataSource *dataSource = self.collectionView.dataSource;
    STBGrade *grade = [dataSource gradeAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    
    // sleep
    [NSThread sleepForTimeInterval:1.0f];

    // set grade value, reload data
    grade.percentage = @1.5;
    [[self collectionView] reloadData];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)handlePan:(UIPanGestureRecognizer *)sender {
    
    CGPoint translation = [sender translationInView:self.collectionView];
    
    // give me the grade at the initialPoint
    CGPoint initialPoint = [sender locationInView:self.collectionView];
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:initialPoint];
    STBDataSource *dataSource = self.collectionView.dataSource;
    STBGrade *grade = [dataSource gradeAtIndexPath:indexPath];
    //        ^^^ GRADE AT INITIAL POINT
    NSLog(@"Translation in pixels: %f", translation.x);
    CGFloat collectionViewHeight = self.collectionView.bounds.size.height;
    CGFloat scaleFactor = collectionViewHeight * [grade.weight floatValue];
    
    CGFloat deltaInScore = translation.x / scaleFactor;
    NSNumber *newPercentage = [NSNumber numberWithFloat:([grade.percentage floatValue] + deltaInScore)];
    grade.percentage = newPercentage;
    NSLog(@"New grade value: %@", grade);
    [[self collectionView] reloadData];
}


@end
