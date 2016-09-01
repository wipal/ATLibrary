//
//  UITextField+AT.h
//  LingoVN
//
//  Created by Âu Ngọc Thái on 3/30/16.
//  Copyright © 2016 NGUYEN CHI CONG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (AT)
/*
Left
    CGRectMake(0, 0, 25, 15)
    CGRectMake(8, 0, 15, 15)
Right
    CGRectMake(0, 0, 30, 15)
    CGRectMake(8, 0, 15, 15)
 */
-(void)setIconLeftWithImage:(UIImage *)image
                  imageSize:(CGRect)size
                   viewSize:(CGRect)viewSize;
-(void)setIconRightWithImage:(UIImage *)image
                   imageSize:(CGRect)size
                    viewSize:(CGRect)viewSize;
- (BOOL)isValidPhoneNumber;
@end
