class Solution {  //TLE
    func minSwaps(_ nums: [Int]) -> Int {
        var totalNum = 0
        var lastOne = 0
        for i in nums{
            if i == 1{
                totalNum += 1
                lastOne = i
            }
        }
        if totalNum == 0{
            return 0
        }
        
        var lastIndex = -2
        var result = nums.count
        var i = 0
        while i < nums.count{
            if nums[i] == 1{
                
                var swapTime = 0
                var index = i
                var last1 = index
                
                for _ in 0..<totalNum{
                    if nums[index] == 0{
                        swapTime += 1
                    }else{
                        last1 = index
                    }
                    
                    index += 1
                    if index >= nums.count{
                        index -= nums.count
                    }
                }
                
                
                if swapTime < result{
                    result = swapTime
                    if last1 < i{
                        break
                    }
                    i = last1
                }
                
                if result == 0{
                    return 0
                }
            }
            lastIndex = i
            
            i += 1
            if i == lastOne{
                break
            }
        }
        return result
    }
}

class Solution2 {
    func minSwaps(_ n: [Int]) -> Int {
        var nums: [Int] = []
        var count = 0
        var totalOne = 0
        var temp = 0
        for i in n{
            if i == 1{
               temp += 1
            }
        }
        if temp >= (n.count / 2){ //1
            for i in n{
                if i == 0{
                    nums.append(count)
                    if count != 0{
                        nums.append(0)
                    }
                    count = 0
                }else{
                    totalOne += 1
                    count += 1
                }
            }
            if count != 0{
                nums.append(count)
            }
        }else{ //0
            for i in n{
                if i == 1{
                    nums.append(count)
                    if count != 0{
                        nums.append(0)
                    }
                    count = 0
                }else{
                    totalOne += 1
                    count += 1
                }
            }
            if count != 0{
                nums.append(count)
            }
        }
        
        var result = n.count
        for i in 0..<nums.count{
            if nums[i] != 0{
                if nums[i] == totalOne{
                    return 0
                }
                
                var index = i
                var count = 0
                var time = 0
                
                while count < totalOne{
                    count += nums[index] == 0 ? 1 : nums[index]
                    time += nums[index] == 0 ? 1 : 0
                    index += 1
                    
                    if index == nums.count{
                        index -= nums.count
                    }
                }
                
                result = min(result, time)
            }
        }
        
        return result
    }
}

class Solution3 {
    func minSwaps(_ nums: [Int]) -> Int {
        var totalNum = 0
        for i in nums{
            if i == 1{
                totalNum += 1
            }
        }
        if totalNum == 0{
            return 0
        }
        var left = 0; var right = nums.count - 1
        for i in nums{
            if i == 0{
                left += 1
            }else{
                right -= 1
            }
            if right < left{
                return 0
            }
            if right - left - 1 == totalNum{
                break
            }
        }
        if left == 0{
            return 0
        }
        var result = 0
        for i in nums[left..<right]{
            if i == 0{
                result += 1
            }
        }
        
        return result
    }
}

let sol = Solution3()
print(sol.minSwaps([0,1,0,1,1,0,0])) // 1
print(sol.minSwaps([0,1,1,1,0,0,1,1,0]))// 2
print(sol.minSwaps([1,1,0,1,0,1]))// 0
print(sol.minSwaps([1]))// 0
