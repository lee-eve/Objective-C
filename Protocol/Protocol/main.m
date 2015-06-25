//
//  main.m
//  Protocol
//
//  Created by Mac_zzf on 7/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Button.h"
#import "ButtonListener.h"
#import "MyListener.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        //NSLog(@"Hello, World!");
        //初始化一个按钮
        Button *button = [[Button alloc] init];
        
        //初始化一个按钮的监听器
        ButtonListener *listener = [[ButtonListener alloc] init];
        
        //设置按钮的监听器
        button.delegate = listener;
    
        //点击按钮
        [button click];
        Button *button1 = [[Button alloc] init];
        MyListener *listener1 = [[MyListener alloc] init];
        button1.delegate = listener1;
        [button1 click];
    }
    return 0;
}

