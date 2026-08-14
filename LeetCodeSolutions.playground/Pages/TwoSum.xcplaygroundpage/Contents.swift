import UIKit

//MARK: TWO SUM
class Solution {
    //O(n^2)
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for i in 0..<nums.count {
            for j in (i + 1)..<nums.count {
                if nums[i] + nums[j] == target {
                    return [i, j]
                }
            }
        }
        return []
    }

    //Using dictionary (O(n)) -> Key ile arama
    func twoSumHash(_ nums: [Int], _ target: Int) -> [Int] {
        var map: [Int: Int] = [:] // Value : Key(index)
        for (i, num) in nums.enumerated() { // .enumerated -> [key:value]
            let complement = target - num
            if let j = map[complement] { //Sayıyı verip indexi arıyorum
                return [j, i] //j, map'e daha önce eklenmiş bir index
            }
            map[num] = i
        }
        return []
    }
}

let solution = Solution()
print(solution.twoSum([5,7,11], 18))
print(solution.twoSumHash([5,7,11], 18))

