class Solution {
    func minimumDeviation(_ nums: [Int]) -> Int {
        var set = [Int]()
        for num in nums {
            let val = num * (num % 2 == 1 ? 2 : 1)
            set.append(val)
        }
        set.sort()

        var result = set.last! - set.first!
        while set.last! % 2 == 0 {
            insert(arr: &set, set.last! / 2)
            set.removeLast()
            result = min(result, set.last! - set.first!)
        }

        return result
    }

    func insert(arr: inout [Int], _ target: Int) {
        if arr.isEmpty {
            arr.append(target)
            return
        }

        var left = 0
        var right = arr.count - 1
        while left < right {
            var mid = (left + right) / 2
            if arr[mid] < target {
                left = mid + 1
            } else {
                right = mid
            }
        }

        if arr[left] == target {
            return
        } else if arr[left] < target {
            arr.insert(target, at: left + 1)
        } else {
            arr.insert(target, at: left)
        }
    }
}

class Solution2 { // TLE
    func minimumDeviation(_ nums: [Int]) -> Int {
        var set = Set<Int>()
        for num in nums {
            let val = num * (num % 2 == 1 ? 2 : 1)
            set.insert(val)
        }

        var result = set.max()! - set.min()!
        while set.max()! % 2 == 0 {
            let maxD = set.max()!
            set.remove(maxD)
            set.insert(maxD / 2)
            result = min(result, set.max()! - set.min()!)
        }

        return result
    }
}

let sol = Solution()
print(sol.minimumDeviation([1, 2, 3, 4]))
print(sol.minimumDeviation([4, 1, 5, 20, 3]))
print(sol.minimumDeviation([2, 10, 8]))
print(sol.minimumDeviation([16, 6]))
print(sol.minimumDeviation([3, 5]))
print(sol.minimumDeviation([610, 778, 846, 733, 395]))
