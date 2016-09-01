//
//  UIViewController+AT.h
//  EduMobile
//
//  Created by Thái on 5/12/16.
//  Copyright © 2016 Âu Ngọc Thái. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (AT)

+ (instancetype) instantiateViewControllerFromStoryboard: (NSString *)storyboardFile withIdentifier: (NSString *)identifier;
+ (instancetype) instantiateViewControllerFromMainStoryboardWithIdentifier: (NSString *)identifier;
+ (instancetype) instantiateViewControllerFromStoryboard:(NSString *)storyboardFile;
+ (instancetype) instantiateViewControllerFromMainStoryboard; 

@end
