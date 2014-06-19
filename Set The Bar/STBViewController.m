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
    self.collectionView.layer.borderColor = UIColor.redColor.CGColor;
    self.collectionView.layer.borderWidth = 1.0;
    NSLog(self.collectionView.debugDescription);
    
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
    
    // calculate the scale relationship between grade percentage and collectionViewHeight
    CGFloat collectionViewHeight = self.collectionView.bounds.size.height;
    CGFloat scaleFactor = collectionViewHeight * [grade.weight floatValue];
    
    // scale the translation's y value by that scaleFactor to get ∆score
    CGFloat deltaInScore = translation.y / scaleFactor;
    CGFloat newGradeValue = ([grade.percentage floatValue] + deltaInScore);
    
    if (newGradeValue > 1.0) {
        newGradeValue = 1.0;
    } else if (newGradeValue < 0.0) {
        newGradeValue = 0.0;
    }
    grade.percentage = [NSNumber numberWithFloat:newGradeValue];
    [sender setTranslation:CGPointZero inView:self.collectionView];
    [[self collectionView] reloadData];
}


@end
