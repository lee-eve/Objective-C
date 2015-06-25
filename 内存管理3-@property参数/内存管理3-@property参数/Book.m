//
//  Book.m
//  内存管理3-@property参数
//
//  Created by Mac_zzf on 5/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import "Book.h"

@implementation Book

-(void)dealloc {

    NSLog(@"Book被销毁了");
    [super dealloc];
}

@end
