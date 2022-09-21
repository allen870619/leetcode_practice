class Solution {
    func minimumCardPickup(_ cards: [Int]) -> Int {
        var dict = [Int: [Int]]()
        var dis = [Int: Int]()
        for (index, i) in cards.enumerated() {
            if dict[i] == nil {
                dict[i] = [index]
            } else {
                let d = index - dict[i]!.last! + 1
                if dis[i] == nil {
                    dis[i] = d
                } else if d < dis[i]! {
                    dis[i] = d
                }
                dict[i]!.append(index)
            }
        }
        let a = dis.sorted(by: { $0.value < $1.value })
        return a.first?.value ?? -1
    }
}

class Solution2 { // slow
    func minimumCardPickup(_ cards: [Int]) -> Int {
        var dict = Array(repeating: [Int](), count: 1_000_000)
        var dis = Array(repeating: Int.max, count: 1_000_000)
        for (index, i) in cards.enumerated() {
            if dict[i].isEmpty {
                dict[i].append(index)
            } else {
                let d = index - dict[i].last! + 1
                if d < dis[i] {
                    dis[i] = d
                }
                dict[i].append(index)
            }
        }
        return dis.min() == Int.max ? -1 : dis.min() as! Int
    }
}

let sol = Solution()
print(sol.minimumCardPickup([3, 4, 2, 3, 4, 7]))
print(sol.minimumCardPickup([1, 0, 5, 3]))
print(sol.minimumCardPickup([77, 10, 11, 51, 69, 83, 33, 94, 0, 42, 86, 41, 65, 40, 72, 8, 53, 31, 43, 22, 9, 94, 45, 80, 40, 0, 84, 34, 76, 28, 7, 79, 80, 93, 20, 82, 36, 74, 82, 89, 74, 77, 27, 54, 44, 93, 98, 44, 39, 74, 36, 9, 22, 57, 70, 98, 19, 68, 33, 68, 49, 86, 20, 50, 43]))
