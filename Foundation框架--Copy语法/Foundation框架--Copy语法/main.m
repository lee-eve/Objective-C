//
//  main.m
//  Foundation框架--Copy语法
//
//  Created by Mac_zzf on 20/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

#pragma mark - Copy语法
/*
 * 一个对象使用copy或mutableCopy方法可以创建对象的副本，copy - 需要实现
 * NSCoppying协议，创建的是不可变的副本（如NSString、NSArray、NSDicti
 * onary),mutableCopy - 需要先实现NSMutableCopping协议，创建的是可变
 * 副本（如NSMutableString、NSMutableArray、NSMutableDictionary）
 * 深复制：内容拷贝，源对象和副本指向的是不同的两个对象，源对象应用计数器不变
 * ，副本计数器设置为1
 * 浅复制：指针拷贝，源对象和副本指向同一个对象，对象的应用计数器+1，其实相当
 * 于做了一次retain操作
 * 只有不可变对象创建不可变副本（copy）才是浅复制，其他都是深复制
 */


#pragma mark 演示字符串的拷贝 (浅拷贝)
// 浅拷贝：指针拷贝，不会产生新的对象。源对象计数器+1.
void stringCopy() {
    
    // string:1
    NSString *string = [[NSString alloc] initWithFormat:@"age is %i",10];
    
    // copy产生的是不可变副本，由于源对象本身就不可变的，所以为了机器性能copy会直接返回源对象本身，相当于retain。
    // 源对象计数器会+1  string：2
    NSString *str = [string copy];
    NSLog(@"str:%zi", [str retainCount]);
    NSLog(@"string:%zi",[string retainCount]);
    
    // string:1
    [str release];
   
    NSLog(@"str:%zi", [str retainCount]);
    NSLog(@"string:%zi",[string retainCount]);
    // string:0
    [string release];
    
    // string1:1
    NSString *string1 = [[NSString alloc] initWithFormat:@"name is Lee"];
    NSMutableString *str1 = [string1 copy];
    NSLog(@"str1:%zi", [str1 retainCount]);
    NSLog(@"string1:%zi",[string1 retainCount]);
    //[str1 release];
    NSLog(@"string1:%zi",[string1 retainCount]);
    // [str1 appendString:@"name is Leezx"];
    // NSLog(@"string1:%@, str1:%@",string1,str1);
}

#pragma mark 可变字符串的MutableCopy（深拷贝）
void stringCopy1() {
    
    NSMutableString *string = [NSMutableString stringWithFormat:@"age is %i", 10];
    
    // 会产生一个新对象，str计数器为1
    NSMutableString *str = [string mutableCopy];
    [str appendString:@"123"];
    // str 和 string不是相同的对象
    NSLog(@"str:%@", str);
    NSLog(@"string:%@", string);
    
    [str release];
}

#pragma mark 为自定义类添加复制功能，演示Student的name的copy
/*
 * 如果想自定义copy，那么就必须遵守NSCopying，并且实现copyWithZone：方法
 * 如果自定义mutableCopy，那么就必须遵守NSMutableCopy，并且实现copyWithz
 * one：方法。
 * 以copy为例，建议用[self class]代替直接类名
 * -(id)copyWithZone:(NZone *)zone {
 *     id copy = [[[self class] allocWithZone:zone] init];
 *      // 做一些属性的初始化
 *     return copy；
 *  }
 */
void studentNameCopy() {

    Student *stu = [[[Student alloc] init] autorelease];
    
    NSMutableString *string =  [NSMutableString stringWithFormat:@"age is %i", 10];
    
    stu.name = string;
    [string appendFormat:@"abcd"];
    NSLog(@"name=%@", stu.name);
    NSLog(@"string=%@", string);
}

int main(int argc, const char * argv[])
{

    @autoreleasepool {
//        
//        stringCopy();
//        stringCopy1();
        studentNameCopy();
        
    }
    return 0;
}

