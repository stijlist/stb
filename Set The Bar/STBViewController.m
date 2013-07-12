//
//  STBViewController.m
//  Set The Bar
//
//  Created by Bert Muthalaly on 7/5/13.
//  Copyright (c) 2013 Bert Muthalaly. All rights reserved.
//

#import "STBViewController.h"

@interface STBViewController ()

@end

@implementation STBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    CGRect barRect = CGRectMake(20, 20, 50, 30);
    UILabel *gradeLabel = [[UILabel alloc] initWithFrame:barRect];
    gradeLabel.text = @"89";
    [self.view addSubview:gradeLabel]; // we’ll talk about self.view later
    // (it is a Controller’s top-level view)
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
