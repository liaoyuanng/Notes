//: Playground - noun: a place where people can play

import UIKit

// 函数

// 默认参数值
// 在函数体中通过给参数赋值，来为任意一个参数定义默认值
// 注意，最好把不带有默认值的参数放在函数参数列表的最前
func someFunction(paraWithoutDefault: Int, paraWithDefault: Int = 12) {
    print("\(paraWithoutDefault),\(paraWithDefault)")
}

someFunction(paraWithoutDefault: 2)
someFunction(paraWithoutDefault: 2, paraWithDefault: 10)

// 可变参数
// 一个可变参数可以接受零个或者多个值



