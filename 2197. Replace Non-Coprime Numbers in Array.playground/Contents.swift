class Solution {
    func replaceNonCoprimes(_ nums: [Int]) -> [Int] {
        var nums = nums
        var point = 0
        while point < nums.count - 1{
            if nums[point] == 1 || nums[point+1] == 1{
                point += 1
            }else{
                let g = gcd(nums[point], nums[point + 1])
                if g != 1{
                    let min = nums[point] * nums[point + 1] / g
                    nums[point] = min
                    nums.remove(at: point + 1)
                    if point > 0{
                        point -= 1
                    }
                }else{
                    point += 1
                }
            }
        }
        return nums
    }
    
    private func gcd(_ a: Int, _ b: Int) -> Int{
        let r = a % b
        if r != 0 {
            return gcd(b, r)
        } else {
            return b
        }
    }
}

let sol = Solution()
print(sol.replaceNonCoprimes([6,4,3,2,7,6,2]))
print(sol.replaceNonCoprimes([2,2,1,1,3,3,3]))
print(sol.replaceNonCoprimes([287,41,49,287,899,23,23,20677,5,825]))
