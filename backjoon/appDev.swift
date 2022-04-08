//
//  appDev.swift
//  backjoon
//
//  Created by sungals07 on 2021/03/03.
//

import Foundation

func q1110() {
    let input = Int(readLine()!)!
    
    var orig = input
    var new = 0
    var left = 0
    var right = 0
    var add = 0
    var count = 0
    
    repeat {
        left = orig / 10
        right = orig % 10
        add = left + right
        if add >= 10 {
            add = add % 10
        }
        new = Int(String(right).appending(String(add)))!
        orig = new
        count += 1
    } while input != new
    
    
    print(count)
}

func q2884() {
    let value = readLine()!.split(separator: " ").map { Int(String($0))! }
    if value.count > 1 {
        var h = value[0]
        var m = value[1]
        
        m = m - 45
        if m < 0 {
            h -= 1
            m = 60 + m
        }
        if h < 0 {
            h = 23
        }
        print("\(h) \(m)")
    }
}

func q2439() {
    let input = Int(readLine()!)!
    
    for i in 1 ... input {
        var str = ""
        for j in 1 ... input {
            if input - i >= j {
                str += " "
            } else {
                str += "*"
            }
        }
        print(str)
    }
}

func q2438() {
    if let line = readLine(), let input = Int(line) {
        for i in 1 ... input {
            for _ in 1 ... i {
                print("*", terminator: "")
            }
            print("")
        }
    }
}

func q2742() {
    if let line = readLine(), let input = Int(line) {
        for i in 0 ..< input {
            print(input - i)
        }
    }
}

func q8393() {
    if let line = readLine(), let input = Int(line) {
        var sum = 0
        for i in 1 ... input {
            sum += i
        }
        print(sum)
    }
}


func q10950() {
    if let line = readLine(), let input = Int(line) {
        for _ in 0 ..< input {
            let value = readLine()!.split(separator: " ").map { Int(String($0))! }
            if value.count > 1 {
                print(value[0] + value[1])
            }
        }
    }
}


func q9498() {
    if let line = Int(readLine()!) {
        if line >= 90 && line <= 100 {
            print("A")
        }
        else if line >= 80 && line < 90 {
            print("B")
        }
        else if line >= 70 && line < 80 {
            print("C")
        }
        else if line >= 60 && line < 70 {
            print("D")
        } else {
            print("F")
        }
    }
}

func q2231() {
    if let line = readLine(), let input = Int(line) {
        for i in 1 ..< input {
            var m = i
            var n = 0
            
            while m != 0 {
                n += m % 10
                m /= 10
            }
            if i + n == input {
                print(i)
                return
            }
        }
        print("0")
    }
}
    
func getCount(_ n:Int, _ female: Bool) -> Int {
    var m = n
    if female {
        m = m / 2
    }
    return m
}

func q2875() {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    var a = line[0]
    var b = line[1]
    var c = line[2]
    
    while c > 0 {
        if getCount(a, true) >= getCount(b, false) {
            a -= 1
        } else {
            b -= 1
        }
        
        c -= 1
    }
    
    print(a / 2 <= b ? a / 2 : b)
}

/**
 8 16
 32 4
 17 5
 0 0
 */
func q5086() {
    
    while true {
        let line = readLine()!.split(separator: " ").map { Int(String($0))! }
        let a = line[0]
        let b = line[1]
        if a == 0 && b == 0 {
            break
        }
        if b % a == 0 {
            print("factor")
        } else if a % b == 0 {
            print("multiple")
        } else {
            print("neither")
        }
    }
}

func mPow(_ a:Int, _ b:Int) -> Int {
//    let w = [
//        [1],            // 1
//        [2, 4, 8, 6],   // 2
//        [3, 9, 7, 1],   // 3
//        [4, 6],         // 4
//        [5],            // 5
//        [6],            // 6
//        [7, 9, 3, 1],   // 7
//        [8, 4, 2, 6],   // 8
//        [9, 1],         // 9
//        [0]             // 10
//    ]

    var i = 1
    var sum = a
    while i < b {
        sum = (sum * a) % 10
        i += 1
    }
    return sum == 0 ? 10 : sum
}

func q1009() {
    let n = Int(readLine()!)!
    for _ in 0 ..< n {
        let line = readLine()!.split(separator: " ").map { Int(String($0))! }
        let a = line[0]
        let b = line[1]
        
        var res = a
        let c = b % 4 + 4
        for _ in 1 ..< c {
            res = (res * a) % 10
        }
        
        print(res == 0 ? 10 : res)
    }
    
}

