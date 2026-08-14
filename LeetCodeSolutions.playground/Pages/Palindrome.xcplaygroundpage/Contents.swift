//: [Previous](@previous)

import Foundation
import SwiftUI


class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 || (x % 10 == 0 && x != 0) { return false }

        var firstIndex: Int = 0
        let newX = Array(String(x))
        var lastIndex = newX.count - 1   // dikkat: son geçerli index, count değil

        while firstIndex < lastIndex {
            if newX[firstIndex] == newX[lastIndex] {
                firstIndex += 1
                lastIndex -= 1
            } else {
                return false
            }
        }

        return true
    }
}

class Solution2 {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 || (x % 10 == 0 && x != 0) {return false}

        var original = x
        var reversedHalf = 0

        while original > reversedHalf{
            reversedHalf = reversedHalf * 10 + original % 10
            original /= 10
        }

        return (original == reversedHalf) || (original == reversedHalf / 10)
    }
}


//Fastest
class Solution3 {
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else { return false }
        guard x > 9 else { return true }

        var remain = x
        var res = 0
        while remain > 0 {
            let v = remain % 10 //En sağdaki rakamı al
            res *= 10 //Bir basamak sola kaydır
            res += v //Sonuna ekle. Böylece ters yapıyorsun
            remain /= 10
        }
        return x == res
    }
}

let solution = Solution()
let solution2 = Solution()
let solution3 = Solution()

print(solution.isPalindrome(1212)) // false
print(solution2.isPalindrome(1221)) // true
print(solution3.isPalindrome(121)) // true
