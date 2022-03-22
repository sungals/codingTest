//
//  Top100LikesQuestions.swift
//  LeetCode
//
//  Created by sungals07 on 2021/03/08.
//

import Foundation

func q1TwoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var answer = Array<Int>()
    for (i, numi) in nums.enumerated() {
        for (j, numj) in nums.enumerated() {
            if i == j {
                continue
            }
            if numi + numj == target {
                answer.append(i)
                answer.append(j)
                return answer
            }
        }
    }
    return answer
}

func q20IsValid(_ s: String) -> Bool {
    let dic = [
        ")" : "(",
        "}" : "{",
        "]" : "[",
    ]
    
    let array = s.map{ String($0) }
    print(array)
    
    var newArray = Array<String>()
    for a in array {
        if a == ")" || a == "}" || a == "]" {
            if let s = newArray.popLast() {
                if s == dic[a] {
                    
                } else {
                    return false
                }
            } else {
                newArray.append(a)
            }
        } else {
            newArray.append(a)
        }
    }
    
    return newArray.count == 0 ? true : false
}
