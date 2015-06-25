//
//  Student.m
//  Foundation框架--NSArray
//
//  Created by Mac_zzf on 11/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import "Student.h"

@implementation Student


+(id)student {

     return [[[Student alloc] init] autorelease];
}

-(void)test {

    NSLog(@"%@ --> test",self);
}

-(void)test2:(NSString *)str {

    NSLog(@"%@-->test2-->%@",self, str);
}
-(void)dealloc {

    NSLog(@"学生对象%@被释放",self);
    [super release];
}



@end
