//
//  main.m
//  Foundation框架--NSDictionary
//
//  Created by Mac_zzf on 16/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

#pragma mark - NSDictionary 字典
/*
 * 通过唯一的key找到对应的value。
 */

#pragma mark NSDictionary--字典的初始化
// 常见的创建NSDictionary的方法

void createDictionary() {

    // + (id)dictionary
    // NSDIctionary是不可变
    NSDictionary *dict = [NSDictionary dictionary];
    
    // + (id)dictionaryWithObject:(id)object forKey:(id <NSCopying>)key
    NSDictionary *dict1 = [NSDictionary dictionaryWithObject:@"v" forKey:@"k"];
    NSLog(@"%@",dict1);
    
    // + (id)dictionaryWithObjects:(id)firstObject, ...
    // 最常用的初始化方式
    dict = [NSDictionary dictionaryWithObjectsAndKeys:
            @"v1", @"k1",
            @"v2", @"k2",
            @"v3", @"k3", nil];
    NSLog(@"%@",dict);
    
    // + (id)dictionaryWithDictionary:(NSDictionary *)dict
    
    // + (id)dictionaryWithObjects:(NSArray *)objects forKeys:(NSArry *)keys
    NSArray *object = [NSArray arrayWithObjects:@"v4", @"v5", @"v6", nil];
    NSArray *keys = [NSArray arrayWithObjects:@"k4", @"k5", @"k6", nil];
    NSDictionary *dict2 = [NSDictionary dictionaryWithObjects:object forKeys:keys];
    NSLog(@"%@", dict2);
    
    // - (id)initWithObjectsAndKeys:(id)firstObject, ...
    
    // - (id)initWithDictionary:(NSDictionary *)otherDictionary
    
    // - (id)initWithObjects:(NSArray *)objects forKeys:(NSArray *)keys
    
    
    // + (id)dictionaryWithContentsOfFile:(NSString *)path
    
    // + (id)dictionaryWithContentsOfURL:(NSURL *)url
    
    // - (id)initWithContentsOfURL:(NSURL *)url
}

#pragma mark NSDitionary--字典的常用方法

void useDictionary() {
    
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
            @"v1", @"k1",
            @"v2", @"k2",
            @"v3", @"k3", nil];
    
    // -(NSUInteger)count        返回字典的key数
    NSLog(@"count=%zi", dict.count);
    //NSLog(@"count=%zi",[dict count]);
    
    // - (BOOL)isEqualToDictionary:(NSDictionary *)otherDictionary  比较两个字典
    NSDictionary *dict1 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"v1", @"k1",
                          @"v2", @"k2",
                          @"v3", @"k3", nil];
    if ([dict isEqualToDictionary:dict1]) {
        NSLog(@"dict与dict1是相同的");
    } else {
        NSLog(@"dict与dict1是不相同的");
    }
    
    // -(BOOL)writeToFile:(NSString *)path atomically:(BOOL)useAuxiliaryFile    将一个NSDictionary转化为文件写入指定的Path
    //将字典写入文件中
    NSString *path = @"/Users/Mac_zzf/Desktop/dict.xml";
    if ([dict writeToFile:path atomically:YES]) {
        NSLog(@"字典成功写入！");
    } else {
    
        NSLog(@"字典未写入！");
    }
    
}

#pragma mark NSDictionary--字典的访问key和value
void useDictionary2() {

    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"v1", @"k1",
                           @"v2", @"k2",
                           @"v3", @"k3", nil];
    // -(NSArray *)allKeys      返回所有的key
    NSArray *keys = [dict allKeys];
    NSLog(@"all keys:%@", keys);
    // -(NSArray *)allValues    返回所有的value
    NSArray *values = [dict allValues];
    NSLog(@"all values:%@", values);
    
    // -(NSArray *)allKeyForObject:(id)anObject     返回anObject元素对应的所有key
    NSDictionary *dict1 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"v", @"k1",
                          @"v", @"k2",
                          @"v1", @"k3", nil];
    NSLog(@"%@", [dict1 allKeysForObject:@"v"]);
    
    // -(NSArray *)objectsForKeys:(NSArray *)keys notFoundMarker:(id)marker     返回keys对应的所有value，如果没有对应的value，用marker代替
    NSArray *objects = [dict objectsForKeys:[NSArray arrayWithObjects:@"k1", @"k2", @"k4",nil] notFoundMarker:@"not-found"];
    NSLog(@"objects=%@", objects);
    
}

#pragma mark NSDictionary--字典的遍历

void dictionaryFor1() {
    
    // 快速遍历: for (NSString *key in dict)
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"v1", @"k1",
                          @"v2", @"k2",
                          @"v3", @"k3", nil];
    // 遍历字典的所有key，根据key遍历出value
    for (id key in dict) {
        id value = [dict objectForKey:key];
        NSLog(@"%@=%@", key, value);
    }
}

void dictionaryFor2() {
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"v1", @"k1",
                          @"v2", @"k2",
                          @"v3", @"k3", nil];

    //迭代器遍历：
    // - （NSEnumerator *）KeyEnumerator      key的迭代器
    NSEnumerator *enumer = [dict keyEnumerator];
    id key = nil;
    while (key = [enumer nextObject]) {
        id value = [dict objectForKey:key];
        NSLog(@"%@=%@", key, value);
    }
    // - (NSEnumerator *)objectEnmerator     value的迭代器
    NSLog(@"%@",[dict objectEnumerator]);
}

void dictionaryFor3() {

    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"v1", @"k1",
                          @"v2", @"k2",
                          @"v3", @"k3", nil];
    //利用Block遍历
    [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        NSLog(@"%@=%@", key, obj);
    }];
    
}

#pragma mark NSDictionary--字典排序

void dictionarySorted() {

    //用法参照NSArray的排序
    // -(NSArray *) keysSortedByValueUsingComparator:(NSComparator) cmpt
    
    // -(NSArray *)keysSortedByValueWithOptions:(NSSortOptions)opts usingComparator:(NSComparator)cmpt
    
    //-(NSArray *)keysSortedSortedByValueUsingSelector:(SEL)compartorator
    
}

#pragma mark NSDictionary--字典的内存管理
void dictionaryMenory() {

    Student *stu1 = [Student studentWithName:@"stu1"];
    Student *stu2 = [Student studentWithName:@"stu2"];
    Student *stu3 = [Student studentWithName:@"stu3"];
    
    // 一个对象转为字典的key或者value时，会做一次retain操作，就是说计数器会+1
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          stu1,@"k1",
                          stu2,@"k2",
                          stu3,@"k3", nil];
    
    // 当字典被销毁时，字典里面的所有key和value都会做一次release操作，就是说计数器会-1
    [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        NSLog(@"%@=%@",key, obj);
    }];
}

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        //createDictionary();
    
        //useDictionary2();
        
        // dictionaryFor3();
         dictionaryMenory();
        
    }
    return 0;
}

