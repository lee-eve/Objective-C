//
//  main.m
//  Foundation框架--NSArray-2
//
//  Created by Mac_zzf on 12/4/15.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "Book.h"

#pragma mark - NSArray 派生出新的数组

void arrayNew() {

    //创建一个新数组
    NSArray *array = [NSArray arrayWithObjects:@"1", @"2", nil];
    
    //-(NSArray *)arrayByAddingObject:(id)anObject
    //添加一个元素，返回一个新的NASrray（方法调用者本身没有改变）
    NSArray *array2 = [array arrayByAddingObject:@"3"];
    
    //-(NSArray *)arrayByAddingObjectFromArray:(NSArray *)otherArray
    //添加otherArray的所有元素，返回一个新的NSArray（方法调用者本身没有改变）
    NSArray *array3 = [array arrayByAddingObjectsFromArray:[NSArray arrayWithObjects:@"4", @"5", nil]];
    
    NSLog(@"array: %@", array);
    NSLog(@"array2: %@", array2);
    NSLog(@"array3: %@", array3);
    
    NSArray *array4 = [NSArray arrayWithObjects:@"a",@"b", @"c", nil];
    //-(NSArray *)sunarrayWithRange:(NSRange)range
    //截取range范围的数组元素
    NSRange range = NSMakeRange(1, 2);
    NSArray *array5 = [array4 subarrayWithRange:range];
    NSLog(@"array4: %@", array4);
    NSLog(@"array5: %@", array5);
}

#pragma mark - NSArray 数组其他用法
void arrayOther() {

    NSArray *array = [NSArray arrayWithObjects:@"a",@"b", @"c", nil];
    //-(NSString *)componentsJoinedByString:(NSString *)separator
    //用separator作拼接符将数组元素拼接成一个字符串
    //利用分隔符 - 拼接所有的数组元素
    NSString *str = [array componentsJoinedByString:@"-"];
    NSLog(@"%@",str);
    
    //-(BOOL)writeToFile:(NSString *)path atomically:(BOOL)useAuxiliaryFile
    //将一个NSArray持久化到文件中去
    //将一个数组写入文件（生成的是一个xml文件）
    NSString *path = @"/Users/Mac_zzf/Desktop/NSArray.txt";
    [array writeToFile:path atomically:YES];
    
    path = @"/Users/Mac_zzf/Desktop/NSArray.txt";
    //从文件中读取数组内容， 文件格式有严格的要求
    NSArray *array2 = [NSArray arrayWithContentsOfFile:path];
    NSLog(@"array2: %@", array2);
    
}

#pragma mark - NSArray 数组排序

//一般排序
void arraysort1() {

    NSArray *array = [NSArray arrayWithObjects:@"1",@"3",@"4",@"2", nil];
    //返回一个排好序的数组，原来的数组不会改变
    //-(NSArray *) sortedArrayUsingSelector:(SEL)  指定元素的比较方法compare:
    NSArray *array2 = [array sortedArrayUsingSelector:@selector(compare:)];
    NSLog(@"array2:%@",array2);
}

//指定了比较方法进行排序
void arraysort2() {

    Student *stu1 = [Student studentWithFirstname:@"QiWei" andLastname:@"Li"];
    Student *stu2 = [Student studentWithFirstname:@"Wei" andLastname:@"Qi"];
    Student *stu3 = [Student studentWithFirstname:@"ZhengXie" andLastname:@"Li"];
    Student *stu4 = [Student studentWithFirstname:@"Hui" andLastname:@"Liang"];
    
    NSArray *array = [NSArray arrayWithObjects:stu1,stu2,stu3,stu4, nil];
    NSLog(@"array:%@",array);
    
    //指定比较方法
    NSArray *array2 = [array sortedArrayUsingSelector:@selector(studentCompare:)];
    NSLog(@"array2:%@",array2);
    
}

//利用BLOCK进行排序
void arraysort3() {
    
    Student *stu1 = [Student studentWithFirstname:@"QiWei" andLastname:@"Li"];
    Student *stu2 = [Student studentWithFirstname:@"Wei" andLastname:@"Qi"];
    Student *stu3 = [Student studentWithFirstname:@"ZhengXie" andLastname:@"Li"];
    Student *stu4 = [Student studentWithFirstname:@"Hui" andLastname:@"Liang"];
    
    NSArray *array = [NSArray arrayWithObjects:stu1,stu2,stu3,stu4, nil];
    NSLog(@"array:%@",array);
    
    //利用BLOCK进行排序
     NSArray *array2 = [array sortedArrayUsingComparator:
    ^NSComparisonResult(Student *obj1, Student *obj2) {
        //比较姓
        NSStringCompareOptions result = [obj1.lastname compare:obj2.lastname];
        //如果姓是一样的就比较名
        if (result == NSOrderedSame) {
            result = [obj1.firstname compare:obj2.firstname];
        }
        return result;

    }];
   
    NSLog(@"array2:%@",array2);
    
}


//高级排序
void arraysort4() {
    
    Student *stu1 = [Student studentWithFirstname:@"QiWei" andLastname:@"Li" andBookname:@"book1"];
    Student *stu2 = [Student studentWithFirstname:@"Wei" andLastname:@"Qi" andBookname:@"book2"];
    Student *stu3 = [Student studentWithFirstname:@"ZhengXie" andLastname:@"Li" andBookname:@"book1"];
    Student *stu4 = [Student studentWithFirstname:@"Hui" andLastname:@"Liang" andBookname:@"book2"];
    NSArray *array = [NSArray arrayWithObjects:stu1,stu2,stu3,stu4, nil];
    NSLog(@"array:%@",array);
    
    //先按照书名进行排序
    NSSortDescriptor *BooknameDesc = [NSSortDescriptor sortDescriptorWithKey:@"book.name" ascending:YES];
    //在按照姓进行排序
    NSSortDescriptor *LastnameDesc = [NSSortDescriptor sortDescriptorWithKey:@"lastname" ascending:YES];
    //最后按照名进行排序
    NSSortDescriptor *FirstnameDesc = [NSSortDescriptor sortDescriptorWithKey:@"firstname" ascending:YES];
    
    //按顺序添加排序描述器
    NSArray *desc = [NSArray arrayWithObjects:BooknameDesc, LastnameDesc, FirstnameDesc, nil];
    
    NSArray *array2 = [array sortedArrayUsingDescriptors:desc];
    NSLog(@"array2:%@",array2);
    
    

}
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        //arrayNew();
        //arrayOther();
        arraysort4();
    }
    return 0;
}

