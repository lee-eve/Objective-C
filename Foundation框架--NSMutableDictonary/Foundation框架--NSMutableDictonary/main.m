//
//  main.m
//  Foundation框架--NSMutableDictonary
//
//  Created by Mac_zzf on 17/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#pragma mark NSMutableDictionary--可变字典的使用

void dictionaryUse() {
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    Student *stu1 = [Student studentWithName:@"stu1"];
    Student *stu2 = [Student studentWithName:@"stu2"];
    
    // 添加元素
    // stu1的计数器会+1
    [dict setObject:stu1 forKey:@"k1"];
    NSLog(@"stu1count:%zi", [stu1 retainCount]);
    
    NSDictionary *other = [NSDictionary dictionaryWithObject:stu2 forKey:@"k2"];
    [dict addEntriesFromDictionary:other];
    [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        NSLog(@"%@=%@",key, obj);
    }];
    NSLog(@"%@",[dict allKeys]);
    NSLog(@"%@",[dict allValues]);
    
    //删除所有的键值对      [dict removeAllObjects]
    //[dict removeAllObjects];
    
    //删除k1对应的元素stu1， stu1会做一次release操作
    [dict removeObjectForKey:@"k1"];
    NSLog(@"stu1count:%zi", [stu1 retainCount]);
    
    //字典被销毁时，内部的所有key和value计数器都会-1.也就是说stu1会release一次
}

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        dictionaryUse();
        
    }
    return 0;
}

