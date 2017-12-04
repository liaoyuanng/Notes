//: Playground - noun: a place where people can play

import UIKit

// Chapter3 字符和字符串
// String 是值类型的，所以在对其进行常量、变量赋值操作时，或者在函数/方法中传递时，会进行拷贝。
// 但，在实际编译时，Swift 编译器会进行优化，复制只会发生在绝对必要的情况下。

// 注意，在 Swift4中，String 又变成了集合类型。

// 初始化空字符串
var emptyString = ""
var anotherEmptyString = String()
// 判断字符是否一样
if emptyString.isEmpty {
    print("nothing")
}

// 使用字符 4.0新特性，不需要在字符串后面加 characters
for charater in "Swift" {
    print(charater)
}

let s = "Hello, World!"
let count = s.count
let i = s.index(of: ",")!
var greeting = s[s.startIndex..<i]

s[i..<s.endIndex].dropFirst()
// 字符转字符串
let catCharacters:[Character] = ["C","a","t","!"]
let catString = String(catCharacters)

// Unicode
// 使用 \u{n} ,n 为任一 1 - 8位十六进制数且可用的 Unicode 位码，来表示一个字符
print("\u{256}")
print("\u{1F425}")
// é 的两种不同表示方法。
// 1. 直接使用 U+00E9 来表示；2. 使用 U+0065(e) 和 U+0301(二声符号) 的组合来表示
print("\u{E9}")
let combinedEAcute = "\u{65}\u{301}"
print(combinedEAcute)

//
var word = "cafe"
word += "\u{301}"
print(word.count)

// 字符串的操作
// 注意，从 Swift4 开始，截取后的字符串将不再 String 类型，而是 SubSting 类型。
// 参考 https://stackoverflow.com/questions/39677330/how-does-string-substring-work-in-swift
// 获取对应下标
let index = s.index(s.startIndex, offsetBy: 5)
let mySubstring = s[..<index]
// 首字母大写
let mySubstring2 = s.prefix(upTo: index)
let prefix = s.hasPrefix("H")

// 把 Index 类型转化为 Int 类型
let index2 = s.index(of: "l")
let distance = s.distance(from: index2!, to: index)

// 字符串的结尾
let index3 = s.index(s.startIndex, offsetBy: 7)
let mySubstring3 = s[index3...]

// 求给定 range 的 substring
let start = s.index(s.startIndex, offsetBy: 7)
let end = s.endIndex
let range = start..<end
let substring = s[range]

// substring 和 string 的转化
let string = String(substring)

// 字符串相等
let quotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation == sameQuotation {
    print("same")
}

// Unicode 和 UTF-8/16 的相关知识， 这里有篇文章，描述的诙谐易懂：
// https://www.zhihu.com/question/23374078











