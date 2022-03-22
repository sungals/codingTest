//
//  qFor.swift
//  backjoon
//
//  Created by sungals07 on 2021/03/03.
//

import Foundation



func q4673() {
    func selfNum(_ n: Int) -> Int {
        var res = n
        var m = n
        while m != 0 {
            res += (m % 10)
            m /= 10
        }
        return res
    }

    let count = 10000
    var ans = [Bool](repeating: true, count: count)
    for i in 1...count {
        if selfNum(i) < count  {
            ans[selfNum(i)] = false
        }
    }
    for i in 1...count-1 {
        if ans[i] {
            print(i)
        }
    }
    
//    print("res: \(Array(Set(res)).sorted())")

//    let target = 10000
//    var input = 1
//    var n = input
//    var res = [Int]()
//
//    while input <= 10000 {
//        if n < 10 {
//            res.append(input + (input % 10))
//
//        } else {
//            var a = 0
//            while (n / 10) >= 1 {
//                n /= 10
//                a += (n % 10)
//            }
//            res.append(input + a + (input % 10))
//            a = 0
//        }
//        input += 1
//        n = input
//    }
//    print("res: \(Array(Set(res)).sorted())")
    
//    var selfNum = [Int]()
//    for i in 1..<10000 {
//        if res.contains(i) {
//            continue
//        }
//        print(i)
////        selfNum.append(i)
//    }
//    print("selfNum: \(selfNum)")
}

func q2562() {
    var arr = [Int]()
    var n = 0
    while n < 9 {
        arr.append(Int(readLine()!)!)
        n += 1
    }
    let max = arr.max()!
    let index = arr.firstIndex(of: max) ?? 0
    print(max)
    print(index+1)
}

func q10818() {
    let n = Int(readLine()!)!
    var input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    
    if input.count > n {
        return
    }
    let sorted = input.sorted()
    print("\(sorted.first!) \(sorted.last!)")
}

func q2480() {
    let num = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let f = num[0]
    let s = num[1]
    let t = num[2]
//    var price = 0
    if f == s && s == t {
//        price = 10000 + num[0] * 1000
        print(10000 + f * 1000)
        
    } else if (f == s) || (t == f) {
//        price = 1000 + num[0] * 100
        print(1000 + f * 100)
        
    } else if (s == t) {
//        price = 1000 + num[1] * 100
        print(1000 + s * 100)
    } else {
//        price = (num.max()!) * 100
        print((num.max()!) * 100)
    }
//    print(price)
}

func q2525() {
//    readLine()!.split(separator: " ").map{ Int(String($0)) }
    let initTime = readLine()!.split(separator: " ").map{ Int(String($0))! }//.sorted()
    let cookTime = Int(readLine()!)!
    
    let time = initTime[0]
    let min = initTime[1] + cookTime
    
//    min += cookTime
//    var additionalHour = 0
    
//    if min >= 60 {
//        additionalHour = min / 60
//        min %= 60
//    }
    
//    time += additionalHour
//    if time >= 24 {
//        time %= 24
//    }
    
    
    
    print("\((time + min / 60) % 24) \(min % 60)")
}

func q4948() {
    let M = Int(readLine()!)!
    
    var arr:[Int] = [Int](repeating: 0, count: 123456 + 1)
    for i in 2 ... 123456 {
        arr[i] = i
    }
    
    for i in 2 ... M {
        if arr[i] == 0 {
            continue
        }
        
        
    }
    
}

func q2581() {
    let M = Int(readLine()!)!
    let N = Int(readLine()!)!
    
    var total:[Int] = []
    var isPrime = true
    
    for i in M ... N {
        if i == 1 {
            continue
        }
        var j = 2
        while j * j <= i {
            if i % j == 0 {
                // it's not a prime
                isPrime = false
                break
            }
            j += 1
        }
        if isPrime {
            print(i)
            total.append(i)
        }
        isPrime = true
    }
    
    if total.count >= 1 {
        print(total.reduce(0, { $0 + $1}))
        print(total.first!)
    } else {
        print("-1")
    }
}


//func isPrime(_ num: Int) -> Bool {
//    var i = 2
//    while i*i <= num {
//        if num % i == 0 {
//            return false
//        }
//        i += 1
//    }
//    return true
//}

