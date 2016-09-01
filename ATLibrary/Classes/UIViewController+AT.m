//
//  UIViewController+AT.m
//  EduMobile
//
//  Created by Thái on 5/12/16.
//  Copyright © 2016 Âu Ngọc Thái. All rights reserved.
//

#import "UIViewController+AT.h"

@implementation UIViewController (AT)
+ (instancetype) instantiateViewControllerFromStoryboard: (NSString *)storyboardFile withIdentifier: (NSString *)identifier{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardFile bundle:nil];
    return [storyboard instantiateViewControllerWithIdentifier:identifier];
}

+ (instancetype) instantiateViewControllerFromMainStoryboardWithIdentifier: (NSString *)identifier{
    return [[self class] instantiateViewControllerFromStoryboard:@"Main" withIdentifier:identifier];
}

+ (instancetype) instantiateViewControllerFromMainStoryboard{
    return [[self class] instantiateViewControllerFromMainStoryboardWithIdentifier:NSStringFromClass([self class])];
}

+ (instancetype) instantiateViewControllerFromStoryboard:(NSString *)storyboardFile{
    return [[self class] instantiateViewControllerFromStoryboard:storyboardFile withIdentifier:NSStringFromClass([self class])];
}
@end
