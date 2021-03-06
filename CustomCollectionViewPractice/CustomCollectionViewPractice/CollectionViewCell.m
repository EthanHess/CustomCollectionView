//
//  CollectionViewCell.m
//  CustomCollectionViewPractice
//
//  Created by Ethan Hess on 5/16/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "CollectionViewCell.h"

@interface CollectionViewCell ()

@property (nonatomic,assign) CGRect frame;

@end

@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    self.frame = frame;
    
    if (self) {
        
        self.circleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        self.circleView.layer.cornerRadius = self.frame.size.width / 2;
        [self addSubview:self.circleView];
    }
    
    return self;
    
}



@end
