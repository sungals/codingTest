//
//  CodingTestPractice.swift
//  programmers
//
//  Created by sungals07 on 2021/03/08.
//

import Foundation

func getValidValue(_ gift_cards:inout [Int], _ wants:inout [Int]) -> Bool {
    var isValue = 0
//    for i in 0 ..< gift_cards.count {
    var i = 0
    while i < gift_cards.count - 1 - i {
        if gift_cards[i] == wants[i] {
            gift_cards.remove(at: i)
            wants.remove(at: i)
            isValue += 1
            i = 0
        }
        i += 1
    }
    
    return isValue > 0
}

/**
 gift_cards    wants    result
 [4, 5, 3, 2, 1]    [2, 4, 4, 5, 1]    1
 [5, 4, 5, 4, 5]    [1, 2, 3, 5, 4]    3
 */
func kakaoCommerceiOS(_ gift_cards:[Int], _ wants:[Int]) -> Int {
    var gGift_cards = gift_cards
    var wWants = wants
    
    print(gGift_cards)
    print(wWants)
    
    var i = 0
    var hasChanged = false
    repeat {
        let first = wWants[i]
        for (index, v) in gGift_cards.enumerated() {
            if v == first {
                let temp = gGift_cards[index]
                gGift_cards[index] = gGift_cards[i]
                gGift_cards[i] = temp
                print(gGift_cards)
                print(wWants)
//                gGift_cards.insert(gGift_cards[i], at: index)
//                gGift_cards.remove(at: index+1)
//
//                gGift_cards.insert(v, at: i)
//                gGift_cards.remove(at: i)
                getValidValue(&gGift_cards, &wWants)
                hasChanged = true
                break
            }
        }
        if hasChanged {
            hasChanged = false
            i = 0
        }
        i += 1
    } while i < wWants.count
    
    print(gGift_cards)
//    print(wWants)
//
    
    return 0
}

// Resolved!
/**
 priorities         location    return
 [2, 1, 3, 2]       2           1
 [1, 1, 9, 1, 1, 1] 0           5
 */
func stackQueuePrinter(_ priorities:[Int], _ location:Int) -> Int {
    var queue = priorities
    var dicArr = [[Int:Int]]()
    var printDicArr = [[Int:Int]]()
    for i in 0 ..< priorities.count {
        dicArr.append([i:priorities[i]])
    }
    
    print(dicArr)
    
    var max = queue.max()!
    
    while true {
        if let first = dicArr.first,
           let value = first.values.first {
            if dicArr.count == 1 {
                printDicArr.append(first)
                break
            }
            if value < max {
                dicArr.append(first)
            } else {
                printDicArr.append(first)
                queue.remove(at: queue.firstIndex(of: value)!)
                max = queue.max()!
            }
            dicArr.removeFirst()
        }
        print(dicArr)
    }
    print(printDicArr)
    
    return printDicArr.firstIndex(of: printDicArr.filter{$0.keys.first! == location}.first!)! + 1
}

// Resolved!
/**
 a           b            result
 [1,2,3,4]   [-3,-1,0,2]    3
 [-1,0,1]    [1,0,-1]      -2
 */
func worldCodeChallangeSeason1Inside(_ a:[Int], _ b:[Int]) -> Int {
    var result = 0
    for i in 0 ..< a.count {
        result += a[i] * b[i]
    }
    return result
//    return a.reduce(0) { $0 + $1 }
}

// Resolved!
func exerciseClap(_ n:Int) -> String {
//    var clap = [String]()
//    for i in 1 ... n {
//        clap.append(i % 2 == 0 ? "박" : "수")
//    }
//    return clap.joined()

    return (0..<n).map{( $0 % 2 == 0 ? "수" : "박")}.reduce("", +)
//    return "\(String(repeating: "수박", count: n / 2))\(n % 2 == 0 ? "" : "수")"}
}

