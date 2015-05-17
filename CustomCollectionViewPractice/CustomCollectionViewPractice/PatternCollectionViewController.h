//
//  PatternCollectionViewController.h
//  CustomCollectionViewPractice
//
//  Created by Ethan Hess on 5/16/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatternCollectionViewController : UICollectionViewController

@property int numberOfRows;
@property int numberOfColumns;
@property (nonatomic, strong) NSMutableArray *colorArray;
@property float circleSize;

@end
