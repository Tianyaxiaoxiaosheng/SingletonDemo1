//
//  MitchellTool.h
//  SingletonDemo1
//
//  Created by Jony on 17/3/29.
//  Copyright © 2017年 yavatop. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 作用：可以保证在程序运行过程中，一个类只有个一个实例，而且该实例易于供外界访问。
 规则： 以 share 或者 default 开头，后面跟上类名
 注意：
 
 因为单例只能创建一次，无论是调用 copy 方法，还是 mutableCopy 方法都要返回自己，所以要重写 copy 和mutableCopy 方法。MRC 中的retain、retainCount 还有 release 方法也需要重写。
 单例不可以继承，继承会引发问题。
 先创建子类，那么单例的类型就永远都是子类。
 先创建父类，那么单例的类型就永远都是父类。

 */
//@interface MitchellTool : NSObject<NSCopying,NSMutableCopying> //为了重写copy
@interface MitchellTool : NSObject
@property(nonatomic,strong) NSString *name;
+(instancetype)defaultManager;

//+ (instancetype)shareTools;

@end
