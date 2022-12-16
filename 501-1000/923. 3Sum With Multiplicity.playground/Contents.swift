class Solution {
    func threeSumMulti(_ arr: [Int], _ target: Int) -> Int {
        var count = Array(repeating: 0, count: 301)
        for i in arr {
            count[i] += 1
        }
        let mod = 1_000_000_007
        let kind = Set(arr).sorted()
        var total = 0

        // three
        for i in kind {
            if i * 3 == target, count[i] >= 3 {
                total += choose(count[i], 3) % mod
            }
        }

        // two
        for i in kind {
            for j in kind {
                if i * 2 + j == target, i != j, count[i] >= 2 {
                    print("\(i) \(j)")
                    total += choose(count[i], 2) * count[j] % mod
                }
            }
        }

        // one
        if kind.count > 2 {
            for i in 0 ..< kind.count - 2 {
                for j in i + 1 ..< kind.count - 1 {
                    for k in j + 1 ..< kind.count {
                        if kind[i] + kind[j] + kind[k] == target {
                            total += count[kind[i]] * count[kind[j]] * count[kind[k]] % mod
                        }
                    }
                }
            }
        }

        return total
    }

    private func choose(_ i: Int, _ total: Int) -> Int {
        if i <= 1 || total == 0 {
            return 1
        }
        return i * choose(i - 1, total - 1) / total % 1_000_000_007
    }
}

let sol = Solution()
print(sol.threeSumMulti([1, 1, 2, 2, 3, 3, 4, 4, 5, 5], 8))
print(sol.threeSumMulti([1, 1, 2, 2, 2, 2], 5))
print(sol.threeSumMulti([1, 2, 3, 3, 1], 5))
// print(sol.choose(12, 3))
