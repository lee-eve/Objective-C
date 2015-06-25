//
//  main.m
//  Foundation--NSMutableArray可变数组
//
//  Created by Mac_zzf on 13/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#pragma mark - NSMutableArray 可变数组

#pragma mark 可变数组的创建
void createMutableArray() {

    NSMutableArray *array = [NSMutableArray arrayWithObject:@"1"];
    //添加元素
    [array addObject:@"2"];
    [array addObject:@"3"];
    
    //删除指定元素
    [array removeObject:@"2"];
    //删除最后一个元素
    [array removeLastObject];
    //删除所有元素
    [array removeAllObjects];
    NSLog(@"%@", array);
}

#pragma mark 可变数组内存管理
void arrayMemory() {

    NSMutableArray *array = [NSMutableArray array];
    Student *stu1 = [Student studentWithAge:10];
    Student *stu2 = [Student studentWithAge:20];
    
    //对被添加的元素做一次retain操作， 计数器+1
    [array addObject:stu1];
    [array addObject:stu2];
    NSLog(@"add->stu1:%zi", [stu1 retainCount]);
    NSLog(@"add->stu2:%zi", [stu2 retainCount]);
    
    //对被删除的元素做一次release操作，计数器-1
    [array removeObject:stu1];
    NSLog(@"remove->stu1:%zi", [stu1 retainCount]);
    NSLog(@"stu2Count:%zi", [stu2 retainCount]);
    
    
    [stu1 release];
    [stu2 release];
//    NSLog(@"remove22->stu1:%zi", [stu1 retainCount]);
//    NSLog(@"stu2Count22:%zi", [stu2 retainCount]);
    //当数组被释放的时候，会对所有元素都做一次release操作
    [array release];
    //NSLog(@"stu1Count:%zi", [stu1 retainCount]);
    //NSLog(@"stu2Count:%zi", [stu2 retainCount]);
}

#pragma mark 可变数组添加元素
void addobject() {
    
    NSMutableArray *array = [[[NSMutableArray alloc] init] autorelease];
    NSMutableArray *array1 = [NSMutableArray arrayWithObjects:@"2",@"3", nil];
    NSMutableArray *array2 = [NSMutableArray arrayWithObjects: @"4",@"5", nil];
    
    
    //-(void)setArray:(NSArray *)otherArray    设置集合元素
    [array setArray:array1];
    NSLog(@"%@", array);
    
    //-(void)addObject:(id)anObject     添加一个元素
    [array2 addObject:@"6"];
    NSLog(@"%@", array2);
    
    //-(void)addObjectFromArray:(NSArray *)otherArray   添加otherArray的全部元素到集合中
    [array addObjectsFromArray:array2];
    NSLog(@"%@", array);
    
    //-(void)insertObject:(id)anObject atIndex:(NSUInteger)index     在inde位置插入一个元素
    [array1 insertObject:@"1" atIndex:0];
    NSLog(@"%@", array1);
    [array addObjectsFromArray:array1];
    NSLog(@"%@", array);
    
    //-(void)insertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexes   在指定的位置分别插入objects中的元素
   
//    NSArray *array3 = [NSArray arrayWithObjects:@"7", @"8", nil];
//    [array2 insertObjects:array3 atIndexes:];
//    NSLog(@"%@",array2);
}

#pragma mark 可变数组删除元素
void deleteObject() {

    NSMutableArray *array = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8", nil];
    //-（void）removeLastObject    删除最后一个元素
    [array removeLastObject];
    NSLog(@"%@",array);
    
    //-(void)removeObjectAtIndex:(NSUInteger)index      删除index位置的元素
    [array removeObjectAtIndex:0];
    NSLog(@"%@", array);
    
    //-(void)removeObjectAtIndexes:(NSIndexSet *)indexes    删除indexes位置的所有元素
    
    //-(void)removeObject:(id)anObject inRange:(NSRange)range     在range范围内查找特定的元素进行删除
    NSRange range = NSMakeRange(0, 2);
    [array removeObjectIdenticalTo:@"2" inRange:range];
    NSLog(@"%@", array);
    
    //-(void)removeObjectsInRange:(Ranges)range     删除range范围内的所有元素
    [array removeObjectsInRange:range];
    NSLog(@"%@", array);
    
    //-(void)removeObjectsInArray:(NSAray *)otherArray      删除同时存在在于otherArray和当前集合中的所有元素
    
}
#pragma mark 可变数组替换元素

void replace() {

    NSMutableArray *array = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8", nil];
    //-(void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject     用anObject替换index位置对应的元素
    [array replaceObjectAtIndex:0 withObject:@"a"];
    NSLog(@"%@", array);
    
    //-(void)replaceObjectAtIndexs:(NSIndexSet *)indexes withObjects:(NSArray *)objects     用objects中的元素分别替换indexes对应位置的元素
    
    //-(void)replaceObjectsInRange:(NSRange)range withObjectsFromArray:(NSArray *)otherArray range:(NSRange)otherRange      用otherArray中therRange范围内的元素替换当前集合range范围内的元素
    NSArray *array1 = [NSArray arrayWithObjects:@"b",@"c",@"d", nil];
    NSRange range = NSMakeRange(1, 4);
    NSRange range2 = NSMakeRange(0, 3);
    [array replaceObjectsInRange:range withObjectsFromArray:array1 range:range2];
    NSLog(@"%@", array);
    
    //-(void)replaceObjectsInRaange:(NSRange)range withObjectFromArray:(NSArray *)otherArray      用otherArray中的元素替换当前集合range范围内的元素
    NSArray *array2 = [NSArray arrayWithObjects:@"e",@"f",@"g", nil];
    NSRange range1 = NSMakeRange(4, 3);
    [array replaceObjectsInRange:range1 withObjectsFromArray:array2];
    NSLog(@"%@",array);
    
    
    //-(void)exchangeObjectIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2        交换indx1和indx2位置的元素
}

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        //arrayMemory();
        //addobject();
        //deleteObject();
        replace();
    }
    return 0;
}

