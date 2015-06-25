//
//  Button.h
//  Protocol
//
//  Created by Mac_zzf on 7/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Button;
//代表实现了某个协议
@protocol ButtonDelegate <NSObject>

-(void)onClick: (Button *)btn;

@end

@interface Button : NSObject

//delegate就是按钮的监听器
@property(nonatomic, retain) id<ButtonDelegate>delegate;

-(void)click;

@end
