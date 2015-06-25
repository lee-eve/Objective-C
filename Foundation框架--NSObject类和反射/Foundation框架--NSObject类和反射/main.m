//
//  main.m
//  Foundation框架--NSObject类和反射
//
//  Created by Mac_zzf on 19/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"

#pragma mark - NSObject类

void objectuse() {

    id stu = [[Student alloc] init];
    
    // NSObject类常用方法
    // -(BOOL)isKindOfClass:(Class)aClass   判断是否为aClass或者aClass的子类的实例
    if ([stu isKindOfClass:[Person class]]) {
        NSLog(@"stu属于Person或者继承自Person");
    }
    
    // -(BOOL)isMemberOfClass:(Class)aClass     判断是否为aClass的实例（不包括aClass的子类）
    BOOL result = [stu isMemberOfClass:[Student class]];
    NSLog(@"%i", result);
    BOOL result1 = [stu isMemberOfClass:[Person class]];
    NSLog(@"%i", result1);
    
    // -(BOOL)conformsToProtocol:(Protocol)aProtocol    判断对象是否实现了aProtocol协议
    
    // +(BOOL)instancesRespondToSelector:(SEL)aSelector     判断这个类的对象是否拥有参数提供的方法
    
    // -(BOOL)respondisToSelector:(SEL)aSelector    判断对象是否拥有参数提供的方法
    
    // -(void)performSelector:(SEL)aSelector withObject:(id)anArgument afterDelay:(NSTimeInterval)delay     延迟调用参数提供的方法，方法所需参数用withObject传入
}

#pragma mark - 反射

void reflect() {

    // Class的反射
    // 通过类名的字符串形式实例化对象
    Class class = NSClassFromString(@"Student");
    Student *stu = [[class alloc] init];
    NSLog(@"%@",stu);
    // 将类名变成字符串
    Class class1 = [Student class];
    NSString *className = NSStringFromClass(class1);
    NSLog(@"%@",className);
    // SEL的反射
    // 通过方法字符串形式实例化方法
    SEL selector = NSSelectorFromString(@"setName:");
    [stu performSelector:selector withObject:@"Lee"];
    NSLog(@"%@", stu.name);
    //NSLog(@"%@", [stu performSelector:selector withObject:@"Lee"]);
    // 将方法变成字符串
    NSStringFromSelector(@selector(setName:));
    
}

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // objectuse();
        reflect();
    }
    return 0;
}

