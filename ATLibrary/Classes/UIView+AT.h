//
//  UIView+AT.h
//  ATPasswordManager
//
//  Created by Âu Ngọc Thái on 1/13/16.
//  Copyright © 2016 Âu Ngọc Thái. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (AT)


/*Border corner radius*/
- (void) setCornerRadius:(float)cornerRadius;

/*Border with width and corner radius*/
- (void) setCornerRadius:(float)cornerRadius
                andWidth:(float)borderWidth;

/*Border with width and corner radius and color*/
- (void) setCornerRadius:(float)cornerRadius
                andWidth:(float)borderWidth
                andColor:(UIColor *)color;

/*Set height*/
- (void) setHeight: (CGFloat) height;

/*Set width*/
- (void) setWidth: (CGFloat) width;
@end
