class Solution {
    func pushDominoes(_ dominoes: String) -> String {
        var refDominoes = [Character](dominoes)
        var dominoes = refDominoes
        let total = refDominoes.count
        var mark = Array(repeating: false, count: dominoes.count)

        func calPush(_ index: Int) {
            var tmp = index
            mark[index] = true

            // cal edge
            if dominoes[index] == "L" {
                tmp -= 1
                while tmp >= 0 {
                    if refDominoes[tmp] == refDominoes[index] {
                        for i in tmp + 1 ... index {
                            dominoes[i] = dominoes[index]
                            mark[i] == true
                        }
                        if !mark[tmp] {
                            calPush(tmp)
                        }
                        return
                    } else if refDominoes[tmp] != "." {
                        break
                    }
                    tmp -= 1
                }
            } else {
                tmp += 1
                while tmp < total {
                    if refDominoes[tmp] == refDominoes[index] {
                        for i in index ..< tmp {
                            dominoes[i] = dominoes[index]
                            mark[i] == true
                        }
                        if !mark[tmp] {
                            calPush(tmp)
                        }
                        return
                    } else if refDominoes[tmp] != "." {
                        break
                    }
                    tmp += 1
                }
            }

            // over bounds
            if tmp < 0 {
                for i in 0 ... index {
                    dominoes[i] = dominoes[index]
                    mark[i] == true
                }
                return
            } else if tmp >= total {
                for i in index ..< total {
                    dominoes[i] = dominoes[index]
                    mark[i] == true
                }
                return
            }

            // append new value
            if tmp > index {
                let end = (tmp + index) / 2 - ((tmp + index) % 2 == 0 ? 1 : 0)
                for i in index ... end {
                    dominoes[i] = "R"
                    mark[i] = true
                }
            } else {
                for i in ((tmp + index) / 2 + 1) ... index {
                    dominoes[i] = "L"
                    mark[i] = true
                }
            }
            if tmp >= 0, tmp < dominoes.count, !mark[tmp] {
                calPush(tmp)
            }
        }

        for i in 0 ..< dominoes.count {
            if dominoes[i] != ".", !mark[i] {
                calPush(i)
            }
        }
        return String(dominoes)
    }
}

class Solution2 { // by solution
    func pushDominoes(_ dominoes: String) -> String {
        let dominoes = [Character](dominoes)
        var leftForce = Array(repeating: 0, count: dominoes.count)
        var rightForce = Array(repeating: 0, count: dominoes.count)
        let maxF = dominoes.count

        var leftF = 0, rightF = 0
        for i in 0 ..< maxF {
            if dominoes[i] == "R" {
                leftF = maxF
            } else if dominoes[i] == "L" {
                leftF = 0
            }
            leftForce[i] = leftF
            if leftF > 0 {
                leftF -= 1
            }
        }

        for i in stride(from: maxF - 1, through: 0, by: -1) {
            if dominoes[i] == "L" {
                rightF = -maxF
            } else if dominoes[i] == "R" {
                rightF = 0
            }
            rightForce[i] = rightF
            if rightF < 0 {
                rightF += 1
            }
        }

        var result = ""
        for i in 0 ..< dominoes.count {
            let combine = leftForce[i] + rightForce[i]
            if combine > 0 {
                result += "R"
            } else if combine == 0 {
                result += "."
            } else {
                result += "L"
            }
        }
        return result
    }
}

let sol = Solution2()
print(sol.pushDominoes("RR.L"))
print(sol.pushDominoes("R...L"))
print(sol.pushDominoes(".L.R...LR..L.."))
