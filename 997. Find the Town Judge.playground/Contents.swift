class Solution { // need optimized
    func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
        if trust.isEmpty{
            if n > 1{
                return -1
            }else{
                return 1
            }
        }
        
        var dict: [Set<Int>] = Array.init(repeating: [], count: n+1)
        for i in trust{
            dict[i[0]].insert(i[1])
        }

        var mayTrust: [Int] = []
        for i in 1...n{
            if dict[i].isEmpty{
                mayTrust.append(i)
            }
        }
        
        while !mayTrust.isEmpty{
            let k = mayTrust.popLast()!
            var doesntContain = false
            for i in 1...n{
                if i != k{
                    if dict[i].isEmpty || !dict[i].contains(k){
                        doesntContain = true
                        break
                    }
                }
            }
            if !doesntContain{
                return k
            }
        }
        return -1
    }
}

let sol = Solution()
print(sol.findJudge(3, [[1,3],[2,3]]))
print(sol.findJudge(2, [[1,2]]))
print(sol.findJudge(3, [[1,3],[2,3],[3,1]]))
print(sol.findJudge(4, [[1,3],[1,4],[2,3]]))
