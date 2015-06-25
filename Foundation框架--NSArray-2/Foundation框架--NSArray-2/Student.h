//
//  Student.h
//  Foundation框架--NSArray-2
//
//  Created by Mac_zzf on 13/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Book;

@interface Student : NSObject

@property(nonatomic, retain) NSString *firstname;
@property(nonatomic, retain) NSString *lastname;
@property(nonatomic, retain) Book *book;

+(id)studentWithFirstname:(NSString *) Afirstname andLastname:(NSString *) Alastname;
+(id)studentWithFirstname:(NSString *)Afirstname andLastname:(NSString *)Alastname andBookname:(NSString *)Abookname;

-(NSStringCompareOptions)studentCompare:(Student *)stu;
@end
