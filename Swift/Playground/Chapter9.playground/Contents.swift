//: Playground - noun: a place where people can play

import UIKit

// 方法
// 方法是属于某个特定类、结构体、枚举类型实例的方法

// 在实例方法中修改值类型
// 结构体和枚举是值类型，默认情况下，值类型的属性不能在它的实例方法中被修改
struct Point {
    // 这里要用变量，而不是常量
    var x = 0.0, y = 0.0
    // 这里如果不加 mutating 就会发生编译错误
    mutating func moveByX(_ deltaX: Double, y deltaY: Double) {
        x += deltaX;
        y += deltaY;
    }
}

var somePoint = Point.init(x: 1.0, y: 1.0)
somePoint.moveByX(2.0, y: 3.0)

