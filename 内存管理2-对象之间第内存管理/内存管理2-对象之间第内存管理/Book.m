//
//  Book.m
//  内存管理2-对象之间第内存管理
//
//  Created by Mac_zzf on 3/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import "Book.h"

@implementation Book

//给方法分组
#pragma mark - 生命周期方法
//给方法注释
#pragma mark 构造方法
- (id)initWithPrice:(float)price {
 
    if (self = [super init]) {
        _price = price;
    }
    return self;
}

#pragma mark 回收对象
- (void)dealloc {

    NSLog(@"book: %f 被销毁了", _price);
}



@end
