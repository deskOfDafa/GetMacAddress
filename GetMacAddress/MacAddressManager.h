//
//  MacAddressManager.h
//  GetMacAddress
//
//  Created by jack ma on 2017/12/14.
//  Copyright © 2017年 jack ma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MacAddressManager : NSObject

+ (nullable NSString *)getMacAddressFromMDNS;

@end






#import <net/if_dl.h>

#define DUMMY_MAC_ADDR @"02:00:00:00:00:00"
@interface Address : NSObject

+ (nonnull NSString *)currentIPAddressOf: (nonnull NSString *)device;
+ (nullable NSString *)IPv4Ntop: (in_addr_t)addr;
+ (in_addr_t)IPv4Pton: (nonnull NSString *)IPAddr;


@end

