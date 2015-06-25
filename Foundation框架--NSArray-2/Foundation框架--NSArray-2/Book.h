//
//  Book.h
//  Foundation框架--NSArray-2
//
//  Created by Mac_zzf on 13/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Book : NSObject

@property(nonatomic, retain) NSString *name;

+(id)bookWithName:(NSString *)Aname;
@end
