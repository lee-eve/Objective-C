//
//  Student.h
//  Foundation框架--NSDictionary
//
//  Created by Mac_zzf on 17/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
@property (nonatomic, retain) NSString *name;

+(id)studentWithName:(NSString *)aName;

@end
