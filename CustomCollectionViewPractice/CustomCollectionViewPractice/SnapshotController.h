//
//  SnapshotController.h
//  CustomCollectionViewPractice
//
//  Created by Ethan Hess on 11/16/15.
//  Copyright © 2015 Ethan Hess. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Snapshot.h"
#import "Stack.h"
#import <UIKit/UIKit.h>

@interface SnapshotController : NSObject

@property (nonatomic, strong) NSArray *snapshots;

+ (SnapshotController *)sharedInstance;

- (void)addSnapshotWithImage:(UIImage *)image;

- (void)removeSnapshot:(Snapshot *)snapshot;

@end