func q3029() {
    let startTimes = (readLine()!).components(separatedBy: ":").map{ Int(String($0))}
    let ss = startTimes[2]!
    let sm = startTimes[1]!
    let sh = startTimes[0]!
    let endTimes = (readLine()!).components(separatedBy: ":").map{ Int(String($0))}
    var es = endTimes[2]!
    var em = endTimes[1]!
    var eh = endTimes[0]!
    
    if(ss > es) {
        es += 60
        em -= 1
    }
    if(sm > em) {
        em += 60
        eh -= 1
    }
    if(sh > eh) {
        eh += 24
    }
    
    let ch = eh - sh
    let cm = em - sm
    let cs = es - ss
    
    if ch == 0 && cm == 0 && cs == 0 {
        print("24:00:00")
    } else {
        print(String(format: "%02d:%02d:%02d", ch, cm, cs))
    }
    
//    if startTimes == endTimes {
//        print("00:00:01")
//
//    } else {
//        var hour = 0
//        var min = 0
//        var sec = endTimes[2]! - startTimes[2]!
//        if sec < 0 {
//            sec = sec + 60
//            endTimes[1]! -= 1
//
//            if endTimes[1]! < 0 {
//                endTimes[1]! = endTimes[1]! + 60
//                endTimes[0]! -= 1
//
//                if endTimes[0]! < 0 {
//                    endTimes[0]! = endTimes[0]! + 24
//                }
//            }
//        }
//        min += endTimes[1]! - startTimes[1]!
//        if min < 0 {
//            endTimes[1]! = endTimes[1]! + 60
//            endTimes[0]! -= 1
//
//            if endTimes[0]! < 0 {
//                endTimes[0]! = endTimes[0]! + 24
//            }
//        }
//        hour += endTimes[0]! - startTimes[0]!
//        if hour < 0 {
//            hour = hour + 24
//        }
//        print(String(format: "%02d:%02d:%02d", ch, cm, cs))
//    }
}

// Resolved!
func q9046() {
//    print(UnicodeScalar("c").value - UnicodeScalar("a").value)
    let n = Int(readLine()!)!
    
    for _ in 0 ..< n {
        let m = readLine()!
        var values = [Int](repeating: 0, count: 26)
        for c in m {
            if c.isLetter {
                let index = UnicodeScalar(String(c))!.value - UnicodeScalar("a").value
                values[Int(index)] += 1
            }
        }
        let max = values.max()!
        if values.filter({ $0 == max }).count < 2 {
            print(UnicodeScalar(Int(UnicodeScalar("a").value) + values.firstIndex(of: max)!)!)
        } else {
            print("?")
        }
    }
    
    // 이거 왜 통과가 안되지??? ㅡ0ㅡ
//    let n = Int(readLine()!)!
//
//    for _ in 0 ..< n {
//        if let m = readLine() {
//            var dicCount = Dictionary<Character, Int>()
//
//            for j in 0 ..< m.count {
//                if dicCount.keys.contains(Array(m)[j]) {
//                    dicCount[Array(m)[j]]! += 1
//                } else {
//                    dicCount.updateValue(1, forKey: Array(m)[j])
//                }
//            }
//            let maxValue = dicCount.filter{ $0.value == dicCount.values.max() }
//            print(maxValue.count > 1 ? "?" : maxValue.keys.first ?? "?")
//        }
//    }
}

func getAlphaIndex(_ a: Character) -> Int {
    let alpha = Array("abcdefghijklmnopqrstuvwxyz")
    return a == " " ? -1 : alpha.firstIndex(of: a)!
}

func getAlphaLetter(_ n: Int) -> String {
    let alpha = Array("abcdefghijklmnopqrstuvwxyz")
    let index = n <= 0 ? n + 26 : n
    return String(alpha[index])
}

/**
 sentence  : nice day             btgz oet
 encryptKey: love
 */
func q1718() {
    
    let sentence = Array(readLine()!)
    let encryptKey = Array(readLine()!)
    var result = [String]()
    var alphaDic = Dictionary<String, Int>()
    
    let alpha = Array("abcdefghijklmnopqrstuvwxyz")
    
    for i in 0 ..< alpha.count {
        alphaDic[String(alpha[i])] = i
    }
    
    for i in 0 ..< sentence.count {
        let key = String(encryptKey[i % encryptKey.count])
        
        if sentence[i] == " " {
            result.append(" ")
            continue
            
        } else if alphaDic[String(sentence[i])]! <= alphaDic[key]! {
            let index = alphaDic[String(sentence[i])]! - alphaDic[key]! + alpha.count - 1
            result.append(String(alpha[index]))
        
        } else {
            let index = alphaDic[String(sentence[i])]! - alphaDic[key]! - 1
            result.append(String(alpha[index]))
        }
    }
    
    
//    let indexEncryptKey = encryptKey.map{ getAlphaIndex($0) }
//    let indexSentence = sentence.map{ getAlphaIndex($0) }
//
//    for i in 0 ..< indexSentence.count {
//        if indexSentence[i] == -1 {
//            result.append(" ")
//            continue
//        }
//        let index = (indexSentence[i] - indexEncryptKey[i % indexEncryptKey.count]) - 1
//        let letter = getAlphaLetter(index)
//        result.append(letter)
//    }
    print(result.joined())
}

