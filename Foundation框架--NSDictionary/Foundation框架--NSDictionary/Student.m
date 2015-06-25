//
//  Student.m
//  Foundation框架--NSDictionary
//
//  Created by Mac_zzf on 17/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import "Student.h"

@implementation Student

+(id)studentWithName:(NSString *)aName {

    Student *stu = [[Student alloc] init];
    stu.name = aName;
    return [stu autorelease];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@", _name];
}
-(void)dealloc {

    NSLog(@"%@被销毁了", _name);
    //释放name
    [_name release];
    [super dealloc];
}

@end
