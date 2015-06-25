//
//  main.m
//  内存管理3-@property参数
//
//  Created by Mac_zzf on 5/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "Book.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        //NSLog(@"Hello, World!");
        Student *stu = [[Student alloc] init];
        
        Book *book = [[Book alloc] init];
        
        stu.book = book;
        NSLog(@"count=%zi", [book retainCount]);
        [book release];
        
        Book *book2 = [[Book alloc] init];
        stu.book = book2;
        [book2 release];
        stu.rich = NO;
        BOOL rich = stu.isRich;
        NSLog(@"%hhd", rich);
        [stu release];
    }
    return 0;
}

