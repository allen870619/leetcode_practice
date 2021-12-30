class Solution {
    func smallestRepunitDivByK(_ k: Int) -> Int {
        if k % 2 == 0{
            return -1
        }
        
        var remaining = 1
        var count = 1
        var appear: Set<Int> = []
        
        while true{
            if remaining % k == 0{
                return count
            }
            if appear.contains(remaining){
                return -1
            }
            appear.insert(remaining)
            remaining = (remaining * 10 + 1) % k
            count += 1
        }
        return -1
    }
}

let sol = Solution()
print(sol.smallestRepunitDivByK(1))
print(sol.smallestRepunitDivByK(2))
print(sol.smallestRepunitDivByK(3))
print(sol.smallestRepunitDivByK(23))
print(sol.smallestRepunitDivByK(5))
print(sol.smallestRepunitDivByK(15))