func isPrime(_ num: Int) -> Bool {
    var i = 2
    while num > 2 && i*i <= num {
        if num % i == 0 {
            return false
        }
        i += 1
    }
    return true
}

// Resolved!
/**
 n    result
 10   4
 5    3
 */
func exerciseFindPrime(_ n:Int) -> Int {
    var res = 0
    
    for i in 2 ... n {
        if isPrime(i) {
            res += 1
        }
    }
    
    return res
//    var i = 1
//    var j = 0
//    var k = 0
//    var num = 2
//
//    while num <= n {
//        while i <= num {
//            if num % i == 0 {
//                j += 1
//                if j > 2 {
//                    break
//                }
//            }
//            i += 1
//        }
//        if j == 2 {
//            k += 1
//        }
//        i = 1
//        j = 0
//        num += 1
//    }
//    return k
}

// Resolved!
/**
 seoul              return
 ["Jane", "Kim"]    "김서방은 1에 있다"
 */
func exerciseFindKim(_ seoul:[String]) -> String {
//    seoul.enumerated().map{ $0.element == "Kim" ? $0.offset : -1 }
    
    var i = 0
    var res = ""
    while i < seoul.count {
        if  seoul[i] == "Kim" {
            res = String(i)
            break
        }
        i += 1
    }
    return "김서방은 \(res)에 있다"
}

// Resolved!
/**
 s          return
 "a234"     false
 "1234"     true
 */
func exerciseBasicLetter(_ s:String) -> Bool {
    return (s.count == 4 || s.count == 6) && s.filter{ $0.isLetter }.count == 0
}

// Resolved!
/**
 s             return
 "Zbcdefg"    "gfedcbZ"
 */
func exerciseOrder(_ s:String) -> String {
    return String(s.sorted(by: >))
}

// Resolved!
/**
 s          answer
 "pPoooyY"  true
 "Pyy"      false
 */
func exercisePandY(_ s:String) -> Bool {
//    let p = s.filter{ $0.lowercased() == "p" }
//    let y = s.filter{ $0.lowercased() == "y" }
//    if p.count == y.count {
//        return true
//    }
//
//    return false
    return s.filter{ $0.lowercased() == "p" }.count == s.filter{ $0.lowercased() == "y" }.count
}

// Resolved!
/**
 strings    n    return
 ["sun", "bed", "car"]    1    ["car", "bed", "sun"]
 ["abce", "abcd", "cdx"]    2    ["abcd", "abce", "cdx"]
 */
func exerciseArrangingMyMind(_ strings:[String], _ n:Int) -> [String] {
    let res = strings.sorted { (v1: String, v2: String) -> Bool in
        if v1[v1.index(v1.startIndex, offsetBy: n)] == v2[v2.index(v2.startIndex, offsetBy: n)] {
            return v1 < v2
        } else {
            return v1[v1.index(v1.startIndex, offsetBy: n)] < v2[v2.index(v2.startIndex, offsetBy: n)]
        }
    }

    return res
//    return strings.sorted(by: { Array($0)[n] == Array($1)[n] ? $0 < $1 : Array($0)[n] < Array($1)[n] })
}

// Resolved!
func exerciseTotalBetween2Number(_ a:Int, _ b:Int) -> Int64 {
    var aa = a
    var bb = b
    var total = 0
    
    if aa > bb {
        let temp = aa
        aa = bb
        bb = temp
    }
    for i in aa...bb {
        total += i
    }
    
    return Int64(total)
}

// Resolved!
func exerciseCompleteNumberArray(_ arr:[Int], _ divisor:Int) -> [Int] {
    let result = arr.filter{ $0 % divisor == 0 }.sorted()
    return result.count > 0 ? result : [-1]
}

// Resolved!
func exerciseGetCenterWord(_ s:String) -> String {
    let endIndex = s.index(s.startIndex, offsetBy: s.count / 2)
    let startIndex = s.count % 2 != 0 ? endIndex : s.index(before: endIndex)
    let result = s[startIndex...endIndex]
    print(result)
    return String(result)
}

