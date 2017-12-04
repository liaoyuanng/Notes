//: Playground - noun: a place where people can play

import UIKit

// Chapter 2 基本运算符

// Swift 中，赋值操作不会返回任何值。所以下面的代码是错误的
/*
var x = 1, y = 1
if x = y {
    
}
 */
// 所以，我们再也不会吧 == 错写成 = 造成错误了。也不必撕逼，复制时变量是放左边(x = 1)好还是放右边(1 = x) 好了

// 取余
// 对于负数求余时，负号会被自动忽略
let a = 9 % 2
let b = 9 % -2
let c = -9 % 2 // 这里不会省略

// 比较运算符
// 每个比较运算符都返回了一个标识表达式是否成立的布尔值
// Swift 提供了恒等 === 和不恒等 !== 来比较两个对象是否引用同一个对象实例

// 元组的比较
// 比较元组大小会按照从左到右、逐值比较的方式，直到发现有两个值不等时停止。如果所有的值都相等，那么这一对元组我们就称它们是相等的。
(1, "zebra") < (2, "apple")
(3, "apple") < (3, "bird")
(3, "apple") < (3, "Apple")
(3, "apple") == (3, "apple")
// 注意， Swift 支持的元组比较，只能比较7个元素以内的。超过的话，需要自己实现比较逻辑。

// 空合运算符
// 空合运算符(a ?? b)是对可选类型 a 进行空判断，如果 a 不为空，就解封 a，如果 a 为空，就返回默认的值 b。
// 空合运算符其实就是对三目运算符的简短表达： a == nil ? b : a

let defaultColorName = "Red"
var userDefinedColorName: String? // 注意，这里不能声明为常量

var colorName = userDefinedColorName ?? defaultColorName

// 区间运算符
// a...b 闭区间运算符，定义一个包含从 a 到 b(包含 a 和 b) 所有 值的区间
// a..<b 半开区间运算符，定义一个包含从 a 到 b（包含 a 但不包含 b） 所有值的区间
let names = ["Anna", "Alex", "Brian", "Jack"]
for i in 0..<names.count {
    print(names[i])
}






