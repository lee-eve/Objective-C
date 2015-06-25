//
//  Book.m
//  Foundation框架--NSArray-2
//
//  Created by Mac_zzf on 13/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import "Book.h"

@implementation Book

+(id)bookWithName:(NSString *)Aname {
    
    Book *book = [[[Book alloc] init] autorelease];
    book.name = Aname;
    //return self;       error是因为，返回调用它的对象而没有返回book么？
    return book;
    
}

-(void)dealloc {

    [_name release];
    [super dealloc];
}

@end
