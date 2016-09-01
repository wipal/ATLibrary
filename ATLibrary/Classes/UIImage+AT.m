//
//  UIImage+AT.m
//  LingoVN
//
//  Created by Âu Ngọc Thái on 3/31/16.
//  Copyright © 2016 NGUYEN CHI CONG. All rights reserved.
//

#import "UIImage+AT.h"

@implementation UIImage (AT)
- (UIImage *)setImageWithSize:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
@end
