//
//  Study.h
//  Protocol_Block补充
//
//  Created by Mac_zzf on 7/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Study <NSObject>


//@required表示必须实现的方法
@required
-(void)test;
-(void)test1;

//表示可实现也可以不实现
@optional
-(void)test2;

@end
