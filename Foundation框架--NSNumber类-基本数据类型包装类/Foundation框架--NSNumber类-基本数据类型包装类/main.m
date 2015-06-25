//
//  main.m
//  Foundation框架--NSNumber类-基本数据类型包装类
//
//  Created by Mac_zzf on 17/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - NSNumber-基本数据类型包装类
/*
 * NSNumber可以将基本数据类型包装成对象，这样可以间接将基本数据类型存进
 * NSArray、NSDictionary等集合中
 */

// 常见的初始化方法：
void numberCreate() {

    // 静态方法
    // +(NSNumber *)numberWihtChar:(char)value
    // +(NSNumber *)numberWithInt:(int)value
    // +(NSNumber *)numberWihtFloat:(float)value
    // +(NSNumber *)numberWihtBool:(BOOL):value
    
    // 动态方法
    // -(id)initWihtChar:(char)value
    // -(id)initWihtInt:(int)value
    // -(id)initWihtFloat:(float)value
    // -(id)initWihtBool:(BOOL)value
    
    // 以Int类型为例子演示
    
    // 将int类型的10包装成一个NSNumber对象
    NSNumber *number = [NSNumber numberWithInt:10];
    // 创建一个空的可变数组
    NSMutableArray *array = [NSMutableArray array];
    // 将number添加到数组中
    [array addObject:number];
    
    // 创建另一个NSNumber对象number1，用来取出array数组中的最后一个元素，取出来的还是一个NSNumber对象，不支持自动解包（也就是说不会自动将NSNumber类转化为int类型）
    NSNumber *number1 = [array lastObject];
    // 所以需要自己将NSNumber转化为int类型，  -（int）intValue方法
    int num = [number1 intValue];
    NSLog(@"num=%i", num);
}

#pragma mark NSNumber--常用的方法
void numberUse() {

    // -(char)charValue
    // -(int)intValue
    // -(double)doubleValue
    // -(BOOL)boolValue
    // -(NSString *)stringValue
    // -(NSComparisonResult)compare:(NSNumber *)otherNumber
    // -(BOOL)isEqualToNumber:(NSNumber *)number
}
int main(int argc, const char * argv[])
{

    @autoreleasepool {
    
        numberCreate();
        
    }
    return 0;
}

