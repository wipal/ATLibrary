//
//  UITextField+AT.m
//  LingoVN
//
//  Created by Âu Ngọc Thái on 3/30/16.
//  Copyright © 2016 NGUYEN CHI CONG. All rights reserved.
//

#import "UITextField+AT.h"

@implementation UITextField (AT)

-(void)setIconRightWithImage:(UIImage *)image
                   imageSize:(CGRect)size
                    viewSize:(CGRect)viewSize{
    self.rightViewMode = UITextFieldViewModeAlways;
    UIView *rightView =[[UIView alloc] initWithFrame:viewSize];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:size];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = image;
    [rightView addSubview:imageView];
    self.rightView = rightView;
}

-(void)setIconLeftWithImage:(UIImage *)image
                  imageSize:(CGRect)size
                   viewSize:(CGRect)viewSize{
    self.leftViewMode = UITextFieldViewModeAlways;
    UIView *leftView =[[UIView alloc] initWithFrame:viewSize];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:size];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = image;
    [leftView addSubview:imageView];
    self.leftView = leftView;
}

-(BOOL)isValidPhoneNumber{
    //    self.text ;
    
    NSString *phoneReguler = @"^(0)(1\\d{9}|9\\d{8}|8\\d{8})$";
    //    ^((\\+)|(00))[0-9]{6,14}$
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneReguler];
    
    if ([self.text length] < 1) {
        return NO;
    }else if (![predicate evaluateWithObject:self.text]) {
        return NO;
    }
    
    return YES;
}

-(BOOL)isValidEmail{
    BOOL stricterFilter = NO; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

@end
