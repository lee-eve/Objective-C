//
//  Student.m
//  内存管理2.1－set方法的内存管理
//
//  Created by Mac_zzf on 5/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import "Student.h"

@implementation Student

@synthesize age = _age;

#pragma mark 构造方法
- (id)initWithAge:(int)age {
    
    if (self = [super init]) {
        _age = age;
    }
    return  self;
}

#pragma mark 回收对象
- (void)dealloc {
    
    NSLog(@"student :%i被销毁", _age);
    
}

#pragma mark - getter 和 setter
//如果手动实现getter和setter方法，xcode就部会自动生成@synthesize
//也就部会自动生成——book
#pragma mark Book的seter方法
-(void)setBook:(Book *)book {
    NSLog(@"stu对象调用set方法设置price前，需要release stu对象的计数器。");
    _book = book;
}

#pragma mark Book的getter方法
-(Book *)book {
    
    return _book;
}
#pragma mark - 公共方法
#pragma mark 读书
- (void)readBook {
    
    NSLog(@"当前读的书是：%f", _book.price);
}

@end
