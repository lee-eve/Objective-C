//
//  Student.h
//  Foundation框架--Copy语法
//
//  Created by Mac_zzf on 27/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

// copy代表set方法会release旧对象，copy新对象
// 修改外面的变量，并不会影响内部的成员变量
// NSString 一般用copy，其他对象用retain
@property(nonatomic, copy)NSString *name;

@end