func q20492() {
    let n = Double(readLine()!)!
    print("\(Int(n - n * 0.22)) \(Int((n * 0.80) + ((n * 0.20) - (n * 0.20) * 0.22)))")
}

func q1874() {
    // time pass
    let n = Int(readLine()!)!
    var stack = [Int]()
    var num = 1
    var printArr = [String]()
    var isSolved = true
    
    for _ in 0 ..< n {
        let element = Int(readLine()!)!
        while num <= element {
            stack.append(num)
            printArr.append("+")
            num += 1
        }
        if stack[stack.count - 1] == element {
            let _ = stack.popLast()
            printArr.append("-")
        } else {
            isSolved = false
        }
    }
    
    if isSolved == false {
        print("NO")
    } else {
        for p in printArr {
            print(p)
        }
    }
    
    // time fail
//    let n = Int(readLine()!)!
//    var arr = [Int]()
//    for _ in 0 ..< n {
//        arr.append(Int(readLine()!)!)
//    }
//    var stack = [Int]()
//    var i = 1
//    var printArr = [String]()
//
//    for element in arr {
//        while true {
//            if stack.count > 0
//            && stack[stack.count - 1] == element {
//                let _ = stack.popLast()
//                printArr.append("-")
//                break
//            } else {
//                if stack.contains(element) {
//                    printArr.removeAll()
//                    printArr.append("NO")
//                    break
//                }
//                stack.append(i)
//                printArr.append("+")
//                i += 1
//            }
//        }
//        if printArr.contains("NO") {
//            break
//        }
//    }
//
//    for p in printArr {
//        print(p)
//    }
}

func q1357() {
    let line = readLine()!.split(separator: " ").map { String($0) }
    print(RevX(String(RevX(line[0]) + RevX(line[1]))))
}

func RevX(_ str: String) -> Int {
    return Int(String(str.reversed()))!
}

func q10821() {
    if let input = readLine() {
        let nums = input.components(separatedBy: ",").map{ Int($0) }
        print(nums.count)
    }
//    if let lines = readLine(), lines.count < 100 {
//        let strs = lines.split(separator: ",").map{ Int(String($0)) }
//        let nums = strs.filter { (value: Int?) -> Bool in
//            return value != nil
//        }
//        print(nums.count)
//    }
}

//func q2292() {
//    let n = Int(readLine()!)!
//    var enter = 1
//    var p = 1
//    for i in 1 ..< n + 1 {
//        if n == 1 {
//            print("1")
//            break
//        }
//        enter += 1
//        p += i * 6
//        if p >= n {
//            print(enter)
//            break
//        }
//    }
//}

//func q2389() -> Int {
//    var n = Int(readLine()!)!
//    var result = 0
//
//    if n % 5 == 0{
//        return n / 5
//    }
//
//    while (n >= 0){
//        n -= 3
//        result += 1
//        if n % 5 == 0 {
//            return result + (n / 5)
//        }
//    }
//
//    return -1
//}

//func q2389() -> Int {
//    var n = Int(readLine()!)!
//    var count = 0
//
//    let coinTypes = [5, 3]
//
//    for coin in coinTypes {
//        count += n / coin
//        n %= coin
//
//        if n == 0 {
//            return count
//        } else if n < 5 {
//            n += coin
//            count -= 1
//        }
//    }
//
////    print(count)
//    if n != 0 {
//        return -1
//    }
//    return count
//}

//func q2389() -> Int {
//
//    var iData = Int(readLine()!)!
//    var totalCount = 0
//    var quotient = 0
//
//    quotient = iData / 5
//    if quotient == 0 {
//
//    } else {
//        totalCount += quotient
//        iData -= 5 * quotient
//        if iData % 3 != 0 {
//            iData += 5
//            totalCount -= 1
//        }
//    }
//
//    quotient = iData / 3
//    totalCount += quotient
//    iData -= 3 * quotient
//    print(iData != 0 ? -1 : totalCount)
//    return iData != 0 ? -1 : totalCount
//}

/// complete
func q12050() {
    if let i = Int(readLine()!) {
        for _ in 1 ... i {
            let line = readLine()!.split(separator: " ").map { Int(String($0))! }
            let h = line[0]
            let n = line[2]
            
            let no = n % h == 0 ? n / h : n / h + 1
            let floor = String(n % h == 0 ? h : n % h)
            let strNo = no < 10 ? "0" + String(no) : String(no)
            print(floor + strNo)
        }
    }
}
