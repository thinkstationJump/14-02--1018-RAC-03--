//
//  XMGKVONotifying_Person.m
//  03-响应式编程思想
//
//  Created by apple on 15/10/18.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import "XMGKVONotifying_Person.h"

#import <objc/runtime.h>

extern char * const nameKey;

@implementation XMGKVONotifying_Person
- (void)setName:(NSString *)name
{
    [super setName:name];
    
    // 通知观察者调用observeValueForKeyPath
   id observe = objc_getAssociatedObject(self, nameKey);
    
    [observe observeValueForKeyPath:@"name" ofObject:self change:nil context:nil];
}
@end
