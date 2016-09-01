//
//  ATDeviceUtil.h
//  LingoVN
//
//  Created by Âu Ngọc Thái on 4/3/16.
//  Copyright © 2016 NGUYEN CHI CONG. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

//needs: SystemConfiguration.framework
#import <SystemConfiguration/SCNetworkReachability.h>

//needs: CoreLocation.framework
#import <CoreLocation/CoreLocation.h>

@interface ATDeviceUtil : NSObject

+ (BOOL)checkConnection:(SCNetworkReachabilityFlags*)flags;

+ (BOOL)connectedToNetwork;

+ (BOOL)connectedToWiFi;


// is now deprecated
+ (NSString*)UDID;

+ (NSString*)MACAddress;

+ (NSString*)name;

+ (NSString*)model;

+ (NSString*)systemVersion;

+ (NSString*)systemName;

+ (NSString*)appVersion;

+ (NSString*)appName;

+ (NSString*)bundleIdentifier;

/*
 * iPhone Simulator == i386
 * iPhone == iPhone1,1
 * 3G iPhone == iPhone1,2
 * 3GS iPhone == iPhone2,1
 * 4 iPhone == iPhone3,1
 * 1st Gen iPod == iPod1,1
 * 2nd Gen iPod == iPod2,1
 * 3rd Gen iPod == iPod3,1
 */
+ (NSString*)machine;

+ (NSString*)machineName;

+ (BOOL)cameraSupported;

+ (BOOL)compassSupported;

+ (void)printFreeMemory;

+ (uint64_t)getFreeDiskspace;

@end
