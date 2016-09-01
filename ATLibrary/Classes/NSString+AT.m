//
//  NSString+AT.m
//  EduSoft
//
//  Created by Âu Ngọc Thái on 3/11/16.
//  Copyright © 2016 [iF] Solution. All rights reserved.
//

#import "NSString+AT.h"

@implementation NSString (AT)

-(BOOL)isNullOrEmptyString{
    
    if (!self || [self length] < 1 || [self isEqual:nil] || self == nil || self == (id)[NSNull null]|| [self isEqual:NULL] || [self isEqual:@"nil"]) {
        return true;
    }
    return false;
}

-(BOOL)isValidPhoneNumberFromString{
    //    self.text ;
    
//    NSString *phoneReg = @"^((?:(?!\n)\\s*)?([(](\\+?(?=.*[1-9])\\d{2,4})[)]|(\\+?(?=.*[1-9])\\d{2,4}))[\\s|\\-|\\.]?\\d{2,3}[\\s|\\-|\\.]?\\d{3}[\\s|\\-|\\.]?\\d{3}(?:(?!\n)\\s*)?)?$";
    
    NSString *phoneReguler = @"^(0)(1\\d{9}|9\\d{8}|8\\d{8})$";
    //    ^((\\+)|(00))[0-9]{6,14}$
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneReguler];
    
    if ([self length] < 1) {
        return NO;
    }else {
        return [predicate evaluateWithObject:self];
    }
}

-(BOOL)isValidEmailFromString{
    BOOL stricterFilter = NO; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    if ([self length] < 1) {
        return NO;
    }else {
        return [emailTest evaluateWithObject:self];
    }
}

@end
