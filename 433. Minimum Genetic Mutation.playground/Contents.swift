class Solution {
    func minMutation(_ start: String, _ end: String, _ bank: [String]) -> Int {
        var ran = [Int: Bool]()
        var tmpList = [start]
        var result = 0
        for i in 0 ..< bank.count {
            ran[i] = false
        }

        while !tmpList.isEmpty {
            result += 1
            for _ in tmpList {
                let str = tmpList.removeFirst()
                for (index, i) in bank.enumerated() {
                    if compare(str, i), !(ran[index] ?? false) {
                        if i == String(end) {
                            return result
                            break
                        }
                        ran[index] = true
                        tmpList.append(i)
                    }
                }
            }
        }
        return -1
    }

    private func compare(_ lhs: String, _ rhs: String) -> Bool {
        var diff = 0
        let lhs = [Character](lhs)
        let rhs = [Character](rhs)
        for i in 0 ..< 8 {
            if lhs[i] != rhs[i] {
                diff += 1
                if diff > 1 {
                    return false
                }
            }
        }
        return diff == 1
    }
}
