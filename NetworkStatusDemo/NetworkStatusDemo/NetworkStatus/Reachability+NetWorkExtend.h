//
//  Reachability+NetWorkExtend.h
//  NetworkStatusDemo
//
//  Created by ghk on 2018/11/19.
//  Copyright © 2018年 ghk. All rights reserved.
//

#import "Reachability.h"

typedef enum : NSInteger {
    NetWorkTypeNone = 0,
    NetWorkTypeWifi,
    NetWorkType4G
} NetWorkType;

@interface Reachability (NetWorkExtend)

@end
