//
//  NSObject+Colors.m
//  CustomCollectionViewPractice
//
//  Created by Ethan Hess on 5/16/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "NSObject+Colors.h"

@implementation NSObject (Colors)

+ (UIColor *)randomBackgroundColor {
    
    return [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
}

+ (UIColor *)randomColorOne {
    
    return [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
}

+ (UIColor *)randomColorTwo {
    
    return [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
}

+ (UIColor *)randomColorThree {
    
    return [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
}

+ (UIColor *)randomColorFour {
    
    return [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
}

+ (UIColor *)randomColorFive {
    
    return [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
}

+ (UIColor *)randomColorSix {
    
    return [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
}

//Button colors

+ (UIColor *)randomButtonColorOne {
    
    return [UIColor colorWithRed:arc4random_uniform(10)/255.0 green:arc4random_uniform(100)/255.0 blue:arc4random_uniform(180)/255.0 alpha:1];
}

+ (UIColor *)randomButtonColorTwo {
    
    return [UIColor colorWithRed:arc4random_uniform(70)/255.0 green:arc4random_uniform(60)/255.0 blue:arc4random_uniform(200)/255.0 alpha:1];
}

+ (UIColor *)randomButtonColorThree {
    
    return [UIColor colorWithRed:arc4random_uniform(200)/255.0 green:arc4random_uniform(150)/255.0 blue:arc4random_uniform(40)/255.0 alpha:1];
}

+ (UIColor *)randomButtonColorFour {
    
    return [UIColor colorWithRed:arc4random_uniform(40)/255.0 green:arc4random_uniform(95)/255.0 blue:arc4random_uniform(155)/255.0 alpha:1];
}

+ (UIColor *)randomButtonColorFive {
    
    return [UIColor colorWithRed:arc4random_uniform(60)/255.0 green:arc4random_uniform(50)/255.0 blue:arc4random_uniform(190)/255.0 alpha:1];
}

+ (UIColor *)randomButtonColorSix {
    
    return [UIColor colorWithRed:arc4random_uniform(20)/255.0 green:arc4random_uniform(200)/255.0 blue:arc4random_uniform(80)/255.0 alpha:1];
}




@end
