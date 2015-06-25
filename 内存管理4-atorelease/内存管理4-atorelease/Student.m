//
//  Student.m
//  内存管理4-atorelease
//
//  Created by Mac_zzf on 5/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import "Student.h"

@implementation Student


+(id)student {

//    Student *stu = [[[Student alloc] init] autorelease];
//    return  stu;
    return [[[Student alloc] init] autorelease];
}

+(id)studentWithAge:(int)age {

    Student *stu = [Student student];
    stu.age = age;
    return age;
}

-(void)dealloc {

    NSLog(@"%@被销毁。",self);
    [super dealloc];
}

@end
