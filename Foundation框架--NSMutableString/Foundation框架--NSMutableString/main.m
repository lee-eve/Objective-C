//
//  main.m
//  Foundation框架--NSMutableString
//
//  Created by Mac_zzf on 11/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - NSMutableString 可变字符串
/*
 * NSString是不可变的，不能删除字符或者添加字符。NSString有一个子类
 * NSMutableString，称为"可变字符串"
 * 创建可变字符串的常用方法
 * -(id)initWithCapacity:(NSUInteger）capacity
 * +(id)stringWithCapacity:(NSUInteger) capacity
 * capacity只是一个最优值，字符串的大小并不限于所提供的容量，设置了
 * capacity，可以预分配一块内存来存储它，操作速度会快很多
 * 当然，也可以使用创建NSString的方法来创建NSMutableString，因为
 * NSMutableString是NSString的子类，NSString能用的方法，NSMutableSt
 * ring都能用
 *
 */

#pragma mask - NSMutableString的创建以及常用方法
void stringCreate() {

    //预先分配10个字数的存储空间
    NSMutableString *str = [[NSMutableString alloc] initWithCapacity:10];
    //设置字符串内容
    [str setString:@"12340"];
    NSLog(@"%@", str);
    //拼接字符串
    [str appendString:@"456"];
    NSLog(@"%@",str);
    
    [str appendFormat:@"age is %i and height is %.2f", 21, 1.75f];
    NSLog(@"%@",str);
    
    //将range位置的字符串替换为aString
    NSRange range = [str rangeOfString:@"height"];
    //NSRange range = NSMakeRange(7,3);
    [str replaceCharactersInRange:range withString:@"no"];
    NSLog(@"%@",str);
    
    //插入字符串
    [str insertString:@"abc" atIndex:2];
    NSLog(@"%@",str);
    
    //删除字符串
    range = [str rangeOfString:@"age"];
    [str deleteCharactersInRange:range];
    NSLog(@"%@",str);
}

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        stringCreate();
        
    }
    return 0;
}

