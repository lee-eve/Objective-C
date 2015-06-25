//
//  main.m
//  Foundation框架--NSValue-包装类
//
//  Created by Mac_zzf on 17/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import <Foundation/Foundation.h>
#pragma mark - NSValue--包装类
/*
 * NSNumber是NSValue的子类，但NSNumber只能包装数字类型，NSValue可以包装
 * 任意值，也就是说可以用NSValue包装结构体后加入NSArray、NSDictionary等集
 * 合中
 */

#pragma mark NSValue--创建NSValue的常用方法
void valueCreate() {

    // value参数是想要包装的数据的地址（如一个NSPoint的地址，可以用&来取地址），type参数是用来描述这个数据类型的字符串，用@encode指令来生成
    
    // -(id)initWithBytes:(const void *)values objeCType:(const char *)type
    
    // +(NSValue *)valueWihtBytes:(const void *)value objCType:(const char*)type
    
    // +(NSValue *)value:(const void *)value withObjeCType:(const char *)type
    
    // 以CGpoint结构体为例子来演示
    
    // 创建一个系统自带的结构体CGPoint （10，10）
    CGPoint point = CGPointMake(10, 10);
    // 将CGPoint结构体变量point包装成一个NSValue对象
    NSValue *value = [NSValue valueWithPoint:point];
    // 创建一个空的可变数组array
    NSMutableArray *array = [NSMutableArray array];
    // 把value存入可变数组array中
    [array addObject:value];
    // 创建另一个NSValue对象value1，用来取出可变数组array里的元素，放入另一个CGPoint结构体point1中
    NSValue *value1 = [array lastObject];
    CGPoint point1 = [value1 pointValue];
    // 调用-（BOOL）CGPointEqualToPoint（CGPoint point1, CGPoint point2）方法，对point1与point2进行比较
    BOOL result = CGPointEqualToPoint(point, point1);
    NSLog(@"result=%i", result);
}

#pragma mark NSValue--包装自定义结构体

// 自定义结构体Date
typedef struct {
    int year;
    int month;
    int day;
}Date;
void valueUse() {

    Date date = {2015, 4, 18};
    // void *  代表任何指针
    // +(NSValue *)NSValue value:<#(const void *)#> withObjCType:<#(const char *)#> 这里要求传结构体的地址&date
    //  @encode（）    根据结构体类型生成 对应的 类型描述字符串
    char *type = @encode(Date);
    NSValue *value = [NSValue value:&date withObjCType:type];
    
    // 定义一个新的结构体变量，用于参照
    Date date1;
    
    // -(void)getValue:(void *)value   获取所包装的数据，保存到value这个地址
    [value getValue:&date1];
    
    NSLog(@"year = %i, month = %i, day = %i", date1.year, date1.month, date1.day);
    
    // -(const char *)objectCType    返回描述所包装数据类型的字符串
    // NSLog(@"%s",[value objCType]);
    
    // -(BOOL)isEqualToValue:(NSValue *)value       比较两个NSValue对象是否相同
    // 为了方便struct和NSValue的装换，cocoa还提供了一下方法
    // 包装成NSValue对象
    // +(NSValue *)valueWithPoint:(NSPoint)point
    // +(NSValue *)valueWithSize:(NSSize)size
    // +(NSValue *)valueWithRect:(NSRect)rect
    // 获取所包装的数据
    // -(NSPoint)pointValue
    // -(NSSize)sizeValue
    // -(NSRect)rectValue
}
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        valueCreate();
        valueUse();
        
    }
    return 0;
}

