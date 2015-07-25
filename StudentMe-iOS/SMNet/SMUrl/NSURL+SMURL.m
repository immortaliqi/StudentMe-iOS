//
//  NSURL+SMURL.m
//  StudentMe-iOS
//
//  Created by SeanChense on 15/7/25.
//  Copyright (c) 2015年 UESTC-BBS. All rights reserved.
//

#import "NSURL+SMURL.h"

@implementation NSURL (SMURL)

+ (NSString *)smHostString {
    return @"http://bbs.uestc.edu.cn";
}

#pragma mark - user
+ (NSString *)smLoginString {
    return [[self prefixbbsUrlString] stringByAppendingString:@"user/login"];
}



#pragma mark - private method

+ (NSString *)prefixbbsUrlString {
    return [[self smHostString] stringByAppendingString:[self bbsMiddleUrlString]];
}

+ (NSString *)bbsMiddleUrlString {
    return @"/mobcent/app/web/index.php?r=";
}
@end
