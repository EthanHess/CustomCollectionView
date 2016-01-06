//
//  Snapshot+CoreDataProperties.h
//  CustomCollectionViewPractice
//
//  Created by Ethan Hess on 11/16/15.
//  Copyright © 2015 Ethan Hess. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Snapshot.h"

NS_ASSUME_NONNULL_BEGIN

@interface Snapshot (CoreDataProperties)

@property (nullable, nonatomic, retain) NSData *image;

@end

NS_ASSUME_NONNULL_END
