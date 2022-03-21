// greedy
class Solution2 {
    func partitionLabels(_ s: String) -> [Int] {
        let s = [Character](s)
        var lastList = Array(repeating: 0, count: 26)
        for i in 0..<26{
            if let index = s.lastIndex(of: Character(UnicodeScalar(i + 97)!)){
                lastList[i] = index
            }
        }
        var length = 0
        var anchor = 0
        var result = [Int]()
        for (i, c) in s.enumerated(){
            length = max(length, lastList[Int(c.asciiValue!) - 97])
            if i == length{
                result.append(length - anchor + 1)
                anchor = i + 1
            }
        }
        return result
    }
}

// me
class Solution {
    func partitionLabels(_ s: String) -> [Int] {
        var dict = [Character: (l: Int, r: Int)]()
        for (i, c) in s.enumerated(){
            if dict[c] == nil{
                dict[c] = (i, i)
            }else{
                dict[c]?.r = i
            }
        }
        let list = dict.sorted(by: {$0.value.l < $1.value.l})
        var left = list[0].value.l
        var right = list[0].value.r
        var result = [Int]()
        for i in list[1...]{
            if i.value.l > right{
                result.append(right - left + 1)
                left = i.value.l
                right = i.value.r
            }else if i.value.r > right{
                right = i.value.r
            }
        }
        result.append(right - left + 1)
        return result
    }
}
let sol = Solution2()
print(sol.partitionLabels("ababcbacadefegdehijhklij"))
print(sol.partitionLabels("eccbbbbdec"))

