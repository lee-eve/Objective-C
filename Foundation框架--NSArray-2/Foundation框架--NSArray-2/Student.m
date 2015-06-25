//
//  Student.m
//  Foundation框架--NSArray-2
//
//  Created by Mac_zzf on 13/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import "Student.h"
#import "Book.h"
@implementation Student

+(id)studentWithFirstname:(NSString *)Afirstname andLastname:(NSString *)Alastname {

    Student *stu = [[[Student alloc] init] autorelease];
    stu.firstname = Afirstname;
    stu.lastname = Alastname;
    return stu;
}

+(id)studentWithFirstname:(NSString *)Afirstname andLastname:(NSString *)Alastname andBookname:(NSString *)Abookname {
    
//    Student *stu = [[[Student alloc] init] autorelease];
//    stu.firstname = Afirstname;
//    stu.lastname = Alastname;
    Student *stu = [Student studentWithFirstname:Afirstname andLastname:Alastname];
    stu.book = [Book bookWithName:Abookname];
    return stu;
    
}

-(NSStringCompareOptions)studentCompare:(Student *)stu {

    //比较姓
    NSStringCompareOptions result = [self.lastname compare:stu.lastname];
    //如果姓是一样的就比较名
    if (result == NSOrderedSame) {
        result = [self.firstname compare:stu.firstname];
    }
    return result;
}

-(NSString *)description {
			
    return [NSString stringWithFormat:@"[%@ %@-%@]", self.lastname, self.firstname, self.book.name];
}

-(void)dealloc {

    [_firstname release];
    [_lastname release];
    [_book release];
    [super dealloc];
}

@end
