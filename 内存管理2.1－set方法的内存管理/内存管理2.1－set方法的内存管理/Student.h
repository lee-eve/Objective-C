//
//  Student.h
//  内存管理2.1－set方法的内存管理
//
//  Created by Mac_zzf on 5/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"
@interface Student : NSObject {
    
    Book *_book;
    
}

@property int age;

@property Book *book;

-(id)initWithAge:(int)age;
-(void)readBook;

@end