func prime(_ num: Int) -> Bool {
    var i = 2
    while i * i <= num {
        if num % i == 0 {
            return false
        }
        i += 1
    }
    return true
}

func q1978() {
    let _ = Int(readLine()!) ?? -1
    var ans = 0
    let line = readLine()!.split(separator: " ").map{ Int(String($0))! }
    var i = 0
    while i < line.count {
        if line[i] > 1 && isPrime(line[i]) {
            ans += 1
        }
        i += 1
    }
    print(ans)
}

func q4153() {
    while true {
        let input = readLine()!.split(separator: " ").map{ Int(String($0))! }.sorted()
        
        if input[0] == 0 {
            break
        }
        
        if (input[0] * input[0]) + (input[1] * input[1]) == (input[2] * input[2]) {
            print("right")
        } else {
            print("wrong")
        }
    }
}

func q1085() {
    let xywh = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let ansX = abs(xywh[0] - xywh[2]) < abs(xywh[0] - 0) ? abs(xywh[0] - xywh[2]) : abs(xywh[0] - 0)
    let ansY = abs(xywh[1] - xywh[3]) < abs(xywh[1] - 0) ? abs(xywh[1] - xywh[3]) : abs(xywh[1] - 0)
    print(ansX < ansY ? ansX : ansY)
    
    // best
    print([xywh[0], xywh[1], abs(xywh[0] - xywh[2]), abs(xywh[1] - xywh[3])].min()!)
}

func q11653() {
    let data = Int(readLine()!) ?? -1
    var m = data
    
    var i = 2
    while i <= Int(Double(data).squareRoot()) {
        while m % i == 0 {
            m /= i
            print(i)
        }
        i += 1
    }
    if m != 1 {
        print(m)
    }
}

func q3009() {
//    var x = 0
//    var y = 0
    var arr:[Int] = [Int](repeating: 0, count: 2)
    let xx = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let yy = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let yx = readLine()!.split(separator: " ").map{ Int(String($0))! }
    
    for i in 0 ..< 2 {
        if xx[i] == yy[i] {
            arr[i] = yx[i]
        } else if xx[i] == yx[i] {
            arr[i] = yy[i]
        } else {
            arr[i] = xx[i]
        }
    }
    
    print("\(arr[0]) \(arr[1])")
    
//    if xx[0] == yy[0] {
//        x = yx[0]
//    } else if xx[0] == yx[0] {
//        x = yy[0]
//    } else {
//        x = xx[0]
//    }
//
//    if xx[1] == yy[1] {
//        y = yx[1]
//    } else if xx[1] == yx[1] {
//        y = yy[1]
//    } else {
//        y = xx[1]
//    }
    
//    print("\(x) \(y)")
}

func q2869() {
    let line = readLine()!.split(separator: " ").map{ Int(String($0)) }
    let up: Int = line[0]!
    let down: Int = line[1]!
    let length: Int = line[2]!
    
    var day = (length - down) / (up - down);
     
    // 나머지가 있을 경우 (잔여 블럭이 있을 경우)
    if( (length - down) % (up - down) != 0 ) {
        day += 1
    }
    
//    var count = 0
//    var curr = 0
//
//    while curr < v {
//        curr += a
//        count += 1
//        if curr >= v {
//            break
//        }
//        curr -= b
//    }
    print(day)
}


func q1712() {
    let line = readLine()!.split(separator: " ").map{ UInt(String($0)) }
    let a: UInt = line[0]!
    let b: UInt = line[1]!
    let c: UInt = line[2]!
    
    if c < b || c == b {
        print("-1")
        return
    }
    
//    a + (b * x) > c * x
//    a > (c - b)x
//    a / (c - b) > x
//    x = a / (c - b) + 1
    print(a / (c - b) + 1)
    
//    var i: UInt = 1
//    while a + (b * i) >= c * i {
//        i += 1
//    }
//    print(i)
}

