//
//  Reachability+NetWorkExtend.m
//  NetworkStatusDemo
//
//  Created by ghk on 2018/11/19.
//  Copyright © 2018年 ghk. All rights reserved.
//

#import "Reachability+NetWorkExtend.h"
#import <CoreTelephony/CTTelephonyNetworkInfo.h>

@implementation Reachability (NetWorkExtend)

+ (NetWorkType)currentNetworkType{

    Reachability *reachability   = [Reachability reachabilityWithHostName:@"www.apple.com"];
    NetworkStatus internetStatus = [reachability currentReachabilityStatus];

    NetWorkType net = NetWorkTypeNone;
    switch (internetStatus) {
        case ReachableViaWiFi: {
            net = NetWorkTypeWifi;
        }
            break;

        case ReachableViaWWAN: {
            net = NetWorkType4G;
            //            net = [self getNetType];   //判断具体类型
        }
            break;
        case NotReachable: {
            net = NetWorkTypeNone;
        }
        default:
            break;
    }
    return net;
}

+ (NSString *)getNetType
{
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    NSString *currentStatus = info.currentRadioAccessTechnology;
    NSString *netconnType;
    if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyGPRS"]) {
        netconnType = @"GPRS";
    }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyEdge"]) {
        netconnType = @"2.75G EDGE";
    }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyWCDMA"]){
        netconnType = @"3G";
    }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyHSDPA"]){
        netconnType = @"3.5G HSDPA";
    }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyHSUPA"]){
        netconnType = @"3.5G HSUPA";
    }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyCDMA1x"]){
        netconnType = @"2G";
    }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyCDMAEVDORev0"]){
        netconnType = @"3G";
    }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyCDMAEVDORevA"]){
        netconnType = @"3G";
    }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyCDMAEVDORevB"]){
        netconnType = @"3G";
    }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyeHRPD"]){
        netconnType = @"HRPD";
    }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyLTE"]){
        netconnType = @"4G";
    }
    return netconnType;
}

@end
