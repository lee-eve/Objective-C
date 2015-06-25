//
//  main.m
//  内存管理4-atorelease
//
//  Created by Mac_zzf on 5/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
int main(int argc, const char * argv[])
{

    //@autoreleasepool代表自动创建一个释放池
    @autoreleasepool {
        
        // insert code here...
        //NSLog(@"Hello, World!");
        Student *stu = [[[Student alloc] init] autorelease];
        //[stu autorelease];
        Student *stu1 = [[Student alloc] init];
        [stu1 autorelease];
        
        Student *stu2 = [Student student];
    }
    
    //创建；另一个释放池
    @autoreleasepool {
        
        // insert code here...
        //NSLog(@"Hello, World!");
        Student *stu3 = [[Student alloc] init];
        [stu3 autorelease];
    }
    return 0;
}

