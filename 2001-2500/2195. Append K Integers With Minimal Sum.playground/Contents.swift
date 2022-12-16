class Solution {
    func minimalKSum(_ nums: [Int], _ k: Int) -> Int {
        var nums = Set(nums).sorted()
        var except = (1 + k) * k / 2
        var last = k
        for i in nums {
            if i <= last {
                except -= i
                last += 1
                except += last
            } else {
                break
            }
        }
        return except
    }
}

let sol = Solution()
print(sol.minimalKSum([1, 4, 25, 10, 25], 2))
print(sol.minimalKSum([5, 6], 6))
print(sol.minimalKSum([1_000_000], 1_000_000))
print(sol.minimalKSum([96, 44, 99, 25, 61, 84, 88, 18, 19, 33, 60, 86, 52, 19, 32, 47, 35, 50, 94, 17, 29, 98, 22, 21, 72, 100, 40, 84],
                      35))
