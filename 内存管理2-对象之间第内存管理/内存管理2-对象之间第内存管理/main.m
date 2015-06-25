//
//  main.m
//  内存管理2-对象之间第内存管理
//
//  Created by Mac_zzf on 3/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"
#import "Student.h"
void test(Student *stu) {

    Book *book = [[Book alloc] initWithPrice:8.9];
    //stu: 1
    //book: 1
    stu.book = book;
    //stu.book = [[Book alloc] initWithPrice:8.9];
    
    Book *book2 = [[Book alloc] initWithPrice:7.9];
    stu.book = book2;
    
}
void test1(Student *stu) {

    [stu readBook];
    
    
}
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        //NSLog(@"Hello, World!");
        Student *stu = [[Student alloc] initWithAge:10];
        //stu: 1
        //Book *book = [[Book alloc] initWithPrice:35.6];
        test(stu);
        test1(stu);
        //[stu dealloc];
        
    }
    return 0;
}

