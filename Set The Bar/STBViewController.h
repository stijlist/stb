//
//  STBViewController.h
//  Set The Bar
//
//  Created by Bert Muthalaly on 7/5/13.
//  Copyright (c) 2013 Bert Muthalaly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STBViewController : UICollectionViewController<UICollectionViewDataSource>
@property (strong, nonatomic) IBOutlet UICollectionView *gradeBarCollectionView;

@end
