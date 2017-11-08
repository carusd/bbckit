//
//  UIDevice+BBCHardware.m
//  BBCKitDemo
//
//  Created by Liki on 16/9/8.
//  Copyright © 2016年 duowan. All rights reserved.
//

#include <sys/socket.h> // Per msqr
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>


#import "UIDevice+BBCHardware.h"

@implementation UIDevice (BBCHardware)

- (NSUInteger)bbc_getSysInfo:(uint)typeSpecifier {
    size_t size = sizeof(int);
    int results;
    int mib[2] = {CTL_HW, typeSpecifier};
    sysctl(mib, 2, &results, &size, NULL, 0);
    return (NSUInteger) results;
}



- (NSNumber *)bbc_totalDiskSpace {
    NSDictionary *fattributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    return [fattributes objectForKey:NSFileSystemSize];
}

- (NSNumber *)bbc_availablyDiskSpace {
    NSDictionary *fattributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    return [fattributes objectForKey:NSFileSystemFreeSize];
}

- (NSUInteger)bbc_cpuCount {
    return [self bbc_getSysInfo:HW_NCPU];
}

- (NSUInteger)bbc_totalMemory {
    return [self bbc_getSysInfo:HW_PHYSMEM];
}

- (NSUInteger)bbc_usedMemory {
    return [self bbc_getSysInfo:HW_USERMEM];
}

@end
