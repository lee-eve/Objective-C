//
//  Student.m
//  内存管理3-@property参数
//
//  Created by Mac_zzf on 5/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import "Student.h"
#import "Book.h"
#import "Card.h"

@implementation Student

//-(void)setBook:(Book *)book {
//
//    if (_book != book) {
//        
//        [_book release];
//        _book = [book retain];
//    }
//}
//
//-(void)setCard:(Card *)card {
//
//    if (_card != card) {
//        
//        [_card release];
//        _card = [card retain];
//    }
//}

-(void)dealloc {
    
    NSLog(@"student被销毁");

    [_book release];
    [_card release];
    [super dealloc];
}


@end
