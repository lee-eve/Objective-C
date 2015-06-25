//
//  main.m
//  Foundation框架--NSArray
//
//  Created by Mac_zzf on 11/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

#pragma mark - NSArray 数组
/*
 * 用来存储对象的有序列表，它是不可变的,只允许装OC对象
 * 不存储C语言中的基本数据类型，如int，float，enum，struct，也不能存储nil
 * 创建NSArray的常用方法
 * + (id)array
 * + (id)arrayWithObject:(id)anObject
 * + (id)arrayWithObjects:(id)firstObject, .....
 * + (id)arrayWithArray:(NSArray *)array
 * - (id)initWithObjects:(id)fristObj, ....
 * - (id)initWithArray:(NSArray *)array
 * + (id)arrayWithContentsOfFile:(NSString *)path
 * + (id)arrayWithContentsOfURL:(NSURL *)url
 * - (id)initWithContentsOfFile:(NSString *)path
 * - (id)intiWithContentsOfURL:(NSURL *)url
 */
#pragma mark - NSArry数组的创建
void arrayCreate() {

    //创建一个空数组
    NSArray *array = [NSArray array];
    
    //创建一个有一个元素的数组
    array = [NSArray arrayWithObject:@"123"];
    
    //创建多个元素的数组
    array = [NSArray arrayWithObjects:@"a",@"b",@"c", nil];
    int count = [array count];
    NSLog(@"%i", count);
}

#pragma  mark - NSArray数组的方法使用

void arrayUse() {
    
    NSArray  *array = [NSArray arrayWithObjects:@"a",@"b",@"c", nil];
    //- (NSUInteger)count  获取数组的元素个数
    int count = [array count];
    NSLog(@"%i",count);
    
    //-（BOOL）containObject：（id）anObject 是否包含某个元素
    if ([array containsObject:@"b"]) {
        NSLog(@"包含了字符串b");
    }
    
    //- (id)lastObject      返回最后一个元素
    NSLog(@"last = %@",[array lastObject]);
    
    //- (id)objectAtIndex:(NSUInteger)index     获取对应index对象位置的元素
    NSLog(@"%@",[array objectAtIndex:0]);
    
    //-（NSUInteger）indexOfObject：（id）anObject   查找元素的位置
    NSLog(@"%zi",[array indexOfObject:@"a"]);
    
    //-(NSUInteger)indexOfObject:(id)anObject inRange:(NSRange)range        在range范围内查找元素的位置
    //NSRange range = NSMakeRange(1, 2);
    //NSLog(@"%zi",[array indexOfObject:array inRange:range]);
    
}

#pragma mask - NSArray 数组的内存管理
void arrayMemory() {

    Student *stu1 = [[Student alloc] init];
    Student *stu2 = [[Student alloc] init];
    Student *stu3 = [[Student alloc] init];
    
    NSLog(@"stu1:%zi", [stu1 retainCount]);
    
    //当把一个对象塞进一数组中时，这个对象的计数器会加1, 也就是说数组会对它做一次retain操作
    NSArray *array = [[NSArray alloc] initWithObjects:stu1, stu2, stu3, nil];
    NSLog(@"stu1:%zi", [stu1 retainCount]);
    
    NSLog(@"count = %zi", array.count);
    
    //数组被销毁的时候，会对内部的所有元素都做一个relesase操作
    [array release];
    [stu1 release];
    [stu2 release];
    [stu3 release];
}

#pragma mark - NSArray 数组的比较

void compare() {

    NSArray *array = [NSArray arrayWithObjects:@"a", @"b", @"c", nil];
    NSArray *array1 = [NSArray arrayWithObjects:@"aw", @"b", @"c", nil];
    
    //- (BOOL)isEqualToArray:(NSArray *)otherArray      比较两个集合内容是否相同
    if ([array isEqualToArray:array1]) {
        
        NSLog(@"array 和 array1 是相同的");
    } else {
    
        NSLog(@"array 和 array1 是不相同的");
    }
    
    //- (id)firstObjectCommonWithArray:(NSArray *)otherArray        返回两个集合中第一个相同的对象元素
    NSLog(@"array 和 array1 中第一个相同的元素是：%@",[array firstObjectCommonWithArray:array1]);
    
}

#pragma mark - NSArray 给元素发送消息

void sendMessage() {
    
    //利用静态方法创建Student对象
    Student *stu1 = [Student student];
    Student *stu2 = [Student student];
    Student *stu3 = [Student student];
    //把创建好的sutdent对象塞进数组中
    
    NSArray *array = [NSArray arrayWithObjects:stu1,stu2,stu3, nil];
    // - (void)makeObjectPerfromSelector:(SEl)aSelector
    // - (void)makeObjectPerformSelector:(SEL)aSelector withObject:(id)argument
    // 让集合里面的所有元素都执行aSelector这个方法
    //让所有的student对象都调用test方法
    [array makeObjectsPerformSelector:@selector(test)];
    [array makeObjectsPerformSelector:@selector(test2:) withObject:@"123"];
}

#pragma mark - NSArray 数组的遍历

//普通遍历
void arrayFor1() {

    NSArray *array = [NSArray arrayWithObjects:@"a", @"b", @"c", nil];
    int count = array.count;
    for (int i = 0; i <count; i++) {
        id obj = [array objectAtIndex:i];
        NSLog(@"%i-%@", i, obj);
    }
    //id == void *
}

//快速遍历
void arrayFor2() {
    
    NSArray *array = [NSArray arrayWithObjects:@"a", @"b", @"c", nil];
    int i = 0;
    for (id obj in array) {
        NSLog(@"%i-%@", i, obj);
        i++;
    }
    
}

//Block遍历
void arrayFor3() {
    
    NSArray *array = [NSArray arrayWithObjects:@"a", @"b", @"c", nil];
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSLog(@"%i-%@",idx, obj);
        
        //如果索引为1，就停止遍历
        if (idx == 2) {
            //利用指针修改外面BOOL变量的值
            *stop = YES;
        }
    }];
}

//Block遍历
void arrayFor4() {
    
    NSArray *array = [NSArray arrayWithObjects:@"a", @"b", @"c", nil];
    /*
     * 集合的迭代器，可用于遍历集合元素
     * NSArray有相应的方法来可以获取迭代器
     * 获取一个正序遍历的迭代器
     * -（NSEnumerator *）objectEnumerator
     * 获取一个反序遍历的迭代器
     * -（NSEnumerator *）reverseObjectEnumerator
     * NSEnumerator常用方法
     * -（NSEnumerator *）allObjects       获取所有元素
     */
    
    //正序遍历
    NSEnumerator *enumerator = [array objectEnumerator];
    //反序遍历
    //NSEnumerator *enumerator = [array objectEnumerator];
    //-(id)nextObject获取下一个需要遍历的元素
    id obj = nil;
    while (obj = [enumerator nextObject]) {
        NSLog(@"obj=%@", obj);
    }
    
    //allObjects是提取没有被遍历的对象
    NSArray *array2 = [enumerator allObjects];
    NSLog(@"array2:%@", array2);
    id obj1 = nil;
    while (obj1 = [enumerator nextObject]) {
        NSLog(@"obj=%@", obj1);
    }
}
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        //arrayCreate();
        //arrayUse();
        //arrayMemory();
        //compare();
        //sendMessage();
        arrayFor4();
    }
    return 0;
}

