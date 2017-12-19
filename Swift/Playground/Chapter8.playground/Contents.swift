//: Playground - noun: a place where people can play

import UIKit

// 类和结构体

// 共同点

/**
 *  1. 定义属性用于存储值
 *  2. 定义方法用于提供功能
 *  3. 定义瞎掰哦操作
 *  4. 定义构造器生成初始化值
 *  5. 通过扩展增加默认实现的功能
 *  6. 实现协议以提供某种标准功能
 */

// 结构体是值传递，即通过复制的方式在代码中传递，不会使用引用计数
struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0
    var name: String?
}

let hd = Resolution.init(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048 // 修改 cinema 的变量的值，并不会影响到 hd
print("HD : \(hd.width)")

// 类是引用类型。
// 引用类型在被赋予到一个变量、常量或者被传递到一个函数时，其值不会被拷贝
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty .frameRate = 25

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30
print(tenEighty.frameRate) // 30

// 使用恒等运算符来比较多个变量是否同时引用了同一个类型。
print(tenEighty === alsoTenEighty)

// String、 Array、Dictionary 是结构体
let string_im = "value"
var string_m = string_im
string_m = "new value"
print(string_im) // 并未改变 string

// Lazy 属性
// 将实例真正需要的时候，再去创建。
// 注意：如果被标记为 lazy 的属性在没有初始化的时候，就被多线程调用，那么可能会初始化多次。
class DataImporter {
    var fileName = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager() // 这里并不会初始化 DataImporter 的实例
manager.data.append("Somee Data")
manager.importer.fileName = "file" // 到这里才会实例化 DataImporter

// 计算属性
// 计算属性不直接存储值，而是提供一个 getter 和 可选的 setter。
struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + size.width / 2
            let centerY = origin.y + size.height / 2
            return Point.init(x: centerX, y: centerY)
        }
        
        // 这里可以省略 newCenter 参数名。使用默认的 newValue 参数名来访问
        set(newCenter) {
            origin.x = newCenter.x - size.width / 2
            origin.y = newCenter.y - size.height / 2
        }
    }
}

var square = Rect.init(origin: Point.init(x: 0.0, y: 0.0), size: Size.init(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point.init(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")

// 只读计算属性，没有 setter 方法，可以去掉关键字和花括号。
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        // 这里是默认的 getter 方法，省去了 关键字和花括号
        return width * height * depth
    }
}


// 属性观察器 willSet didSet
// 属性观察器用来监控和响应属性值的变化，每次属性被设置值的时候，都会调用属性观察器。即使新值和当前值相同。
class StepCounter {
    var totalSteps: Int = 0 {
        willSet {
            print("About to set totalSteps to \(newValue)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
print(stepCounter.totalSteps)

// 类型属性
// 无论创建了多少该类型的实例，这些属性都只有唯一一份
struct SomeStructure {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 1
    }
}

enum SomeEnumeration {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 6
    }
}

class SomeClass {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableÇomputedTypeProperty: Int {
        return 107
    }
}

print(SomeStructure.storedTypeProperty)
SomeStructure.storedTypeProperty = "Another value"
print(SomeStructure.storedTypeProperty)
