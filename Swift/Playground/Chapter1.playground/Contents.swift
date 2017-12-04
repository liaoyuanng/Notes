//: Playground - noun: a place where people can play

import UIKit

// Chapter 1

// 各种进制的表示
let decimalInt = 17
let binaryInt = 0b10001
let octalInt = 0o21
let hexInt = 0x11

// 指数 十进制的指数，是以 10 为底数
let exp1 = 1.25e2
let exp2 = 1.25e-2

// 十六进制的指数运算，是以 2 为底数
let exp3 = 0x123p2
let exp4 = 0x123p-2

// 类型强转
let twoThousand: UInt16 = 2_000 // Swift 中，为了数字能更友好的被阅读，可以用 _ 分割。
let one: UInt8 = 1
let towThousandAndOne = twoThousand + UInt16(one)

// 布尔值
// Swift 有一个基本的布尔(Boolean) 类型，叫做 Bool.  只能是 true 或者 false
// 而对于 OC 来说(准确来说应该是 C99 之前的C 语言)来说是没有这个类型的，我们用的
// BOOL 只是 int 的 type define

let trueValue = true
let falseValue = false

// 所以，对于 if 语句，我们不能再想 OC 一样，使用返回值为 int 的方法来做判断。
// 而必须是 Boolean 的类型。也就是说 if 1 {} 不再是合法的语句
if trueValue {
    
}
if falseValue {
    
}

// 元组
// 元组可以把多个值组合成一个复合值，元组内的值可以是任意类型。
// 可以是(Int, Int, Int) 也可以是 (String, Bool)
let http404Error = (404, "Not Found")

// 通过下标访问元组的属性，从0开始
print(http404Error.0)

// 给元组中的元素添加标签,这样我们就可以通过标签访问这个变量了
let http200Status = (statusCode: 200, message:"Success")
print(http200Status.statusCode,http200Status.message)


// 可选类型
// 用来处理值可能缺失的情况：有值，等于 x 或者没有值
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
// 我们在输出时，convertedNumber 会被推断为可选类型。我们可以使用`!`强制解包或者使用`??`给它一个缺省值。
print(convertedNumber!) // 使用强制解包，代表你已经知道这个里面一定有值，不为nil
print(convertedNumber ?? 456)

// 声明一个可选类型
var serverRespCode: Int? = 404 // 包含一个可选的 Int 值404
// 对于 nil。Swift 和 OC 中的 nil 不一样。OC 中是一个指向空对象的指针，而 Swift 中表示一个不确定的值。
// Swift 中可以将基本数据类型设为 nil，而 OC 不行。
var surveryAnswer: String? // 这里 surveryAnswer 被自动赋值为nil
if surveryAnswer != nil {
    
}
if let answer = surveryAnswer {
    print(answer)
}

// if 语句多个判断条件，中间用逗号隔开
// 只要有一个判断条件为空，或者为 false， if 语句整体就为 false
if let firstNumber = Int("4"), let secondNumber = Int("200"), firstNumber < secondNumber && secondNumber > 100 {
    print("in")
}

// 隐式可选类型 对于可选类型，每次都要判断和解析可选值是非常低效的，因为可以确定它总会有值。所以更好的方法是使用隐式可选类型
let assumedString: String! = "An implicitly unwrapped optional string"
let impliciteString: String = assumedString // 相比可选类型，不需要感叹号来强制解析

// 错误处理
func canThrowAnError() throws {
    
}
// 对应的，要使用 try-catch 来捕获
do {
    try canThrowAnError()
} catch {
    print(error)
}

// 断言 与 OC 相同
let age = 3
assert(age >= 0, "age cannot be less than zero")
