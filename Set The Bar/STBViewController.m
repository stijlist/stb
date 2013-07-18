//
//  STBViewController.m
//  Set The Bar
//
//  Created by Bert Muthalaly on 7/5/13.
//  Copyright (c) 2013 Bert Muthalaly. All rights reserved.
//

#import "STBViewController.h"
#import "STBGradeBarView.h"
#import "STBGradeCollection.h"

@interface STBViewController ()
@property (nonatomic) STBGradeCollection *grades;
@property (weak, nonatomic) IBOutlet UILabel *gradeLabel;
@end

@implementation STBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Just experimenting
    [self.grades addGrade: [[STBGrade alloc] init]];
    // I think what I may want here is a UICollectionView
    
}
- (STBGradeCollection *)grades
{
    if (!_grades) {
        _grades = [[STBGradeCollection alloc] init];
    }
    return _grades;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)changeGrade:(UISlider *)sender {
    self.gradeLabel.text = [[NSNumber numberWithFloat:(sender.value * 100)] stringValue];
}


@end
