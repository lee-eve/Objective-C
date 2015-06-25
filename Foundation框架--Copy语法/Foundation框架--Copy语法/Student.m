//
//  Student.m
//  Foundation框架--Copy语法
//
//  Created by Mac_zzf on 27/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import "Student.h"

@implementation Student

-(void)setName:(NSString *)name {

    if (_name != name) {
        [_name release];
        _name = [name copy];
    }
}

-(void)dealloc {

    [_name release];
    [super dealloc];
}
@end
