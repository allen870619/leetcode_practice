class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict = [[Character]: [String]]()

        for i in strs {
            let anagrams = [Character](i).sorted()
            dict[anagrams, default: []].append(i)
        }

        return dict.map(\.value)
    }
}

class Solution2 {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict = [[Character]: [String]]()

        for i in strs {
            let anagrams = [Character](i).sorted()
            dict[anagrams, default: []].append(i)
        }

        var result = [[String]]()
        for i in dict {
            result.append(i.value)
        }
        return result
    }
}
