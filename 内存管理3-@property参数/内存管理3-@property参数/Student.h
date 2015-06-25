//
//  Student.h
//  内存管理3-@property参数
//
//  Created by Mac_zzf on 5/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Book;
@class Card;

@interface Student : NSObject

//这里的retain 代表： release旧值，retain新值
@property(nonatomic, retain) Book *book;
@property(retain) Card *card;

//readonly代表只生成get方法的声明
//默认是readwrite，生成get方法和set方法
@property(readonly) int age;

//atomic代表给方法进行加锁，保证线程安全。
@property(atomic) int no;
//nonatomic代表部需要加锁，不需要考虑线程安全问题


//getter是用来指定get方法的方法名
@property(nonatomic, getter = isRich) BOOL rich;

@end
