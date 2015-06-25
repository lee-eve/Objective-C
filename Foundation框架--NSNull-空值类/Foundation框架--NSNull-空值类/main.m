//
//  main.m
//  Foundation框架--NSNull-空值类
//
//  Created by Mac_zzf on 18/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - NSNull -- 空值类
/*
 * 集合中是不能存放nil值的，因为nil在集合中有特殊的含义（结束符），但有时确
 * 实需要存储一个表示“什么都没有”的值，那么就可以使用NSNull，它也是NSOject
 * 的一个子类
 *
 */

#pragma mark 创建和获取NSNull的方法

void createNull() {

    // + (NSNull *)null     [NSNull null]总是返回一样的值，可以用==将该值与其他值进行比较
    // [NSNull null] 返回的时同一个单例对象，也就是说同一个nill
    NSNull *n = [NSNull null];
    NSNull *n1 = [NSNull null];
    NSNull *n2 = [NSNull null];
    NSNull *n3 = [NSNull null];
    
    NSLog(@"%i", n == n1);
    
    // 在json格式中如果存在nill值，oc将会直接忽略它，
    // {"id":10, "name":"Lee", "desc":nill} <==> {"id":10, "name":"Lee"}
    
}
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        createNull();
        
    }
    return 0;
}

