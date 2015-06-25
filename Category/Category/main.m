//
//  main.m
//  Category
//
//  Created by Mac_zzf on 6/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "Student+Test.h"
#import "NSString+JSON.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        //NSLog(@"Hello, World!");
        
        Student *stu = [[Student alloc] init];
        
        [stu test];
        [stu test1];
        [stu test2];
        
        NSLog(@"%@",[NSString json]);
        
    }
    return 0;
}

