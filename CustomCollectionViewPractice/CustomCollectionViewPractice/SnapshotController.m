//
//  SnapshotController.m
//  CustomCollectionViewPractice
//
//  Created by Ethan Hess on 11/16/15.
//  Copyright © 2015 Ethan Hess. All rights reserved.
//

#import "SnapshotController.h"

@implementation SnapshotController

+ (SnapshotController *)sharedInstance {
    static SnapshotController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [SnapshotController new];
    });
    
    return sharedInstance;
    
}

- (NSArray *)snapshots {
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Snapshot"];
    
    NSArray *objects = [[Stack sharedInstance].managedObjectContext executeFetchRequest:fetchRequest error:NULL];
    
    return objects;
}

- (void)addSnapshotWithImage:(UIImage *)image {
    
    NSData *data = [NSData dataWithData:UIImageJPEGRepresentation(image, 100)];
    
    Snapshot *snapshot = [NSEntityDescription insertNewObjectForEntityForName:@"Snapshot" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    
    snapshot.image = data;
    
    [self synchronize];
}

- (void)removeSnapshot:(Snapshot *)snapshot {
    
    [snapshot.managedObjectContext deleteObject:snapshot];
    
    [self synchronize];
    
}

- (void)synchronize {
    
    [[Stack sharedInstance].managedObjectContext save:NULL];
}

@end
