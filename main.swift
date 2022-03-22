//
//  main.swift
//  codingTest
//
//  Created by sungals07 on 2021/03/09.
//

import Foundation

backjoon()

//programmers()

//func swap(_ a: inout Int, _ b: inout Int) {
//    let t = a
//    a = b
//    b = t
//}
//
//var num1 = 1
//var num2 = 2
//print(num1)
//print(num2)
//
//print(swap(&num1, &num2))
//print(num1)
//print(num2)

///*
// * Complete the 'difference_calculator' function below.
// *
// * The function is expected to return an INTEGER.
// * The function accepts INTEGER_ARRAY arr as parameter.
// */
//
////getLargestString(s: "zzzazz", k: 2)
////getLargestString(s: "axxzzx", k: 2)
///*
// * Complete the 'getLargestString' function below.
// *
// * The function is expected to return a STRING.
// * The function accepts following parameters:
// *  1. STRING s
// *  2. INTEGER k
// */
//
//func getLargestString(s: String, k: Int) -> String {
//    // Write your code here
//    var alphaDic = Dictionary<String, Int>()
//
//    let alpha = Array("abcdefghijklmnopqrstuvwxyz")
//
//    for i in 0 ..< alpha.count {
//        alphaDic[String(alpha[i])] = i
//    }
//
//    let sorted = s.sorted(by: >)
//    print(sorted)
//
//    return ""
//}
//
//
//
//difference_calculator(arr: [3, 3, 2, 2, 5, 5, 5, 5, 5, 3, 3, 3, 2, 2])
////difference_calculator(arr: [1, 2, 2, 4, 4, 4, 4, 2, 2, 2])
//
//
//func difference_calculator(arr: [Int]) -> Int {
//    // Write your code here
//    let i1 = indicator1(arr: arr)
//    let i2 = indicator2(arr: arr)
//    print(i1 - i2)
//    return 0
//}
//
//func indicator1(arr: [Int]) -> Int {
//    var count = 0
//    var i = 0
//
//
//    while i < arr.count &&
//            (i + arr[i]) <= arr.count {
//        let eArrays1 = arr[i ..< i + arr[i]]
//        print(eArrays1)
//
//        if eArrays1.filter({ $0 == arr[i] }).count == arr[i] {
//            if i + arr[i] != arr.count &&
//                (i + arr[i] + 1) < arr.count &&
//                arr[i + arr[i] + 1] != arr[i] {
//                print("OK")
//                count += 1
//                i += arr[i]
//            }
//        } else {
//            i += 1
//        }
//    }
//    print(count)
//    return count
//
//}
//
//func indicator2(arr: [Int]) -> Int {
//    var count = 0
//    var i = 0
//
////    for i in 0 ..< arr.count {
//    while i < arr.count && (i + arr[i]) <= arr.count {
//        let eArrays = arr[i ..< i + arr[i]]
//        print(eArrays)
////        if eArrays.contains(arr[i]) {
//        if eArrays.filter({ $0 == arr[i] }).count == arr[i] &&
//            arr[i] == i+1 {
//            print("OK")
//            count += 1
//            i += arr[i]
//
//        } else {
//            i += 1
//
//        }
//    }
//    print(count)
//    return count
//}

