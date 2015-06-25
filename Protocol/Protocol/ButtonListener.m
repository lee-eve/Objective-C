//
//  ButtonListener.m
//  Protocol
//
//  Created by Mac_zzf on 7/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import "ButtonListener.h"
#import "Button.h"

@implementation ButtonListener

-(void)onClick {

    NSLog(@"ButtonListener已经监听到按钮被点击了");
}

-(void)onClick:(Button *)btn {

    NSLog(@"ButtonListener已经监听到-%@按钮被点击了",btn);
}
@end
