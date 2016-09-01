//
//  ATDeviceUtil.m
//  LingoVN
//
//  Created by Âu Ngọc Thái on 4/3/16.
//  Copyright © 2016 NGUYEN CHI CONG. All rights reserved.
//

#import "ATDeviceUtil.h"

#import <sys/types.h>
#import <sys/socket.h>
#import <sys/sysctl.h>
#import <sys/time.h>
#import <netinet/in.h>
#import <net/if_dl.h>
#import <netdb.h>
#import <errno.h>
#import <arpa/inet.h>
#import <unistd.h>
#import <ifaddrs.h>
#import <mach/mach.h>
#import <mach/mach_host.h>

#if !defined(IFT_ETHER)
#define IFT_ETHER 0x6   /* Ethernet CSMACD */
#endif

#define CASE(str)                       if ([__s__ isEqualToString:(str)])
#define SWITCH(s)                       for (NSString *__s__ = (s); ; )
#define DEFAULT

@implementation ATDeviceUtil

#pragma mark -
#pragma mark network-related functions

+ (BOOL)checkConnection:(SCNetworkReachabilityFlags *)flags {
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, flags);
    CFRelease(defaultRouteReachability);
    
    if (!didRetrieveFlags)
        return NO;
    return YES;
}

+ (BOOL)connectedToNetwork {
    SCNetworkReachabilityFlags flags;
    if (![ATDeviceUtil checkConnection:&flags])
        return NO;
    
    BOOL isReachable = flags & kSCNetworkReachabilityFlagsReachable;
    BOOL needsConnection = flags & kSCNetworkReachabilityFlagsConnectionRequired;
    
    return (isReachable && !needsConnection) ? YES : NO;
}

+ (BOOL)connectedToWiFi {
    SCNetworkReachabilityFlags flags;
    if (![ATDeviceUtil checkConnection:&flags])
        return NO;
    
    BOOL isReachable = flags & kSCNetworkReachabilityFlagsReachable;
    BOOL needsConnection = flags & kSCNetworkReachabilityFlagsConnectionRequired;
    BOOL cellConnected = flags & kSCNetworkReachabilityFlagsTransientConnection;
    
    return (isReachable && !needsConnection && !cellConnected) ? YES : NO;
}

#pragma mark -
#pragma mark get device's attributes/information

// is now deprecated
+ (NSString*)UDID
{
	return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
}

//referenced: http://www.iphonedevsdk.com/forum/iphone-sdk-development/4970-iphone-mac-address.html
+ (NSString *)MACAddress {
    NSMutableString *result = [NSMutableString string];
    
    BOOL success;
    struct ifaddrs *addrs;
    const struct ifaddrs *cursor;
    const struct sockaddr_dl *dlAddr;
    const uint8_t *base;
    int i;
    
    success = (getifaddrs(&addrs) == 0);
    if (success) {
        cursor = addrs;
        while (cursor != NULL) {
            if ((cursor->ifa_addr->sa_family == AF_LINK) && (((const struct sockaddr_dl *)cursor->ifa_addr)->sdl_type == IFT_ETHER)) {
                dlAddr = (const struct sockaddr_dl *)cursor->ifa_addr;
                
                base = (const uint8_t *)&dlAddr->sdl_data[dlAddr->sdl_nlen];
                
                for (i = 0; i < dlAddr->sdl_alen; i++) {
                    if (i != 0) {
                        [result appendString:@":"];
                    }
                    [result appendFormat:@"%02x", base[i]];
                }
            }
            cursor = cursor->ifa_next;
        }
        freeifaddrs(addrs);
    }
    
    //	DebugLog(@"mac address = %@", result);
    
    return result;
}

+ (NSString *)name {
    return [[UIDevice currentDevice] name];
}

+ (NSString *)model {
    return [[UIDevice currentDevice] model];
}

+ (NSString *)systemVersion {
    return [[UIDevice currentDevice] systemVersion];
}

+ (NSString *)systemName {
    return [[UIDevice currentDevice] systemName];
}

+ (NSString *)appVersion {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
}

+ (NSString *)appName {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
}

+ (NSString *)bundleIdentifier {
    return [[NSBundle mainBundle] bundleIdentifier];
}

//referenced: http://iphonedevelopertips.com/device/determine-if-iphone-is-3g-or-3gs-determine-if-ipod-is-first-or-second-generation.html
+ (NSString *)machine {
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    
    char *name = malloc(size);
    sysctlbyname("hw.machine", name, &size, NULL, 0);
    
    NSString *machine = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];
    free(name);
    
    return machine;
}

+ (NSString *)machineName {
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    
    char *name = malloc(size);
    sysctlbyname("hw.machine", name, &size, NULL, 0);
    
    NSString *machine = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];
    free(name);
    
    NSString *machineName;
    
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"DeviceName" ofType:@"plist"]];
    
    machineName = [dict valueForKey:machine];
    
    
    return machineName;
}

#pragma mark -
#pragma mark functions that check device features

//check: http://developer.apple.com/iphone/library/documentation/General/Reference/InfoPlistKeyReference/Articles/iPhoneOSKeys.html#//apple_ref/doc/uid/TP40009252-SW3

+ (BOOL)cameraSupported {
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}

+ (BOOL)compassSupported {
#ifdef __IPHONE_4_0
    return [CLLocationManager headingAvailable];
#else   //location.headingAvailable deprecated
    CLLocationManager *location = [[CLLocationManager alloc] init];
    BOOL supported = location.headingAvailable;
    [location release];
    return supported;
#endif
}

+ (void)printFreeMemory {
    mach_port_t host_port;
    mach_msg_type_number_t host_size;
    vm_size_t pagesize;
    
    host_port = mach_host_self();
    host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    host_page_size(host_port, &pagesize);
    
    vm_statistics_data_t vm_stat;
    
    if (host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size) != KERN_SUCCESS) {
        NSLog(@"Failed to fetch vm statistics");
    }
    
    /* Stats in bytes */
    natural_t mem_used = (vm_stat.active_count +
                          vm_stat.inactive_count +
                          vm_stat.wire_count) * (int)pagesize;
    natural_t mem_free = vm_stat.free_count * (int)pagesize;
    natural_t mem_total = mem_used + mem_free;
    NSLog(@"used: %u free: %u total: %u", mem_used, mem_free, mem_total);
    
    NSLog(@"TOTAL RAM: %llu",[NSProcessInfo processInfo].physicalMemory);
}

+ (uint64_t)getFreeDiskspace {
    uint64_t totalSpace = 0;
    uint64_t totalFreeSpace = 0;
    NSError *error = nil;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSDictionary *dictionary = [[NSFileManager defaultManager] attributesOfFileSystemForPath:[paths lastObject] error:&error];
    
    if (dictionary) {
        NSNumber *fileSystemSizeInBytes = [dictionary objectForKey:NSFileSystemSize];
        NSNumber *freeFileSystemSizeInBytes = [dictionary objectForKey:NSFileSystemFreeSize];
        totalSpace = [fileSystemSizeInBytes unsignedLongLongValue];
        totalFreeSpace = [freeFileSystemSizeInBytes unsignedLongLongValue];
        NSLog(@"Memory Capacity of %llu MiB with %llu MiB Free memory available.", ((totalSpace / 1024ll) / 1024ll), ((totalFreeSpace / 1024ll) / 1024ll));
    }
    else {
        NSLog(@"Error Obtaining System Memory Info: Domain = %@, Code = %ld", [error domain], (long)[error code]);
    }
    
    return totalFreeSpace;
}

@end
