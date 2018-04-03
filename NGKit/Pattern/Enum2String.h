//
//  Enum2String.h
//  TCBusiness_IPhone
//
//  Created by NagiYan on 2018/4/3.
//  Copyright © 2018年 xxj14058. All rights reserved.
//

#ifndef Enum2String_h
#define Enum2String_h

// 枚举定义展开 1-1
#define ENUM_VALUE(name, assign) name assign,

// 枚举转字符串case展开 2-1
#define ENUM_CASE(name, assign) case name: return @#name;

// 字符串转枚举展开 2-1
#define ENUM_STRCMP(name, assign) if ([string isEqualToString:@#name]) return name;

// 枚举字符串互转函数展开 2
#define DEFINE_ENUM(EnumType, ENUM_DEF) \
NSString *NSStringFrom##EnumType(EnumType value) \
{ \
    switch(value) \
    { \
        ENUM_DEF(ENUM_CASE) \
        default: return @""; \
    } \
} \
EnumType EnumType##FromNSString(NSString *string) \
{ \
    ENUM_DEF(ENUM_STRCMP) \
    return (EnumType)0; \
}

// 枚举声明定义宏
#define DECLARE_ENUM(EnumType, ENUM_DEF) \
typedef NS_ENUM(NSInteger, EnumType) { \
    ENUM_DEF(ENUM_VALUE) \
}; \
NSString *NSStringFrom##EnumType(EnumType value); \
EnumType EnumType##FromNSString(NSString *string); \

/*example
 // step 1 .h 行程卡片类型枚举
 #define SCHEDULE_TYPE(__x) \
 __x(ScheduleTypeFlight, ) \
 __x(ScheduleTypeSpecial, ) \
 __x(ScheduleTypeSpecialTime, ) \
 
 // step 2 .h 声明
 DECLARE_ENUM(ScheduleType, SCHEDULE_TYPE)
 
 // step 3 .m
 DEFINE_ENUM(ScheduleType, SCHEDULE_TYPE)
 
 // 自动生成函数 枚举转字符串
 //NSString *NSStringFromScheduleType(ScheduleType value);
 // 自动生成函数 字符串转枚举
 //EnumType ScheduleTypeFromNSString(NSString *string);
 */

#endif /* Enum2String_h */
