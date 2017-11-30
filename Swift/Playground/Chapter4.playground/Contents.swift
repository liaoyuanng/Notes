//: Playground - noun: a place where people can play

import UIKit

// Chapter4 类型集合

// Swift 语言提供了 Arrays、Sets、Dictionaries 三种基本的集合类型用来存储集合数据
// 注：Swift 4 中，String 也属性集合数据类型

// 集合的可变行
// Swift 中，集合是否可变，很容易被知道，如果你创建时声明是常量(let)，那么集合就是不可变的。
//如果你创建时声明是变量(var)，那么集合就是可变的。
var mutableArray = Array<Any>() // 可变数组
let immutableArray = Array<Any>() // 不可变数组


// 数组
// 初始化一个空的数组
var someInts = [Int]()
someInts.append(3) // 添加一个新的元素
someInts = [] // someInts 被置空，但是由于上下文的存在，它仍然是[Int]类型的

// 创建一个带有默认值的数组
var threeDoubles = Array(repeatElement(0.0, count: 3))
var fourDoubles = Array.init(repeating: 0.0, count: 4)

// 使用 + 号操作符，合并两个相同类型的数组，新的数组类型会被自动推断
var anotherDoubles = threeDoubles + fourDoubles

// 使用字面量构造数组, 这里的数组类型也会被自动推断
var shoppingList = ["Eggs","Milk"]

// 数组的数量
var count = shoppingList.count
// 数组是否为空 Bool 类型
let empty = shoppingList.isEmpty
// 数组中添加数据
shoppingList.append("Flour")
shoppingList += ["Baking Powder"] // 使用 += 可以获得同样的结果
// 获取数组中的元素
var firstItem = shoppingList[0]
// 改变某个已有索引值对应的数据值
shoppingList[0] = "Six eggs"
// 改变一些列数据值
shoppingList[2..<3] = ["Bananas","Apples","Orange"]
// 插入数据
shoppingList.insert("Maple Syrup", at: 0)
// 移除数据
shoppingList.remove(at: 0)
// 遍历数组，除了最基本的 for-in，还可以使用 enumerated() 方法来遍历，它会返回数组的值和值对应的下标(元组形式)

for (index, value) in shoppingList.enumerated() {
    print("Item \(value), Index:\(index)")
}


// 集合 Sets
// 集合是用来存储相同类型并且没有确定顺序的值。面试的时候，经常会被问到一个知识点，1000万条数据，怎么快速去重，答案就是使用集合
// 能存储在集合中的数据类型，该类型必须是可哈希化的。
// 相等的对象，哈希值也必须相同，比如 a == b ，则 a.hashValue == b.hashValue
// Swift 的所有基本类型(String、Int、Double、Bool)都是可哈希化的。










