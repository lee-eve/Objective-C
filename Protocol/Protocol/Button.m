//
//  Button.m
//  Protocol
//
//  Created by Mac_zzf on 7/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import "Button.h"

@implementation Button

-(void)click {
    
    //如果_delegate实现了onClick:方法
    if ([_delegate respondsToSelector:@selector(onClick:)]) {
        //按钮被点击了，就应该通知监听器,并且告诉监听器哪个按钮被点击了
        [_delegate onClick: self];
    } else {
    
        NSLog(@"监听器并没有实现onClick：方法");
    }
    

}

@end
