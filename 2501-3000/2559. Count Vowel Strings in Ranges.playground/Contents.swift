class Solution {
    func vowelStrings(_ words: [String], _ queries: [[Int]]) -> [Int] {
        let vowel: [Character] = ["a", "e", "i", "o", "u"]
        var result = [Int]()
        var sum = Array(repeating: 0, count: words.count)

        // sum up
        for (index, word) in words.enumerated() {
            let check = vowel.contains(word.first!) && vowel.contains(word.last!)

            if index >= 1 {
                sum[index] += (check ? 1 : 0) + sum[index - 1]
            } else {
                sum[index] = check ? 1 : 0
            }
        }

        // calculate interval
        for i in queries {
            let start = i[0], end = i[1]
            if start == 0 {
                result.append(sum[end])
            } else {
                result.append(sum[end] - sum[start - 1])
            }
        }
        return result
    }
}
