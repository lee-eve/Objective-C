//
//  Student.m
//  内存管理1-retain和release
//
//  Created by Mac_zzf on 3/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import "Student.h"

@implementation Student

@synthesize age = _age;

- (void)dealloc{
    
    NSLog(@"%@被销毁了",self);
    //[super dealloc];
    
}
@end