// Resolved!
func monthlyCodeChallangeSeason1Reverse3(_ n:Int) -> Int {
    var reverse = ""
    var m = n
    while m > 0 {
        reverse.append(String(m % 3))
        m /= 3
    }
    print(reverse)
    var reverseInt = Int(reverse)!
    var result = 0
    var x = 1
    while reverseInt > 0 {
        result += (reverseInt % 10) * x
        reverseInt /= 10
        x *= 3
    }
    print(result)
    
    return result
}

// Resolved!
func exercise2016(_ a:Int, _ b:Int) -> String {
    let day = ["THU", "FRI", "SAT", "SUN", "MON", "TUE", "WED"]
    var date = 0
    for i in 1 ..< a {
        if i == 2 {
            date += 29
            continue
        }
        date += (i / 2) == 0 ? 30 : 31
    }
    
    date += b

    let result = day[date % day.count]
    return result
}


/**
 n    lost    reserve    return
 5    [2, 4]    [1, 3, 5]    5
 5    [2, 4]    [3]          4
 3    [3]       [1]          2
 5    [2, 3, 4] [1, 2, 3]    4
 5    [1, 2, 3] [2, 3, 4]    4
 */
func workoutClothes(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var student = [Int](repeating: 0, count: n)
    var studentDic = Array<Dictionary<String, Bool>>(repeating: ["canBorrow" : false], count: n)
    for i in 0 ..< lost.count {
        student[lost[i] - 1] = -1
        studentDic[lost[i] - 1]["canBorrow"] = false
    }
    for i in 0 ..< reserve.count {
        student[reserve[i] - 1] = 2
        studentDic[reserve[i] - 1]["canBorrow"] = true
    }
//
    print(student)
    
    var i = 0
    while student.count > 1 && i < student.count {
        if student[i] == -1 {
            if i == 0 && student[1] >= 1
                && studentDic[1]["canBorrow"] == true {
                // first index
                student[0] = 0
                student[1] -= 1
                studentDic[1]["canBorrow"] = false
                i += 2
                continue
                
            } else if i == student.count - 1 && student[student.count - 2] >= 1
                        && studentDic[i]["canBorrow"] == true  {
                // last index
                student[student.count - 1] = 0
                student[student.count - 2] -= 1
                studentDic[student.count - 2]["canBorrow"] = false
                i += 1
                break
                
            } else {
                if student[i - 1] >= 1
                    && studentDic[i - 1]["canBorrow"] == true {
                    // prev
                    student[i] = 0
                    student[i - 1] -= 1
                    studentDic[i - 1]["canBorrow"] = false
                    i += 1
                    continue
                    
                } else if student[i + 1] >= 1
                            && studentDic[i + 1]["canBorrow"] == true {
                    // post
                    student[i] = 0
                    student[i + 1] -= 1
                    studentDic[i + 1]["canBorrow"] = false
                    i += 2
                    continue
                }
                
            }
        }
        i += 1
    }

    print(student)
    let studentCount = student.filter{ $0 >= 0 }.count
    print("studentCount: \(studentCount)")
    return studentCount
//    return 0
}

// Resolved!
func completeSearch(_ answers:[Int]) -> [Int] {
    let a = [1, 2, 3, 4, 5]
    let b = [2, 1, 2, 3, 2, 4, 2, 5]
    let c = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    
    var result: [Int: Int] = [:]
    
    for i in 0 ..< answers.count {
        if answers[i] == a[i % a.count] {
            result[1] = result[1] ?? 0 + 1
        }
        if answers[i] == b[i % b.count] {
            result[2] = result[2] ?? 0 + 1
        }
        if answers[i] == c[i % c.count] {
            result[3] = result[3] ?? 0 + 1
        }
    }
    
    return result.filter{ $0.value == result.values.max() }.keys.sorted()
}

