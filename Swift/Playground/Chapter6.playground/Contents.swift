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
// 一个可变参数可以接受零个或者多个值 形式和 C 语言一样,但是使用起来方便了很多
// Tips： 一个函数最多只能拥有一个可变参数
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
         total += number
    }
    print(total)
    return total
}

arithmeticMean(1,2,3,4,5,6,4,44,4,4)

func compontsJoin(_ componts: String...) -> String {
    var result: String = ""
    for compont in componts {
        result += compont
    }
    print(result)
    return result
}

compontsJoin("Hello","World","Are u ok")

// 输入输出参数

// 函数参数默认是常量(let)，所以，我们没办法去修改其值，否则会导致编译错误
// 使用关键字 inout 来修改传入的参数

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let tempA = a
    a = b
    b = tempA
}

var a = 12
var b = 11

swapTwoInts(&a, &b)

print("a: \(a), b: \(b)")

// 嵌套函数
// 定义在别的函数体中的函数，叫做嵌套函数


