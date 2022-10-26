class Solution { // TLE
    func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
        let nums = nums.map { $0 % k }
        for i in 0 ..< nums.count - 1 {
            var tmp = nums[i]
            for j in i + 1 ..< nums.count {
                tmp += nums[j]
                if tmp % k == 0 {
                    return true
                }
            }
        }
        return false
    }
}

class Solution2 { // HashSet
    func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
        var set = Set<Int>()
        var sum = 0, lastRemainder = 0
        for i in nums {
            sum += i
            let r = sum % k
            if set.contains(r) {
                return true
            } else {
                set.insert(lastRemainder)
                lastRemainder = r
            }
        }
        return false
    }
}

class Solution3 { // HashMap
    func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
        var sum = 0
        var rMap = [0: -1]
        for i in 0 ..< nums.count {
            sum += nums[i]
            let r = sum % k
            if let index = rMap[r] {
                if index + 1 < i {
                    return true
                }
            } else {
                rMap[r] = i
            }
        }
        return false
    }
}

let sol = Solution3()
print(sol.checkSubarraySum([23, 2, 4, 6, 7], 6))
print(sol.checkSubarraySum([23, 2, 4, 6, 7, 231, 5, 463, 34, 52, 16, 786, 32, 2, 34, 5, 68, 32, 654], 13))
print(sol.checkSubarraySum([5, 0, 0, 0], 3))
