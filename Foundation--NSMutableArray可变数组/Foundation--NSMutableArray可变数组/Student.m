//
//  Student.m
//  Foundation--NSMutableArray可变数组
//
//  Created by Mac_zzf on 13/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import "Student.h"

@implementation Student

+(id)studentWithAge:(int)age {

    Student *stu = [[[Student alloc] init] autorelease];
    stu.age = age;
    return stu;
}

-(void)dealloc {

    NSLog(@"[age=%i]被销毁了", _age);
    [super dealloc];
}

@end
