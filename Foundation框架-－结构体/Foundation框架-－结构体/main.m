//
//  main.m
//  Foundation框架-－结构体
//
//  Created by Mac_zzf on 7/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import <Foundation/Foundation.h>

void test() {

    //定义Date这种结构体类型
    struct Date {
    
        int year;
        int mounth;
        int day;
    };
    
    struct Date d = {2015, 4, 9};
    d.day = 6;
}

void test1() {

    typedef struct Date {
    
        int year;
        int mounth;
        int day;
    }Mydate;
    
    Mydate d = {2015, 4, 9};
    d.day = 10;
}

#pragma mark - NSRange结构体
/*
 * 这个结构体用来表示事物的一个范围，通常是字符串里的字符范围或者集合里的元素范围
 * location表示该范围的起始位置，length表示该范围内所含的元素个数
 * 比如“I Love You”中的“Love”可以用location为3，length为4的范围来表示。
 */
void range() {
    //有三种方式创建一个NSRange变量
    
    //第一种：直接给成员赋值
    NSRange range1;
    range1.location = 7;
    range1.length = 3;
   
    //第二种：应用c语言的聚合结构体赋值机制
    NSRange range2 = {7, 3};
    //或者NSRange range2 ＝ ｛.location = 7, .length = 3｝;
    
    //第三种：Foundation框架提供的一个快捷函数NSMakeRange
    NSRange range3 = NSMakeRange(7, 3);
    
    NSLog(@"location:%zi", range2.location);
    NSLog(@"length:%zi", range2.length);
    
    //NSLog(@"%@",range3)；会报错，%@表示OC对象
    //转换成字符串打印
    NSString *str = NSStringFromRange(range1);
    NSLog(@"%@", str);
    
    NSString *str1 = NSStringFromRange(range3);
    NSLog(@"%@", str1);
    
}

#pragma mark - NSPoit结构体
/*
 *这个结构体代表的是平面中的一个点（x，y）
 */

void point() {

    //NSPoint和CGpoint是一样的
    
    NSPoint p, p1, p2;
    //第一种方式
    p.x = 10;
    p.y = 3;
    
    NSString *str = NSStringFromPoint(p);
    NSLog(@"%@",str);
    
    //第二种方式：NSMakePoint()方法;
    p1 = NSMakePoint(11, 3);
    NSString *str1 = NSStringFromPoint(p1);
    NSLog(@"%@",str1);
    
    //第三种方式:CGPintMake()方法，常见方式
    p2 = CGPointMake(12, 3);
    NSString *str2 = NSStringFromPoint(p2);
    NSLog(@"%@",str2);
    
}

#pragma mark - NSSize结构体
/*
 * 这个结构体用来存储宽度和高度
 * 可以利用NSMakeSize（）和CGSizeMake（）创建CGSize
 */

void size() {

    //第一种方式创建
    NSSize size;
    size.height = 10;
    size.width = 11;
    NSString *str = NSStringFromSize(size);
    NSLog(@"%@",str);
    
    //第二种方式创建：NSSMakeSize（）方法
    NSSize size1;
    size1 = NSMakeSize(8, 9);
    NSString *str1 = NSStringFromSize(size1);
    NSLog(@"%@",str1);
    
    //第三种方式创建：CGSizeMAke（）方法
    NSSize size2;
    size2 = CGSizeMake(6, 7);
    NSString *str2 = NSStringFromSize(size2);
    NSLog(@"%@",str2);
}

#pragma mark - NSRect结构体
/*
 * 这个结构体是用来存储点和面的，点就是NSPoint，面就是NSSize，
 * origin是CGPoint， size是CGSize
 * 可以利用NSMakeRect（）和CGRectMake（）创建CGRect
 */

void rect() {

    NSRect rect1;
    //只能一个一个赋值，不可以rect1.origin = {10, 10}
    
    //第一种方式：
    rect1.origin.x = 10;
    rect1.origin.y = 10;
    rect1.size.width = 100;
    rect1.size.height = 100;
    NSString *str1 = NSStringFromRect(rect1);
    NSLog(@"%@", str1);
    
    //第二种方式：NSMakeRect（）方法
    NSRect rect2 = NSMakeRect(1, 2, 3, 4);
    NSString *str2 = NSStringFromRect(rect2);
    NSLog(@"%@", str2);
    
    //第三种方式：CGRectMake（）方法
    NSRect rect3 = CGRectMake(5, 6, 7, 8);
    NSString *str3 = NSStringFromRect(rect3);
    NSLog(@"%@", str3);
    
}
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        //NSLog(@"Hello, World!");
        range();
        point();
        size();
        rect();
    }
    return 0;
}

