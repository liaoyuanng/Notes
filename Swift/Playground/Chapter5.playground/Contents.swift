//: Playground - noun: a place where people can play

import UIKit
// 控制流
// while if guard switch for-in

// switch
// Swift 中 switch 语句不会贯穿，即不需要使用 break 。如果想要贯穿，使用 fallthrough
// switch 必须完整。

let anotherChar: Character = "a"
switch anotherChar {
case "a": break
case "A":
    print("A")
default:
    print("else")
}

// case 分支的模式也可以是一个值的区间
let approximateCount = 62
let countedThings = "moons orbiting Saturn"

var naturalCount: String

switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "serveral"
default:
    naturalCount = "many"
}
print("there are \(naturalCount)\(countedThings)")

// switch 匹配元组
// 元组中的元素可以是值，也可以是区间。 用下划线(_)来匹配所有可能的值

// 值绑定
// case 分支允许将匹配的值绑定到一个临时的常量和变量，并且在 case 分支体内使用 -- 这种行为被称为值绑定
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print(x)
case (0, let y):
    print(y)
case let(x,y):
    print(x + y)
}

// where
// case 分支可以使用 where 语句来判断额外的条件
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let(x, y) where x == y:
    print("x == y")
case let(x, y) where x > y:
    print("x > y")
case let(x, y) where x < y:
    print("x < y")
default:
    break
}

// 符合匹配
// 当多个条件可以使用同一种方法来处理时，可以将这集中可能放在同一个 case 后面，用逗号隔开
let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0),(0, let distance):
    print("\(distance)")
default:
    print("not on an axis")
}

// 提前退出 guard
// guard 语句是当条件为真时，执行 guard 语句后的代码.
// 如果 guard 语句的条件被满足，则继续执行 guard 语句大括号后的代码。
// 如果 guard 语句的条件不被满足，则 else 分支上的代码就会被执行。else 分支必须转移控制以退出 guard 语句。如使用 return、break、continue、throw 或者调用一个不返回的方法或函数,如：fatalError()
func greet(person: String?) {
    guard person != nil else {
        fatalError()
    }
    print("Hello,\(person!)")
}
greet(person: "Leo")

// 检测 API 可用性
if #available(iOS 10, macOS 10.12, *) {
    
} else {
    
}
