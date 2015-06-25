//
//  Student.m
//  @class关键字
//
//  Created by Mac_zzf on 5/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import "Student.h"
#import "Book.h"

@implementation Student

-(void)setBook:(Book *)book {

    if (_book != book) {
        
        [_book release];
        _book = [book retain];
    }
}

-(Book *)book {

    return _book;
}
-(void)dealloc {

    //self.book = nil;
    [_book release];
    
    [super dealloc];
}

@end
