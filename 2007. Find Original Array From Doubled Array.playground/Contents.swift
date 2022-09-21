class Solution {
    func findOriginalArray(_ changed: [Int]) -> [Int] {
        var dict = [Int: Int]()
        for i in changed {
            dict[i, default: 0] += 1
        }
        var result = [Int]()

        for i in dict.keys.sorted() {
            if let ori = dict[i], ori > 0 {
                if let double = dict[i * 2], double > 0, double >= ori {
                    if i == 0 {
                        for _ in 0 ..< dict[i]! / 2 {
                            result.append(i)
                        }
                    } else {
                        for _ in 0 ..< dict[i]! {
                            result.append(i)
                        }
                        dict[i * 2]? -= ori
                    }
                    dict[i] = 0
                }
            }
        }

        return result.count * 2 == changed.count ? result : []
    }
}

let sol = Solution()
print(sol.findOriginalArray([0, 0, 0, 0]))
print(sol.findOriginalArray([1, 3, 4, 2, 6, 8]))
print(sol.findOriginalArray([0, 3, 2, 4, 6, 0]))
print(sol.findOriginalArray([1, 2, 3, 2, 4, 6, 2, 4, 6, 4, 8, 12]))
print(sol.findOriginalArray([2, 4, 4, 2]))
