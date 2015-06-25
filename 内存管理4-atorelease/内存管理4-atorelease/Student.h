//
//  Student.h
//  内存管理4-atorelease
//
//  Created by Mac_zzf on 5/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

@property(nonatomic, assign) int age;

+(id)age;
+(id)studentWithAge:(int)age;

@end
