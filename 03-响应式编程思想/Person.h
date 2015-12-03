//
//  Person.h
//  03-响应式编程思想
//
//  Created by apple on 15/10/18.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    @public
    NSString *_name;
}
/** name */
@property (nonatomic, strong) NSString *name;

@end
