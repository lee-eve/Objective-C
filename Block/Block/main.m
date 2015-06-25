//
//  main.m
//  Block
//
//  Created by Mac_zzf on 7/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef int (^MyBlock) (int, int);

void test1() {

    //定义了一个block，这个block返回值是int型，接收两个int参数。
    int (^Sum) (int, int) = ^(int a, int b) {
    
        return a + b;
    };
    int a = Sum(10, + 12);
    NSLog(@"%i", a);
}

void test2() {

    MyBlock sum = ^(int a, int b) {
    
        return a + b;
    };
    
    NSLog(@"%i", sum(10, 10));
}

void test3() {

    MyBlock eq = ^(int a, int b) {
        
        return a - b;
        
    };
    NSLog(@"%i", eq(98, 8));
};

void test4() {

    __block int c = 7;
    MyBlock sum_eq = ^(int a, int b) {
        c = 5;
        return a + b - c;
    };
    NSLog(@"%i", sum_eq(10, 7));
}
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        //NSLog(@"Hello, World!");
        
//        int (^Sum)(int, int) = ^(int a, int b) {
//        
//            return a+b;
//        };
//        
//         int a = Sum(10, 19);
//        
//        NSLog(@"%i", a);
        test1();
        test2();
        test3();
        test4();
    }
    return 0;
}

