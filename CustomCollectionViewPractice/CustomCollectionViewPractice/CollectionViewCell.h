//
//  CollectionViewCell.h
//  CustomCollectionViewPractice
//
//  Created by Ethan Hess on 5/16/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIView *circleView;
@property (nonatomic, assign) CGFloat circleSize;
@property (nonatomic, strong) UIColor *circleColor;

@end
