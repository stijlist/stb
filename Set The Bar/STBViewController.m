//
//  STBViewController.m
//  Set The Bar
//
//  Created by Bert Muthalaly on 7/5/13.
//  Copyright (c) 2013 Bert Muthalaly. All rights reserved.
//

#import "STBViewController.h"
#import "STBGrade.h"
#import "STBGradeBar.h"

@interface STBViewController ()
@property NSMutableArray *grades;
@end

@implementation STBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    if(_grades == nil) {
        _grades = [[NSMutableArray alloc] init];
    }
    [self.grades addObject:[[STBGrade alloc] init]];
    [self.grades addObject:[[STBGrade alloc] init]];
    NSLog(@"Grades length: %lu", (unsigned long)[self.grades count]);
    [self.gradeBarCollectionView setDataSource:self];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

@end
