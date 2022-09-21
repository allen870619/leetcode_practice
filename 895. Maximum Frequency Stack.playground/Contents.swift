// my ans, slower

class FreqStack {
    var stack = [Int]()
    var map = [Int: Int]()
    var maxTotal = 0
    var maxSet = Set<Int>()
    init() {}

    func push(_ val: Int) {
        stack.append(val)
        if map[val] == nil {
            map[val] = 1
        } else {
            map[val]! += 1
        }
        if map[val]! > maxTotal {
            maxSet = [val]
            maxTotal = map[val]!
        } else if map[val]! == maxTotal {
            maxSet.insert(val)
        }
    }

    func pop() -> Int {
        if maxSet.isEmpty {
            maxTotal = 0
            for i in map.sorted(by: { $0.value > $1.value }) {
                if i.value >= maxTotal {
                    maxTotal = i.value
                    maxSet.insert(i.key)
                } else {
                    break
                }
            }
        }

        var pointer = stack.count - 1
        while pointer >= 0 {
            if maxSet.contains(stack[pointer]) {
                map[stack[pointer]]! -= 1
                maxSet.remove(stack[pointer])
                return stack.remove(at: pointer)
            }
            pointer -= 1
        }
        return 0
    }
}

// by solution, using stack of stack to store freq of nums
class FreqStack2 {
    var freq = [Int: Int]()
    var freqGroup = [Int: [Int]]()
    var maxFreq = 0
    init() {}

    func push(_ val: Int) {
        if freq[val] == nil {
            freq[val] = 1
        } else {
            freq[val]! += 1
        }
        if freq[val]! > maxFreq {
            maxFreq = freq[val]!
        }

        if freqGroup[freq[val]!] == nil {
            freqGroup[freq[val]!] = [val]
        } else {
            freqGroup[freq[val]!]?.append(val)
        }
    }

    func pop() -> Int {
        let max = freqGroup[maxFreq]!.popLast()!
        freq[max]! -= 1
        if freqGroup[maxFreq]!.count == 0 {
            maxFreq -= 1
        }
        return max
    }
}
