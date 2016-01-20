//
//  PatternCollectionViewController.m
//  CustomCollectionViewPractice
//
//  Created by Ethan Hess on 5/16/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "PatternCollectionViewController.h"
#import "CollectionViewCell.h"
#import "SnapshotController.h"
#import "NSObject+Colors.h"

@interface PatternCollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@end

@implementation PatternCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = [UIColor randomBackgroundColor];
    [self.collectionView reloadData];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    
    self.swipeRecognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(screenSwiped:)];
    self.swipeRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
}

- (void)willAnimateFirstHalfOfRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    
    [super willAnimateFirstHalfOfRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
    self.collectionView.frame = self.view.bounds;
    
    [self.collectionView reloadData];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [self performSegueWithIdentifier:@"swipeSegue" sender:self];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.numberOfColumns * self.numberOfRows;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    int screenWidth = self.view.frame.size.width;
    
    if (screenWidth % self.numberOfColumns != 0) {
        
        self.circleSize = (self.view.frame.size.width - (screenWidth % self.numberOfColumns)) / self.numberOfColumns;
    }
    
    else {
        
        self.circleSize = self.view.frame.size.width / self.numberOfColumns;
    }
    
    CGSize circleSize = CGSizeMake(self.circleSize, self.circleSize);
    
    return circleSize;;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    return 0.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    return 0.0;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(0, 0, 0, 0);
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    if ([indexPath row] % self.colorArray.count == 0) {
//        cell.circleView.backgroundColor = [self colorWithHexString:self.colorArray[0] alpha:1.0];
         cell.circleView.backgroundColor = self.colorArray[0];
    }
    
    else if ([indexPath row] % self.colorArray.count == 1) {
//        cell.circleView.backgroundColor = [self colorWithHexString:self.colorArray[1] alpha:1.0];
        cell.circleView.backgroundColor = self.colorArray[1];
    }
    
    else if ([indexPath row] % self.colorArray.count == 2) {
//        cell.circleView.backgroundColor = [self colorWithHexString:self.colorArray[2] alpha:1.0];
        cell.circleView.backgroundColor = self.colorArray[2];
    }
    
    else if ([indexPath row] % self.colorArray.count == 3) {
//        cell.circleView.backgroundColor = [self colorWithHexString:self.colorArray[3] alpha:1.0];
        cell.circleView.backgroundColor = self.colorArray[3];
    }
    
    return cell;
}

- (UIColor *)colorWithHexString:(NSString *)hexColorString alpha:(CGFloat)alpha {
    
    unsigned colorValue = 0;
    
    NSScanner *valueScanner = [NSScanner scannerWithString:hexColorString];
    
    if ([hexColorString rangeOfString:@"#"].location != NSNotFound) [valueScanner setScanLocation:1];
    
    [valueScanner scanHexInt:&colorValue];
    
    return [UIColor colorWithRed:((colorValue & 0xFF00000) >> 16)/255.0 green:((colorValue & 0xFF00) >> 8)/ 255.0 blue:((colorValue & 0xFF) >> 0)/ 255.0 alpha:alpha];
    
}
- (IBAction)screenSwiped:(UISwipeGestureRecognizer *)sender {
    
//    sender = self.swipeRecognizer;
    
    if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
        
        [self performSegueWithIdentifier:@"swipeSegue" sender:sender];
    }
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self performSegueWithIdentifier:@"swipeSegue" sender:self];
}

//If screenshot mehthod ever added here is the code

//- (UIImage *)captureView:(UIView *)view {
//    
//    CGRect rect = [[UIScreen mainScreen]bounds];
//    UIGraphicsBeginImageContext(rect.size);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    [view.layer renderInContext:context];
//    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    
//    return img;
//    
//}

- (IBAction)captureView:(id)sender {
    
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    CGRect rect = [keyWindow bounds];
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [keyWindow.layer renderInContext:context];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [[SnapshotController sharedInstance]addSnapshotWithImage:image];
    
//    return image;

}



//- (void)saveScreenShot:(UIView *)view {
//    
//    UIImageWriteToSavedPhotosAlbum([self captureView:self.view], nil, nil, nil);
//    
//}


#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
