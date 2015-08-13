
//
//  ShowStart.m
//  shipin
//
//  Created by 乐知学院 on 15/8/12.
//  Copyright (c) 2015年 乐知学院. All rights reserved.
//

#import "ShowStart.h"

@implementation ShowStart
static ShowStart *usertelphonenum=nil;
+(ShowStart *)showStart{
    if (usertelphonenum==nil) {
        usertelphonenum=[[ShowStart alloc]init];
        usertelphonenum.dic=[[NSMutableDictionary alloc]initWithCapacity:10];
    }
    return usertelphonenum;
}

@end
