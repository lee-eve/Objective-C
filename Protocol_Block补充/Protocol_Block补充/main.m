//
//  main.m
//  Protocol_Block补充
//
//  Created by Mac_zzf on 7/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import <Foundation/Foundation.h>

int sum(int a, int b){


    return a + b;
}

void test1() {

    //定义的Sum这种Block类型
    typedef int (^Sum) (int, int);
    
    //定义了sump这种指针变量，这种指针是指向函数的
    typedef int (*sump) (int, int);
    
    //定义了一个Sum 的Blck变量sum；
    Sum sum1 = ^(int a, int b) {
    
        return a + b;
    };
    
    int c = sum1(11, 11);
    NSLog(@"%i", c);
    //定义一个指针变量p指向sum函数
    sump p = sum;
    int c1 = p(8, 8);
    int c2 = (*p)(7, 7);
    NSLog(@"%i,%i", c1, c2);

}

#import "Student.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        //NSLog(@"Hello, World!");
        
        //protocol
        
        Student *stu = [[Student alloc] init];
        //confromToProtocol：判断是否遵守了某个协议
        if ([stu conformsToProtocol:@protocol(Study)]) {
            NSLog(@"Student遵守了study协议");
        }
        //respondsToSelector:判断是否实现了某个方法
        if (![stu respondsToSelector:@selector(test)]) {
            NSLog(@"Student没有实现test方法");
        }
        
        
        //Block
        
        int (^Sum) (int, int) = ^(int a, int b) {
        
            return a + b;
        };
        //Block调用
        int c = Sum(10, 9);
        NSLog(@"%i", c);
        //函数调用
        c = sum (10, 10);
        NSLog(@"%i",c);
        
        
        int (*sump) (int, int) = sum;
        c = (*sump)(9, 9);
        NSLog(@"%i", c);
        
        test1();
    }
    return 0;
}

