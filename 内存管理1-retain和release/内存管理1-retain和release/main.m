//
//  main.m
//  内存管理1-retain和release
//
//  Created by Mac_zzf on 3/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        //NSLog(@"Hello, World!");
        Student *stu = [[Student alloc] init];  //计数器为1
        //NSLog(@"count:%zi", [stu retainCount]);
        
    }
    return 0;
}

