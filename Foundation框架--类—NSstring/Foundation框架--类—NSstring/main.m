//
//  main.m
//  Foundation框架--类—NSstring
//
//  Created by Mac_zzf on 7/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - NSString的创建

void stringCrete() {

    //char *s = "A String";  c语言中的字符串
    //这种方式创建出来的字符串是不需要释放内存的
    NSString *str = @"A String";
    NSLog(@"%@",str);
    
    //正常创建的string对象
    NSString *str1 = [[NSString alloc] init];
    str1 = @"A String";
    NSLog(@"%@", str1);
    
    //传入一串字符串
    NSString *str2 = [[NSString alloc] initWithString:str];
    NSLog(@"%@",str2);
    //把c语言的字符串转化为OC的
    NSString *str3 = [[NSString alloc] initWithUTF8String:"A String!"];
    NSLog(@"%@",str3);
    //传入多个参数
    NSString *str4 = [[NSString alloc] initWithFormat:@"My age is %i years old and heigth is %.2f cm", 19, 1.75f];
    NSLog(@"%@",str4);
    
    str4 = [NSString stringWithFormat:@"My gf age is %i years old and heigth is %.2f cm",18, 1.65f];
    NSLog(@"%@",str4);
    
}

void stringCreate2() {

    //从文本中读取文本
    NSString *path = @"/Users/Mac_zzf/Desktop/string.txt";
    
    //定义一个NSError变量
    NSError * error;
    //指定字符串编码为UTF-8： NSUTF8StringEncoding
    NSString *str1 = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    if (error == nil) {
        NSLog(@"读取文件成功：%@",str1);
    } else {
        NSLog(@"读取文件失败: %@",error);
    }
    //NSLog(@"%@",str1);
    

}

