//
//  NSString+AES.h
//  EduMobile
//
//  Created by Thái on 8/23/16.
//  Copyright © 2016 Âu Ngọc Thái. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSData+AES.h"

@interface NSString (AES)

- (NSString *)AES128EncryptedDataWithKey:(NSString *)key;

@end
