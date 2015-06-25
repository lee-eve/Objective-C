//
//  main.m
//  Foundation框架--NSDate日期类
//
//  Created by Mac_zzf on 18/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - NSDate时间日期类

#pragma mark NSDate初始化创建
void createDate() {

    // NSDate 的静态方法初始化
    // 注意：在OC中TimeInterval单位是秒，并不是毫秒
    // +(id)date    返回当前时间
    NSDate *date = [NSDate date];
    NSLog(@"%@",date);
    
    // +(id)dateWithTimeIntervalSinceNow:(NSTimeInterval)secs   返回以当前时间为基准，经过了secs秒的时间
    date = [NSDate dateWithTimeIntervalSinceNow:10];
    NSLog(@"%@",date);
    
    // +(id)dateWithTimeIntervalSinceReferenceDate:(NSTimeInterval)secs     返回以2001/01/01 GMT为基准，然后过了secs秒的时间
    date = [NSDate dateWithTimeIntervalSinceReferenceDate:10];
    NSLog(@"%@",date);
    
    // +(id)dateWithTimeIntervalSince1970:(NSTimeInterval)secs      返回以1970/01/01 GMT为基准，然后过了secs秒的时间
    date = [NSDate dateWithTimeIntervalSince1970:10];
    NSLog(@"%@",date);
    
    // +(id)distantFuture       返回很多年以后的未来的某一天（随机）
    date = [NSDate distantFuture];
    NSLog(@"%@",date);
    
    // +(id)distantPast         返回很多年以前的某一天
    date = [NSDate distantPast];
    NSLog(@"%@",date);
    
    
    // NSDate的动态方法初始化
    // -(id)addTimeInterval:(NSTimeInterval)secs    返回以目前的实例中保存的时间为基准，然后过了secs秒的时间
    // -(id)init 初始化为当前时间，[NSDate date]
    // -(id)initWithTimeIntervalSinceReferenceDate:(NSTimeInterval)secs     初始化为以2011/01/01 GMT为基准，然后经过secs秒的时间
    // -(id)inteWithTimeIntervalSinceNow:(NSTimeInterval)secs   初始化为以当前时间为基准，然后经过secs秒的时间
    
}

#pragma mark NSDate--取回时间间隔
void dateUse() {
    
    NSDate *date = [NSDate date];
    // -(NSTimeInterval)timeIntervalSinceDate:(NSDate *)refDate     以refDate为基准时间，返回实例保存的时间与refDate的时间间隔
    NSDate *date1 = [NSDate dateWithTimeIntervalSinceNow:10];
    NSTimeInterval interval = [date1  timeIntervalSinceDate:date];
    NSLog(@"%f", interval);
    
    // -(NSTimeInterval)timeIntervalSinceNow    以当前时间（NOW）为基准时间，返回实例保存的时间与当前时间Now的时间间隔
    NSTimeInterval interval1 = [date1 timeIntervalSinceNow];
    NSLog(@"%f", interval1);
    
    // -(NSTimeInterval)timeIntervalSince1970   以1970/01/01 GMT为基准时间，返回实例保存的时间与1970/01/01 GMT的时间间隔
    NSTimeInterval interval2 = [date timeIntervalSince1970];
    NSLog(@"%f", interval2);
    
    // -(NSTimeInterval)timeIntervakSinceReferenceDate      以2001/01/01 GMT为基准时间，返回实例保存的时间与2001/01/01 GMT的时间间隔
    NSTimeInterval interval3 = [date timeIntervalSinceReferenceDate];
    NSLog(@"%f", interval3);
    
    // +(NSTimeInterval)timeIntervalSinceReferenceDate      以2001/01/01 GMT为基准时间，返回实例保存的时间与2001/01/01 GMT的时间间隔

}

#pragma mark NSDate--日期比较
void dateUse1() {

    NSDate *date = [NSDate date];
    NSDate *date1 = [NSDate date];
    NSDate *date2 = [NSDate dateWithTimeIntervalSinceNow:10];
    // -(BOOL)isEqualToDate:(NSDate *)otherDate     与otherDate比较，相同则返回YES
    if ([date isEqualToDate:date1]) {
        
        NSLog(@"date与date1的时间相同");
    } else {
    
        NSLog(@"date与date1的时间不同");
    }
    
    // -(NSDate *)earlierDate:(NSDate *)anotherDate     与anotherDate比较，返回较早的那个日期
    NSLog(@"%@",[date1 earlierDate:date2]);
    
    // -(NSDate *)laterDate:(NSDate *)anothreDate       与anotherDate比较，返回较晚的那个日期
    NSLog(@"%@", [date1 laterDate:date2]);
    
    // -(NSComparisonResult)compare:(NSDate *)other     该方法用于排序时调用：1.当实例保存的时间与anotherDate相同则返回NSOtherSame；2.当实例保存的时间晚于anotherDate则返回NSOtherDescending；3.当实例保存的时间早于anotherDate则返回NSOtherAscending。
}

#pragma mark NSDate--日期格式化
void dateUse2() {
    
    NSDate *date = [NSDate date];
    // 规定日期格式，HH是24进制，hh是12进制
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    // 将NSStirng 转换为NSDate
    NSLog(@"%@",[formatter dateFromString:@"2010-03-24 00:00:00"]);
    // 将NSDate转换为NSString
    NSLog(@"%@",[formatter stringFromDate:date]);
}
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // createDate();
        dateUse2();
    }
    return 0;
}

