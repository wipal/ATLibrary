//
//  NSString+AES.m
//  EduMobile
//
//  Created by Thái on 8/23/16.
//  Copyright © 2016 Âu Ngọc Thái. All rights reserved.
//

#import "NSString+AES.h"

@implementation NSString (AES)

- (NSString *)AES128EncryptedDataWithKey:(NSString *)key{
    return [[[self dataUsingEncoding:NSUTF8StringEncoding] AES128EncryptedDataWithKey:key] base64EncodedStringWithOptions:0];
}

@end