// Resolved!
/**
 1단계 new
 _id의 모든 대문자를 대응되는 소문자로 치환합니다.
 2단계 new_id에서 알파벳 소문자, 숫자, 빼기(-), 밑줄(_), 마침표(.)를 제외한 모든 문자를 제거합니다.
 3단계 new_id에서 마침표(.)가 2번 이상 연속된 부분을 하나의 마침표(.)로 치환합니다.
 4단계 new_id에서 마침표(.)가 처음이나 끝에 위치한다면 제거합니다.
 5단계 new_id가 빈 문자열이라면, new_id에 "a"를 대입합니다.
 6단계 new_id의 길이가 16자 이상이면, new_id의 첫 15개의 문자를 제외한 나머지 문자들을 모두 제거합니다.
      만약 제거 후 마침표(.)가 new_id의 끝에 위치한다면 끝에 위치한 마침표(.) 문자를 제거합니다.
 7단계 new_id의 길이가 2자 이하라면, new_id의 마지막 문자를 new_id의 길이가 3이 될 때까지 반복해서 끝에 붙입니다.
 */
func kakaoBlindRecruitment2021(_ new_id:String) -> String {
    // 1
    var id = new_id.lowercased()
    // 2
    id = id.replacingOccurrences(of: "[^a-z0-9-_.]", with: "", options: String.CompareOptions.regularExpression, range: id.startIndex ..< id.endIndex)
    // 3
    while id.contains("..") {
        id = id.replacingOccurrences(of: "..", with: ".")
    }
    
    // 4
//    if let first = id.first, first == "." {
//        id.removeFirst()
//    }
//
//    if let last = id.last, last == "." {
//        id.removeLast()
//    }
    if id.hasPrefix(".") {
        id.removeFirst()
    }
    if id.hasSuffix(".") {
        id.removeLast()
    }
    
    // 5
    if id.count == 0 {
        id = "a"
    }
    
    // 6
    if id.count >= 16 {
        id.removeLast(id.count - 15)
        if let last = id.last, last == "." {
            id.removeLast()
        }
    }
    // 7
    if id.count <= 2 {
        while id.count < 3 {
            id = id + String(id.last!)
        }
    }
    return id
}

// Resolved!
/**
numbers    result
[2,1,3,4,1]    [2,3,4,5,6,7]
[5,0,2,7]    [2,5,7,9,12]
 */
func monthlyCodeChallenge(_ numbers:[Int]) -> [Int] {
    var stack = [Int]()
    for (i, n1) in numbers.enumerated() {
        for (j, n2) in numbers.enumerated() {
            if i == j {
                continue
            }
            let sum = n1 + n2
            if stack.contains(sum) {
                continue
            }
            stack.append(sum)
        }
    }
    
    return stack.sorted()
}

// Resolved!
/**
 board    moves    result
 [[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]]    [1,5,3,5,1,2,1,4]    4
 */
func kakao2019Crane(_ board:[[Int]], _ moves:[Int]) -> Int {
    var dicBoard = Array<Dictionary<Int, Bool>>()
    
    for b in board {
        var dic = Dictionary<Int, Bool>()
        for i in 0 ..< b.count {
            dic[i] = (b[i] == 0) ? false : true
        }
        dicBoard.append(dic)
    }
        
    var stack = Array<Int>()
    var boom = 0
    
    for move in moves {
        for (i, b) in board.enumerated() {
            let doll = b[move-1]
            if doll == 0 || dicBoard[i][move-1] == false {
                continue
            }
            dicBoard[i][move-1] = false
            if let s = stack.popLast() {
                if s != doll {
                    stack.append(s)
                    stack.append(doll)
                } else {
                    boom += 2
                }
            } else {
                stack.append(doll)
            }
            break
        }
    }
    
    return boom
}
