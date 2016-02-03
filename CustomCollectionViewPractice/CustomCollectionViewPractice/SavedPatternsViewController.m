//
//  ViewController.m
//  CustomCollectionViewPractice
//
//  Created by Ethan Hess on 5/16/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "SavedPatternsViewController.h"

@interface SavedPatternsViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation SavedPatternsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];

    flowLayout.sectionInset = UIEdgeInsetsMake(2, 2, 2, 2);

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    NSArray *subviews = [cell.contentView subviews];
    
    for (UIView *view in subviews) {
        
        [view removeFromSuperview];
    }
    
    Snapshot *snapshot = [SnapshotController sharedInstance].snapshots[indexPath.row];
    
    UIImage *image = [UIImage imageWithData:snapshot.image];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:cell.bounds];
    imageView.image = image;
    
    [cell addSubview:imageView];
    
    return cell;
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [SnapshotController sharedInstance].snapshots.count;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    Snapshot *snapshot = [[SnapshotController sharedInstance].snapshots objectAtIndex:indexPath.item];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Options" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Delete" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
    
        [[SnapshotController sharedInstance]removeSnapshot:snapshot];
        
        [self.collectionView reloadData];
        
    }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Save to photo album" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self saveToPhotoAlbum:snapshot];
        
    }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }]];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
    
}

- (void)saveToPhotoAlbum:(Snapshot *)snapshot {
    
    NSData *data = snapshot.image;
    UIImage *image = [UIImage imageWithData:data];
    
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    }
    
    else {
    NSLog(@"Saved!");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
