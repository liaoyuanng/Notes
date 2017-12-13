//: Playground - noun: a place where people can play

import UIKit

// 闭包(重点来了)

// 闭包是自包含的函数代码块，可以在代码中倍传递和使用，其实就是 OC 的Block 和 C++ 的 Lamda表达式。


// 闭包表达式的演化
// 1.0
let names = ["Chris","Alex","Ewa","Barry","Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)

// 2.0
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})


