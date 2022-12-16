class Solution {
    func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
        var result = [(Int, Int)]()
        for (index, i) in mat.enumerated() {
            result.append((index, i.reduce(0, +)))
        }
        result.sort { $0.1 < $1.1 }
        var ans = [Int]()
        for i in 0 ..< k {
            ans.append(result[i].0)
        }
        return ans
    }
}
