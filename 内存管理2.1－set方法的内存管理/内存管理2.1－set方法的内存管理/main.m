//
//  main.m
//  内存管理2.1－set方法的内存管理
//
//  Created by Mac_zzf on 5/4/15.
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
    //stu : 1
    //book : 1
    //book2 : 1
    stu.book = book2;
    //stu : 1
    //book : 0   自动调用dealloc方法
    //book2 : 1
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


