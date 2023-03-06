class Solution {
    func reverseWords(_ s: String) -> String {
        var tmp = "", arr = [String]()
        for i in s {
            if i == " " {
                if !tmp.isEmpty {
                    arr.append(tmp)
                    tmp.removeAll()
                }
            } else {
                tmp.append(i)
            }
        }
        if !tmp.isEmpty {
            arr.append(tmp)
        }

        var res = arr.reversed().map {
            "\($0) "
        }.reduce("", +)
        res.popLast()
        return res
    }
}
