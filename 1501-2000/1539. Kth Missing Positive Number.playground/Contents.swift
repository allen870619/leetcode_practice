class Solution2 {
    func findKthPositive(_ arr: [Int], _ k: Int) -> Int {
        var left = 0, right = arr.count - 1

        while left <= right {
            let mid = (left + right) / 2
            if arr[mid] - mid - 1 < k {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return left + k
    }
}

class Solution {
    func findKthPositive(_ arr: [Int], _ k: Int) -> Int {
        var count = 1, k = k
        var pointer = 0
        while k > 0 {
            if pointer < arr.count, arr[pointer] == count {
                pointer += 1
            } else {
                k -= 1
            }
            if k == 0 {
                break
            }
            count += 1
        }

        return count
    }
}

let sol = Solution2()
print(sol.findKthPositive([2, 3, 4, 7, 11], 5))
print(sol.findKthPositive([1, 2, 3, 4], 2))
print(sol.findKthPositive([1, 2], 1))
