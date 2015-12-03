//
//  ViewController.m
//  03-响应式编程思想
//
//  Created by apple on 15/10/18.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

#import "NSObject+KVO.h"

@interface ViewController ()

/** person */
@property (nonatomic, strong) Person *person;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    /*
     a,b,c
  
     c = a + b
     */
    // isa:去哪个类调用方法
    _person = [[Person alloc] init];
    
    // KVO监听
    // 	NSKVONotifying_Person
    // addObserver底层实现
    // 1.创建一个类NSKVONotifying_Person,Person子类
    // 2.修改当前对象的isa指针指向新创建的类
    // 3.重写NSKVONotifying_Person监听的set方法,setName
    //  * [super setName]
    //  * 通知观察者,告诉改变了name的值
//    [_person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    
    [_person xmg_addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    
    
    // 本质:监听某个对象有没有调用set方法,只要一调用,就会通知观察者调用observeValueForKeyPath
    
}

// 只要一个对象的属性改变就会调用
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    NSLog(@"%@",_person.name);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    static NSInteger i = 0;
    _person.name = [NSString stringWithFormat:@"%ld",i++];
//    _person -> _name = [NSString stringWithFormat:@"%ld",i++];
}


@end
