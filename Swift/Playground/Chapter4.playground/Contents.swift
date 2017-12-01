//: Playground - noun: a place where people can play

import UIKit

// Chapter4 类型集合

// Swift 语言提供了 Arrays、Sets、Dictionaries 三种基本的集合类型用来存储集合数据
// 注：Swift 4 中，String 也属性集合数据类型

// 集合的可变行
// Swift 中，集合是否可变，很容易被知道，如果你创建时声明是常量(let)，那么集合就是不可变的。
// 如果你创建时声明是变量(var)，那么集合就是可变的。
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
// 数组是否为空, Bool 类型
let empty = shoppingList.isEmpty
// 数组中添加数据
shoppingList.append("Flour")
shoppingList += ["Baking Powder"] // 使用 += 可以获得同样的结果
// 获取数组中的元素
var firstItem = shoppingList[0]
// 改变某个已有索引值对应的数据值
shoppingList[0] = "Six eggs"
// 改变一系列数据值
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

// 初始化一个空的集合
var letters = Set<Character>()
// 插入一个值
letters.insert("a")
// 和数组一样，Set 也可以根据上下文自动推断集合的类型
letters = [] // 这里 letter 还是 Character 的类型
// 使用字面量创建集合
var favoriteGenres0: Set<String> = ["Rock","Classical","Hip Hop"]
// Set 类型不能从数组字面量倍单独推断出来，所以必须要显示声明，但是，Set 内的元素类型可以被自动推断出来，所以可以简化：
var favoriteGenres: Set = ["Rock","Classical","Hip Hop"]
// 集合的元素数量
favoriteGenres.count
// 判断集合是否为空
favoriteGenres.isEmpty
// 移除某一个元素 并且，如果移除成功，会返回这个被移出的元素，移除失败的话，返回 nil
favoriteGenres.remove(at: favoriteGenres.startIndex)
favoriteGenres.remove("Rock")
favoriteGenres.remove("Rock") // 删除失败
// 检查集合是否包含一个特定的值
favoriteGenres.contains("Classical")
// 遍历集合
for genre in favoriteGenres0 {
     print(genre)
}
// 对集合进行有序输出
for genre in favoriteGenres0.sorted() {
    print(genre)
}

// 集合的操作
let oddDigits: Set = [1,3,5,7,9]
let evenDigits: Set = [0,1,2,4,6,8]
// 集合的交集(intersection)
oddDigits.intersection(evenDigits).sorted()
// 集合的并集(union)
oddDigits.union(evenDigits).sorted()
// 集合的对称差(symmetricDifference)， 在集合论里面，对称差的计算方式是： (A∪B) - (A∩B)
oddDigits.symmetricDifference(evenDigits).sorted()
// 集合的相对差(subtracting) A - B
oddDigits.subtracting(evenDigits).sorted()
let subSet: Set = [1,2,3,4,5]
let superSet: Set = [1,2,3,4,5,6,7,8]

// 集合的相等， ==
subSet == superSet
// 集合的子集
superSet.isSuperset(of: subSet)
subSet.isSubset(of: superSet)
// 集合的真子集
subSet.isStrictSubset(of: superSet)
superSet.isStrictSuperset(of: subSet)
// 集合是否没有有交集
subSet.isDisjoint(with: superSet) // 两者有交集


// 字典
// 字典的 key 必须遵循 Hashable 协议

// 创建一个空字典
var namesOfInt = [Int:String]()
// 同数组一样，它可以根据上下文自动推断字典类型
namesOfInt = [:] // 仍为 Int: String 类型的字典

// 使用字面量创建字典
var airports0: [String: String] = ["YYZ":"Toronto Pearson","DUB":"Dublin"]
// 自动推断
var airport = ["YYZ":"Toronto Pearson","DUB":"Dublin"]
// 字典的数量
airport.count
// 字典是否为空
airport.isEmpty
// 使用 key 访问/修改值
airport["YYZ"] = "HongQiao"
airport["YYZ"]
airport.updateValue("Pudong", forKey: "YYZ") // 返回的是更新之前的原值
airport.updateValue("HongQiao", forKey: "SH")
// 移除某个元素
airport["SH"] = nil // 直接置 nil 来移除
airport.removeValue(forKey: "YYZ");
// 遍历
for (airportCode, airpotName) in airports0 {
    print("\(airportCode):\(airpotName)")
}
