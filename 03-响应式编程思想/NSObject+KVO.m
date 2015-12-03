//
//  NSObject+KVO.m
//  03-响应式编程思想
//
//  Created by apple on 15/10/18.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import "NSObject+KVO.h"

#import "XMGKVONotifying_Person.h"

#import <objc/runtime.h>

char * const nameKey = "name";

@implementation NSObject (KVO)
- (void)xmg_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context
{
    // 1.修改当前对象的isa
    // obj:修改哪个对象
    // Class:把isa指针指向哪个类
    object_setClass(self,[XMGKVONotifying_Person class]);
    
    // 2.把观察者保存到对象中
    // 动态给一个对象添加属性
    // 动态添加一个管理
    // object:给哪个对象产生关联
    // key:属性名,以后就可以根据这个key取获取这个关联值
    // value:保存的值
    objc_setAssociatedObject(self, nameKey, observer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    
}
@end
