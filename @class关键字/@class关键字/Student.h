//
//  Student.h
//  @class关键字
//
//  Created by Mac_zzf on 5/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "Book.h"
@class Book;

@interface Student : NSObject {

    Book * _book;
}


@property Book *book;

@end
