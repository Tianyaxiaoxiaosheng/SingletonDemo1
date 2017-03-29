//
//  MitchellTool.m
//  SingletonDemo1
//
//  Created by Jony on 17/3/29.
//  Copyright © 2017年 yavatop. All rights reserved.
//

#import "MitchellTool.h"


@implementation MitchellTool

//#pragma mark ---------------------ARC---------------------
//+ (instancetype)shareTools
//{
//    return [[self alloc] init];
//}
//
//+ (instancetype)allocWithZone:(struct _NSZone *)zone
//{
//    static id instance;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        instance = [super allocWithZone:<#zone#>];
//    });
//    return instance;
//}
//
//-(id)copyWithZone:(NSZone *)zone
//{
//    return self;
//}
//-(id)mutableCopyWithZone:(NSZone *)zone
//{
//    return self;
//}
//
//#pragma mark ------------------ MRC ------------------
///* 返回一个特殊数告诉别人这是一个单例 */
//-(NSUInteger)retainCount{
//    return -1;
//}
///* 重写retain之后，重写retain返回自己 */
//-(instancetype)retain{
//    return self;
//}
//-(oneway void)release{
//}
/******************************************************************/
//单例类的静态实例对象，因对象需要唯一性，故只能是static类型
static MitchellTool *defaultManager = nil;
/**单例模式对外的唯一接口，用到的dispatch_once函数在一个应用程序内只会执行一次，且dispatch_once能确保线程安全
 */
+(instancetype)defaultManager
{
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        if (defaultManager == nil) {
            defaultManager = [[self alloc] init];
        }
    });
    return defaultManager;
}
/**覆盖该方法主要确保当用户通过[[Singleton alloc] init]创建对象时对象的唯一性，alloc方法会调用该方法，只不过zone参数默认为nil，因该类覆盖了allocWithZone方法，所以只能通过其父类分配内存，即[super allocWithZone:zone]
*/
+ (id)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        if (defaultManager == nil) {
            defaultManager = [super allocWithZone:zone];
        }
    });
    return defaultManager;
}
//自定义初始化方法，本例中只有name这一属性
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"Singleton";
    }
    return self;
}
//覆盖该方法主要确保当用户通过copy方法产生对象时对象的唯一性
-(id)copy
{
    return self;
}
//覆盖该方法主要确保当用户通过mutableCopy方法产生对象时对象的唯一性
-(id)mutableCopy
{
    return self;
}
//自定义描述信息，用于log详细打印
- (NSString *)description
{
    return [NSString stringWithFormat:@"memeory address:%p,property name:%@",self,self.name];
}

@end
