//: Playground - noun: a place where people can play

import UIKit

// 闭包(重点来了)

// 闭包是自包含的函数代码块，可以在代码中倍传递和使用，其实就是 OC 的Block 和 C++ 的 Lamda表达式。


// 闭包表达式的演化
// 1.0
// 使用普通的函数作为参数传入
let names = ["Chris","Alex","Ewa","Barry","Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)

// 2.0
// 使用闭包表达式
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

// 3.0
// 由于 Swift 可以自动类型推断的，而且调用 sorted(ny:)方法是一个字符串数组，所以其参数必须是(String, String) ->  Bool 类型的函数。
reversedNames = names.sorted(by: {s1, s2 in return s1 > s2})

// 4.0
// 单行表达式比表可以忽略 return 关键字，来隐式返回单行表达式的结果。
reversedNames = names.sorted(by: {s1, s2 in s1 > s2})

// 5.0
// Swift 自动为内联闭包提供了参数名称缩写，可以通过 $0,$1,$2...来顺序调用闭包的参数。参数名称缩写的类型会通过函数类型进行推断。
reversedNames = names.sorted(by: {$0 > $1})

// 6.0
// Swift 的 String 类型定义了关于大于号(>)的字符串实现。
// 其作为一个函数接受两个 String 类型的参数并返回 Bool 类型的值
reversedNames = names.sorted(by: >)

// 尾随闭包
reversedNames = names.sorted(){$0 > $1}

let digitNames = [0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four",5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"]
let numbers = [16, 58, 510];
let strings = numbers.map {
    (number) -> String in
    print(number)
    var number = number
    var output = ""
    repeat {
    output = digitNames[number % 10]! + output
    number /= 10
    } while number > 0
    print(output)
    return output
}

// 值捕获

func makeIncrementer(forIncrement amount: Int) -> ()->Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount // 这里访问了外部函数的变量 runningTotal 和 amount
        return runningTotal
    }
    return incrementer
}
// incrementByTen 的类型是 ()->Int
let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
incrementByTen()
incrementByTen()

// 如果创建了另一个 incrementor ，它会有属于自己的引用。
let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven

// 闭包是引用类型。
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen

// 逃逸闭包
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping() -> Void) {
    completionHandlers.append(completionHandler) // 函数没有立即执行，而是被加在了数组中。等待执行
}

// 如果你使用了逃逸闭包，则你必须在闭包中显示地引用 self
func someFunctionWithNonescapingClosure(closure:() -> Void) {
    closure() // 不使用逃逸闭包，这里是立即调用的
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithNonescapingClosure {
            x = 200
        }
        
        someFunctionWithEscapingClosure {
            // x = 200 这样写就会编译错误。必须要使用 self
            self.x = 200
        }
    }
}

// 自动闭包
// 自动闭包能够让我们省略闭包的花括号，用一个普通的表达式来代替显示的闭包。增强代码的可读性
// 它不接受任何参数，所以，只能用于 ()->T 类型的闭包

// 未使用自动闭包
var customersinLine = ["Chris","Alex","Ewa","Barry","Daniella"]
let customerProvider = {customersinLine.remove(at: 0)} // 这里的代码不会立即执行，直到有人调用他
func serve(customer customerProvider: ()->String) {
    print("Now serving \(customerProvider())")
}
serve(customer: {customersinLine.remove(at: 0)})

// 使用自动闭包

func serve2(customer customerProvider: @autoclosure ()->String) {
    print("Now serving \(customerProvider())")
}
serve2(customer: customersinLine.remove(at: 0)) // 比上面少了大括号，可读性更强

// 枚举的 可递归性 和 值关联

indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
}

let sum = ArithmeticExpression.addition(ArithmeticExpression.number(5), ArithmeticExpression.number(6))
switch sum {
    case .number
    print(sum)
    case let .addition(left, right)
    print(left + right)
}

