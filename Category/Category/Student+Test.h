//
//  Student+Test.h
//  Category
//
//  Created by Mac_zzf on 6/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import "Student.h"


//()代表着是一个分类
//Test代表是一个分类的名称
@interface Student (Test)

//分类只能扩展方法，不能是成员变量

-(void)test1;

@end
