//
//  UIView+AT.m
//  ATPasswordManager
//
//  Created by Âu Ngọc Thái on 1/13/16.
//  Copyright © 2016 Âu Ngọc Thái. All rights reserved.
//

#import "UIView+AT.h"

@implementation UIView (AT)

- (void) setCornerRadius:(float)cornerRadius andWidth:(float)borderWidth andColor:(UIColor *)color{
    self.layer.masksToBounds =YES;
    self.layer.borderWidth=borderWidth;
    self.layer.borderColor=color.CGColor;
    self.layer.cornerRadius =cornerRadius;
}

- (void) setCornerRadius:(float)cornerRadius andWidth:(float)borderWidth{
    self.layer.masksToBounds =YES;
    self.layer.borderWidth=borderWidth;
    self.layer.cornerRadius =cornerRadius;
}

- (void) setCornerRadius:(float)cornerRadius{
    self.layer.masksToBounds =YES;
    self.layer.cornerRadius =cornerRadius;
}

- (void) setHeight: (CGFloat) height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void) setWidth: (CGFloat) width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void) setWidth: (CGFloat) width andSetHeight: (CGFloat) height {
    CGRect frame = self.frame;
    frame.size = CGSizeMake(width, height);
    self.frame = frame;
}

@end