#pragma mark - NSString 读取文件
void readFile() {

    //读取本地文件，路径：file:///Users/Mac_zzf/Desktop/string.txt
    NSURL *url = [NSURL URLWithString:@"file:///Users/Mac_zzf/Desktop/string.txt"];
    NSString *str2 = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@",str2);
    
    //读取外网文件 url
    NSURL *url2 = [NSURL URLWithString:@"http://www.baidu.com"];
    NSString *str3 = [NSString stringWithContentsOfURL:url2 encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@",str3);
}

#pragma mark - NSString 文件的导入
void stringExport() {

    NSString *str = @"123456我爱你！";
    // 如果文件不存在，会自动创建文件
    // NSString *path = @"/Users/Mac_zzf/Desktop/abc.txt"
    // 如果文件夹布存在，会直接报错
    // NSString *path = @"/Users/Mac_zzf/abc/string.txt"
    NSString *path =@"/Users/Mac_zzf/Desktop/string.txt";
    NSError *error;
    // 编码指定错误也会报错
    // YES 代表要进行原子性操作，也就是会创建一个中间的临时文件
    [str writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:&error];
    if (error) {
        // [error localizeDescription] 会返回主要的错误信息
        NSLog(@"写入失败-%@",[error localizedDescription]);
    } else {
    
        NSLog(@"写入成功");
    }
}

#pragma mark - NSString 大小写转换
void caseTest() {

    NSString *str = @"GuangDong";
    //转大写 -（NSString *）uppercaseString 方法
    NSLog(@"大写：%@",[str uppercaseString]);
    //转小写 -（NSString *）lowercaseString 方法
    NSLog(@"小写：%@",[str lowercaseString]);
    //首字母大写，其他字母都变小写 -（NSString *）capitalizedString
    NSString *str1 = @"guangzhou";
    NSLog(@"首字母大写：%@",[str1 capitalizedString]);
    
    NSLog(@"首字母大写：%@",[@"aGE" capitalizedString]);
    
}

#pragma mark - NSString 字符串比较


void compare() {
    
    //-(BOOL)isEqualToString :(NSString *)aString  比较两个字符串的内容是否相同，相同就返回YES，否则返回NO
    //检测两个字符串的内容否相同
    BOOL result = [@"abc" isEqualToString:@"ABC"];
    NSLog(@"%i", result);
    
    //-(NSComparisonResult)compare:(NSString *)string  逐个字符进行比较，返回NSComparisonResult来显示结果。NSComparisonResult是一个枚举，有3个值： NSOrderedAscending = -1L NSOrderedSame NSOrderedDescending
    //NSOrderedAscending 右边的字符串比左边大    升序
    //NSOrderedSame   两个字符串相同
    //NSOrderedDescending 左边的字符串比右边的大    降序
    NSComparisonResult result2 = [@"abc" compare: @"aac"];
    if (result2 == NSOrderedSame) {
        NSLog(@"两个字符串的内容相同");
    } else if (result2 == NSOrderedAscending) {
        NSLog(@"右边 > 左边");
    } else if (result2 == NSOrderedDescending) {
        NSLog(@"右边 < 左边");
    }
    
    //-(NSComparisonResult)caseInsensitiveCompare: (NSString *)string  忽略大小写进行比较，返回值与compare一致
}

#pragma mark - NSString 字符串的搜索
void search() {

    NSString *str = @"123456456.txt";
    //-(BOOL)hasPrefix : (NSString *)aString   是否以aString开头
    NSLog(@"是否以1，2开头： %i", [str hasPrefix:@"12"]);
    
    //-(BOOL)hasSuffix: (NSString *)aString     是否以aString结尾
    NSLog(@"是否以txt结尾： %i",[str hasSuffix:str]);
    
    //-(NSRange)rangeOfString: (NSString *)aString  检查是否包含了aString，如果包含，就返回aString的位置，如果不包含，NSRange的location为-1，length为0
    NSRange range = [str rangeOfString:@"345"];
    if (range.location == NSNotFound) {
        NSLog(@"不能找到");
    } else {
    
        NSLog(@"找到的范围是：%@", NSStringFromRange(range));
    }
    //-(NSRange)rangeOfString: (NSString *)aString options: (NSStringCompareOptions)mask  可以传递一个mask参数，改变搜索方式
    //比如NSStringCompareOptions为SBackwardsSearch表示从尾部开始搜索
    
    range = [str rangeOfString:@"456" options:NSBackwardsSearch];
    NSLog(@"%@", NSStringFromRange(range));
    
    //-(NSRange)rangeOfString:(NSString *)aString options:(NSStringCompareOptions)mask range:(NSRange)searchRange   还可以用searchRange指定搜索范围
    NSRange range1 = NSMakeRange(6, 2);
    range = [str rangeOfString:@"45" options:NSBackwardsSearch range:range1];
    NSLog(@"%@", NSStringFromRange(range));
    
}

#pragma mark - NSString 字符串的截取
void subString() {

    NSString *str = @"123456";
    //- (NSString *)substringFromIndex: (NSUInteger)from   从位置from位置（包括指定位置的字符）到尾部
    NSLog(@"%@",[str substringFromIndex:3]);
    
    //-(NSString *)substringToIndex: (NSUInteger)to     从字符串的开头一直截取到指定的位置to，但不包括该位置的字符串
    NSLog(@"%@",[str substringToIndex:3]);
    
    //-(NSString *)substringWithRange:(NSRange)range    按照所给出的NSString从字符串中截取子串
    NSRange range = NSMakeRange(4, 2);
    NSLog(@"%@",[str substringWithRange:range]);
    
    //-(NSString *)componentsSeparatedByString：（NSString *）separator    用separator为分隔符截取子串，返回一个装着所有子串的集合NSArray
    NSString *str2 = @"1,2,3,4,5";
    NSArray *array = [str2 componentsSeparatedByString:@","];
    NSLog(@"%@",array);
    
    NSLog(@"%@",[array objectAtIndex:0]);
}

#pragma mark - NSString 与路径相关的

void pathString() {

    //+ (NSString *)pathWithComponents:(NSArray *)components    将components中的字符串按顺序拼成一个路径
    //快速创建一个自动释放的数组
    NSMutableArray *components = [NSMutableArray array];
    [components addObject:@"Users"];
    [components addObject:@"Lee"];
    [components addObject:@"Desktop"];
    //将数值中的所有字符串拼接成一个路径
    NSString *path = [NSString pathWithComponents:components];
    NSLog(@"%@",path);
    
    //-(NSString *)pathComponents   将一个路径分解成一个装着一个目录的NSArray
    NSString *cmps = [path pathComponents];
    NSLog(@"%@",cmps);
    
    //-（BOOL）isAbsolutePath     是否为绝对路径
    
    path = @"/user/Lee/test";
    NSLog(@"%i", [path isAbsolutePath]);

    //-(NSString *)lastPathComponent    获取最后一个目录
    NSLog(@"最后一个目录：%@", [path lastPathComponent]);
    //-(NSString *)stringByDeletingLastPathComponent    删除最后一个目录
    NSLog(@"%@", [path stringByDeletingLastPathComponent]);
    //-(NSString *)stringByAppendingPathComponent:(NSString *)str   在路径的后面拼接一个目录
    NSLog(@"%@", [path stringByAppendingPathComponent:@"abc"]);
}

#pragma mark - NSString 扩展名--后缀
void extension() {

    NSString *str = @"/User/Lee/test.txt";
    //-(NSString *) pathExtension      获取扩展名
    NSLog(@"拓展名：%@",[str pathExtension]);
    
    //-（NSString *）stringByDeletingPathExtension   删除尾部的扩展名
    NSLog(@"%@", [str stringByDeletingPathExtension]);
    
    //-（NSString *）stringByAppendingPathExthension      在尾部添加一个拓展名
    NSLog(@"%@",[@"abc" stringByAppendingPathExtension:@"mp3"]);
}

#pragma mark - 其他用法
void other() {

    NSString *str = @"abc";
    int a = [str intValue];
    NSLog(@"%i", a);
    //-(NSUInteger) length     返回字符串的长度（字符个数）
    NSLog(@"length=%zi", [@"我是字符串" length]);
    //-(unichar)characterAtIndex:(NSUInteger)index      返回index位置对应的字符
    //返回对应的字符
    unichar c = [@"abc" characterAtIndex:0];
    NSLog(@"%c",c);
    //-（char *）UTF8String   转化为c语言中的字符串
    //类似的还有： -(double)doubleValue、-（float）floatValue、-（int）intValue
    const char *s = [@"abc" UTF8String];
    NSLog(@"%s",s);
}

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        //stringCrete();
        //stringCreate2();
        //stringExport();
        //caseTest();
        //compare();
        //search();
        //pathString();
        //extension();
        other();
    }
    return 0;
}