func q1193() {
    let n = Int(readLine()!)!
    
    var k = 1
    var i = 1
    var j = 1
    var reverse = false
    var change = false
    
    while n != k {
        if n == 1 {
            break
        }
        
        if change {
            if reverse {
                i += 1
                j -= 1
            } else {
                i -= 1
                j += 1
            }
            if i == 1 || j == 1 {
                change = false
            }
            
        } else {
            if i == 1 {
                j += 1
            } else if j == 1 {
                i += 1
            }
            change = true
            reverse = !reverse
        }

        k += 1
    }
    
    print("\(i)/\(j)")
}

func q2675() {
    let count = Int(readLine()!)!
    for _ in 0 ..< count {
        let line = readLine()!.split(separator: " ").map{ String($0) }
        var arr:[String] = [String]()
        for item in line[1] {
            for _ in 0 ..< Int(line[0])! {
                arr.append(String(item))
            }
        }
        print(arr.joined(separator: ""))
    }
}

func q1316() {
    let count = Int(readLine()!)!
    var res = count
    for _ in 0 ..< count {
        if let line = readLine() {
            let words = Array(line)
            var arr:[String] = [String]()
            var i = 0
            
            while i < words.count {
                if arr.contains(String(words[i])) {
                    if arr.last == String(words[i]) {
                        arr.append(String(words[i]))
                    } else {
                        res -= 1
                        break
                    }
                } else {
                    arr.append(String(words[i]))
                }

//                if arr.contains(String(words[i])) {
//                    if (String(words[i-1]) == String(words[i])) {
//                        arr.append(String(words[i]))
//                    } else {
//                        res -= 1
//                        break
//                    }
//                } else {
//                    arr.append(String(words[i]))
//                }
                i += 1
            }
        }
    }
    print(res)
}

func q11720() {
    let _ = Int(readLine()!)!
    if let number = readLine() {
        let arr = String(number).compactMap { Int(String($0)) }
        print(arr.reduce(0, { $0 + $1 }))
    }
}

func q1065() {
    let input = Int(readLine()!)!
    var res = input
    var arr:[Int] = [Int]()
    
    if 0 < input && input < 100 {
        res = input
        
    } else if input == 1000 {
        res = 144
        
    } else  {
        res = 99
        for i in 100 ... input {
            var m = i
            while m > 0 {
                let value = m % 10
                arr.append(value)
                m = m / 10
            }
//            arr.reverse()
            if arr[2] - arr[1] == arr[1] - arr[0] {
                print(arr)
                res += 1
            }
            arr.removeAll()
//            let one = i % 10            // 일
//            let two = (i / 10) % 10     // 십
//            let three = (i / 100) % 10  // 백
//            if three - two == two - one {
////                print(three)
////                print(two)
////                print(one)
//                res += 1
//            }

        }
    }
    print(res)
}

func q3052() {
    var nCount:[Int] = [Int]()
    let a = 42
    for _ in 0 ..< 10 {
        let m = Int(readLine()!)! % a
        if nCount.contains(m) {
            continue
        } else {
            nCount.append(m)
        }
    }
    print(nCount.count)
}

func q4344() {
    let nCount = Int(readLine()!)!
    
    for _ in 0 ..< nCount {
        var score = readLine()!.split(separator: " ").map{ Int(String($0))! }
        let numberOfStudent = score.removeFirst()
        let avg = score.reduce(0, { $0 + $1 }) / numberOfStudent
        let overAvg = score.filter{ $0 > avg }
        let overAgeRate = round(((Float(overAvg.count) / Float(numberOfStudent)) * 100) * 1000) / 1000
//        print("\(overAgeRate)%")
        print(String(format: "%.03f%%", overAgeRate))
    }
}

func q2941() {
    let special = ["c=", "c-", "dz=", "d-", "lj", "nj", "s=", "z="]
    
    if let input = readLine() {
        var newInput = input
        
        var i = 0
        while i < special.count {
            if newInput.contains(special[i]) {
                newInput = newInput.replacingOccurrences(of: special[i], with: "a")
            } else {
                i += 1
            }
        }
        
        print(newInput.count)
    }
}


func q1157() {
    if let input = readLine() {
        let lower = input.lowercased()
        var dicAlpha = [String:Int]()
        for item in lower {
            if dicAlpha.contains(where: { $0.0 == String(item) }) {
                dicAlpha[String(item)]! += 1
            } else {
                dicAlpha.updateValue(0, forKey: String(item))
            }
        }
        let maxValues = dicAlpha.filter({ $0.1 == dicAlpha.values.max() })
//        let max = dicAlpha.values.max()
//        let idx1 = dicAlpha.values.firstIndex(of: max!)
//        let idx2 = (dicAlpha.keys as [Int]).firstIndex(of: max!)
        
        print(maxValues.count > 1 ? "?": maxValues.keys.first!.uppercased())
    }
}

func q1152() {
    if let input = readLine() {
        let line = input.split(separator: " ").map{ String($0) }
        print(line.count)
    }
}

func q11654() {
    if let input = readLine(), let ascii = Character(input).asciiValue {
        print(ascii)
    }
}

func q2577() {
//    let line = readLine()!.split(separator: " ").map{ Int(String($0))! }
    var sum = 1
    for _ in 0 ..< 3 {
        sum *= Int(readLine()!)!
    }
    let sorted = String(sum).sorted(by: <)
//    print(sorted)
    
    for i in 0 ..< 10 {
        print(String(sorted).filter { (value: Character) -> Bool in
            return value == Character("\(i)")
        }.count)
    }
    
}

func q1546() {
//    let n = Int(readLine()!)!
    if let num = readLine(), let n = Int(num) {
        if let s = readLine(), s.components(separatedBy: " ").count == n {
            var scores = s.components(separatedBy: " ").map{ Float($0)! }
            
            let max = Array(scores.sorted().reversed())[0]
            
            scores = scores.map { (value: Float) -> Float in
                return (value/max) * 100
            }
            var sum:Float = 0
            for score in scores {
                sum += score
            }
            
            print(sum / Float(scores.count))
        }
    }
}

//func q1110() {
//    var n = readLine()!
//    let target = n
//    var right = q1110GetRight(n)
//    var count = 0
//    var sum = "0"
//    
//    while true {
//        sum = q1110Sum(n)
//        n =  right + q1110GetRight(sum)
//        right = q1110GetRight(sum)
//        
//        count += 1
//        if Int(n) == Int(target) {
//            break
//        }
//    }
//    
//    print(count)
//    
//}

func q1110Sum(_ n: String) -> String {
    var arr = n.map{ String($0) }
    if arr.count == 1 {
        arr.insert("0", at: 0)
    }
    return String(Int(arr[0])! + Int(arr[1])!)
}

func q1110GetRight(_ n: String) -> String {
    var arr = n.map{ String($0) }
    if arr.count == 1 {
        arr.insert("0", at: 0)
    }
    return String(arr[1])
}



func q15552() {
    if let i = Int(readLine()!) {
        for _ in 0 ... i {
            let line = readLine()!.split(separator: " ").map{ Int(String($0))! }
            print(line[0] + line[1])
        }
    }
}

func q2741() {
    if let n = Int(readLine()!) {
        for i in 1 ... n {
            print(i)
        }
    }
    
}

func q10951() {
    while true {
//        let line = readLine()!.split(separator: " ").map{ Int(String($0))! }
        let line = readLine()!.components(separatedBy: " ").map{ Int($0)! }
        if line.count == 0 {
            break
        }
        print(line[0] + line[1])
    }
    
}

/**
 #include <stdio.h>

 int number = 100000;
 int a[1000001];

 void primeNumberSieve() {

     // 1. 배열을 생성하여 초기화한다.
     for(int i=2;i<=number;i++) {
         a[i] = i;
     }

     // 2. 2부터 시작해서 특정 수의 배수에 해당하는 수를 모두 지운다.
     // (지울 때 자기자신은 지우지 않고, 이미 지워진 수는 건너뛴다.)
     for(int i=2;i<=number;i++) {
         if(a[i]==0) continue; // 이미 지워진 수라면 건너뛰기

         // 이미 지워진 숫자가 아니라면, 그 배수부터 출발하여, 가능한 모든 숫자 지우기
         for(int j=2*i;j<=number; j+=i) {
             a[j] = 0;
         }
     }

     // 3. 2부터 시작하여 남아있는 수를 모두 출력한다.
     for(int i=2;i<=number;i++) {
         if(a[i]!=0) printf("%d ", a[i]);
     }
 }

 int main(void) {
     primeNumberSieve();
     return 0;
 }
 */
