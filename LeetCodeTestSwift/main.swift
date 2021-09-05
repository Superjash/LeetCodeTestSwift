//
//  main.swift
//  LeetCodeTestSwift
//
//  Created by Jash on 2020/7/11.
//  Copyright © 2020 Jash. All rights reserved.
//

import Foundation

print("Hello, World!")
let begin = Date().timeIntervalSince1970

let value = Solution().allPathsSourceTarget([[4,3,1],[3,2,4],[3],[4],[]])
print("result \(value)")

//let value = Solution().solveNQueens(9)
//print("result \(value)")

let end = Date().timeIntervalSince1970
print("time consumed \((end - begin)) s")


// MARK: 797. 所有可能的路径
// https://leetcode-cn.com/problems/all-paths-from-source-to-target/
// DFS、BFS再写一遍
class Solution {
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        return []
    }
}

// MARK: 787. K 站中转内最便宜的航班
// https://leetcode-cn.com/problems/cheapest-flights-within-k-stops/
// 看看题解有没有更好的办法

// MARK: 51. N 皇后
// https://leetcode-cn.com/problems/n-queens/
// 回溯法再写一遍
//class Solution {
//    func solveNQueens(_ n: Int) -> [[String]] {
//    }
//}

// MARK: ⚠️⚠️⚠️LeetCode 未解决
// MARK: 403. 青蛙过河
// https://leetcode-cn.com/problems/frog-jump/
/*
 用例超时
 Solution().canCross([0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403,404,405,406,407,408,409,410,411,412,413,414,415,416,417,418,419,420,421,422,423,424,425,426,427,428,429,430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446,447,448,449,450,451,452,453,454,455,456,457,458,459,460,461,462,463,464,465,466,467,468,469,470,471,472,473,474,475,476,477,478,479,480,481,482,483,484,485,486,487,488,489,490,491,492,493,494,495,496,497,498,499,500,501,502,503,504,505,506,507,508,509,510,511,512,513,514,515,516,517,518,519,520,521,522,523,524,525,526,527,528,529,530,531,532,533,534,535,536,537,538,539,540,541,542,543,544,545,546,547,548,549,550,551,552,553,554,555,556,557,558,559,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,575,576,577,578,579,580,581,582,583,584,585,586,587,588,589,590,591,592,593,594,595,596,597,598,599,600,601,602,603,604,605,606,607,608,609,610,611,612,613,614,615,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639,640,641,642,643,644,645,646,647,648,649,650,651,652,653,654,655,656,657,658,659,660,661,662,663,664,665,666,667,668,669,670,671,672,673,674,675,676,677,678,679,680,681,682,683,684,685,686,687,688,689,690,691,692,693,694,695,696,697,698,699,700,701,702,703,704,705,706,707,708,709,710,711,712,713,714,715,716,717,718,719,720,721,722,723,724,725,726,727,728,729,730,731,732,733,734,735,736,737,738,739,740,741,742,743,744,745,746,747,748,749,750,751,752,753,754,755,756,757,758,759,760,761,762,763,764,765,766,767,768,769,770,771,772,773,774,775,776,777,778,779,780,781,782,783,784,785,786,787,788,789,790,791,792,793,794,795,796,797,798,799,800,801,802,803,804,805,806,807,808,809,810,811,812,813,814,815,816,817,818,819,820,821,822,823,824,825,826,827,828,829,830,831,832,833,834,835,836,837,838,839,840,841,842,843,844,845,846,847,848,849,850,851,852,853,854,855,856,857,858,859,860,861,862,863,864,865,866,867,868,869,870,871,872,873,874,875,876,877,878,879,880,881,882,883,884,885,886,887,888,889,890,891,892,893,894,895,896,897,898,899,900,901,902,903,904,905,906,907,908,909,910,911,912,913,914,915,916,917,918,919,920,921,922,923,924,925,926,927,928,929,930,931,932,933,934,935,936,937,938,939,940,941,942,943,944,945,946,947,948,949,950,951,952,953,954,955,956,957,958,959,960,961,962,963,964,965,966,967,968,969,970,971,972,973,974,975,976,977,978,979,980,981,982,983,984,985,986,987,988,989,990,991,992,993,994,995,996,997,998,99999999])
 */
/*
class Solution {
    var resultDic: [String: Bool] = [:]
    var reachableDic: [String: [Int]] = [:]
    
    func canCross(_ stones: [Int]) -> Bool {
        guard let first = stones.first, first == 0, let last = stones.last else {
            return false
        }
        return jump(from: 0, to: last, k: 0, stones: stones)
    }
    
    func jump(from: Int, to: Int, k: Int, stones: [Int]) -> Bool {
        let reachable = reachableStones(current: from, preK: k, stones: stones)
        if reachable.contains(to) {
            return true
        }
        let key = "\(from)+\(k)"
        if let result = self.resultDic[key] {
            print("命中 resultDic")
            return result
        }
        for stone in reachable {
            let thisK = stone - from
            if jump(from: stone, to: to, k: thisK, stones: stones) {
                return true
            }
        }
        self.resultDic[key] = false
        return false
    }
    
    // 找下一块可达的石头，可能有多个也可能没有
    func reachableStones(current: Int, preK: Int, stones: [Int]) -> [Int] {
        // 结果检查
        let key = "\(current)+\(preK)"
        if let reachable = self.reachableDic[key] {
            print("命中 reachableDic")
            return reachable
        }
        
        var reachable: [Int] = []
        var thisK = preK - 1
        if thisK > 0 { // 不能跳0个格子也不能往回跳
            if stones.contains(thisK + current) {
                reachable.append(thisK + current)
            }
        }
        thisK = preK
        if thisK > 0 { // 不能跳0个格子也不能往回跳
            if stones.contains(thisK + current) {
                reachable.append(thisK + current)
            }
        }
        thisK = preK + 1
        if stones.contains(thisK + current) {
            reachable.append(thisK + current)
        }
        print("当前 \(current) 上次跳 \(preK) 可达 \(reachable)")
        self.reachableDic[key] = reachable
        return reachable
    }
}
 */

/*
// MARK:  486. 预测赢家
// https://leetcode-cn.com/problems/predict-the-winner/
class Solution {
    func PredictTheWinner(_ nums: [Int]) -> Bool {
        if nums.count % 2 == 0 {
            return true
        }
        var head = 0
        var tail = nums.count - 1

        return false
    }

    func findMaxGap(_ head: Int, _ tail: Int, _ nums: [Int]) -> Int {


        return 0
    }
}
 */

/*
// MARK: 4. 寻找两个正序数组的中位数
// https://leetcode-cn.com/problems/median-of-two-sorted-arrays/
class Question4 {
    func solve() {
        
    }
}
 */

/*
// MARK: 3. 无重复字符的最长子串
// https://leetcode-cn.com/problems/longest-substring-without-repeating-characters/
class Question3 {
    func solve() {
        var str = "abcdefghijklmnopqrstuvwxyz"
        str.append("bcdefghijklmnopqrstuvwxyz")
        str.append("cdefghijklmnopqrstuvwxyz")
        str.append("defghijklmnopqrstuvwxyz")
        str.append("efghijklmnopqrstuvwxyz")
        str.append("fghijklmnopqrstuvwxyz")
        str.append("ghijklmnopqrstuvwxyz")
        str.append("hijklmnopqrstuvwxyz")
        let begin = Date().timeIntervalSince1970
        let result = lengthOfLongestSubstring1(str)
        let end = Date().timeIntervalSince1970
        let time = (end - begin) * 1000
        print("\(result), time \(time) ms");
    }
    
    // jash to do 算法有问题, 形如 ..a,,,,a 只能统计到 a,,,,a这部分, 而无法校验 .. 和 ,,,, 之间有没有重复
    func lengthOfLongestSubstring2(_ s: String) -> Int {
        var maxLength = 0
        var maxLengthBeginIndex = 0;
        var dic: [Character: Int] = [:]
        var index = 0
        for ch in s {
            if let value = dic[ch] {
                let length = index - value
                if length > maxLength && value > maxLengthBeginIndex {
                    print(".... \(index), \(ch), \(length)")
                    maxLength = length
                    maxLengthBeginIndex = value
                }
            }
            dic[ch] = index
            index += 1
        }
        return maxLength
    }
    
    func lengthOfLongestSubstring1(_ s: String) -> Int {
        var maxLength = 0
        for i in 0..<s.count {
            // 逐个取子字符串
            let currentString = s.suffix(s.count - i)
            var currentContainer = ""
            for ch in currentString {
                if (currentContainer.contains(ch)) {
                    break
                } else {
                    currentContainer.append(ch)
                }
            }
            if currentContainer.count > maxLength {
                maxLength = currentContainer.count
            }
            
        }
        return maxLength
    }
}
 */

// MARK: ⚠️⚠️⚠️LeetCode 已解决
/*
// MARK: 797. 所有可能的路径
// https://leetcode-cn.com/problems/all-paths-from-source-to-target/
class Solution {
    var cacheMap: [Int: [[Int]]] = [:]
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        let result = find(0, graph.count - 1, graph, [0])
        return result
    }
    
    func find(_ src: Int, _ dest: Int, _ graph: [[Int]], _ path: [Int]) -> [[Int]] {
        if let cacheValue = cacheMap[src] {
            var result: [[Int]] = []
            for cache in cacheValue {
                var r = path
                r.append(contentsOf: cache)
                result.append(r)
            }
            return result
        }
        var result: [[Int]] = []
        let srcCanReach = graph[src]
        for canReach in srcCanReach {
            if canReach == dest {
                var p = path
                p.append(dest)
                result.append(p)
            } else {
                var newPath = path
                newPath.append(canReach)
                let findResult = find(canReach, dest, graph, newPath)
                for fr in findResult {
                    if fr.last == dest {
                        result.append(fr)
                    }
                }
            }
        }
        var cacheValue: [[Int]] = []
        for r in result {
            cacheValue.append(Array(r.suffix(from: path.count)))
        }
        cacheMap[src] = cacheValue
        return result
    }
}
 */

/*
// MARK: 1588. 所有奇数长度子数组的和
// https://leetcode-cn.com/problems/sum-of-all-odd-length-subarrays/
class Solution {
    func sumOddLengthSubarrays(_ arr: [Int]) -> Int {
        var sum: Int = 0
        for i in 0..<arr.count {
            let left = i
            let right = arr.count - i - 1
            let leftOdd = (left + 1) / 2
            let rightOdd = (right + 1) / 2
            let leftEven = left / 2 + 1
            let rightEven = right / 2 + 1
            let multiple = leftOdd * rightOdd + leftEven * rightEven
            sum += arr[i] * multiple
        }
        return sum
    }
}
 */

/*
// MARK: 787. K 站中转内最便宜的航班
// https://leetcode-cn.com/problems/cheapest-flights-within-k-stops/
class Solution {
    var cacheMap: [String: [Int]] = [:]
    
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
        let result = cheapest(src, dst, flights, k, 0)
        if result.count > 0 {
            return result[0]
        }
        return -1
    }
    
    func cheapest(_ from: Int, _ to: Int, _ flights: [[Int]], _ limitK: Int, _ currentK: Int) -> [Int] { // return 价格 & 步数，超出步数 return 空
        if currentK > limitK + 1 {
            return [] // 超出中转次数，直接返回空
        }
        if to == from {
            return [0, currentK - 1]
        }
        
        var minPrice: Int = Int.max
        var minPriceK: Int = Int.max
        
        for flight in flights {
            if (flight[1] == to) { // 只需计算能到这里的航班
                var cheapestToThisFlight: [Int] = []
                if let cache = cacheMap["\(flight[0])-\(currentK + 1)"] {
                    if cache.count > 0 {
                        cheapestToThisFlight = [cache[0] + flight[2], cache[1]]
                    }
                } else {
                    cheapestToThisFlight = cheapest(from, flight[0], flights, limitK, currentK + 1)
                    if (cheapestToThisFlight.count > 0) {
                        cheapestToThisFlight = [cheapestToThisFlight[0] + flight[2], cheapestToThisFlight[1]]
                    }
                }
                if cheapestToThisFlight.count > 0 && cheapestToThisFlight[1] <= limitK { // 查找有结果，并且转机次数没有超出
                    if cheapestToThisFlight[0] < minPrice {
                        minPrice = cheapestToThisFlight[0]
                        minPriceK = cheapestToThisFlight[1]
                    } else  if cheapestToThisFlight[0] == minPrice {
                        if cheapestToThisFlight[1] < minPriceK {
                            minPriceK = cheapestToThisFlight[1] // 价格一样但中转次数更少，说明潜力大，更新 minPriceK
                        }
                    }
                }
            }
        }
        if minPrice < Int.max {
            cacheMap["\(to)-\(currentK)"] = [minPrice, minPriceK]
            return [minPrice, minPriceK]
        }
        cacheMap["\(to)-\(currentK)"] = []
        return []
    }
}
 */

/*
// MARK: 443. 压缩字符串
// https://leetcode-cn.com/problems/string-compression/
class Solution {
    func compress(_ chars: inout [Character]) -> Int {
        var result: [Character] = []
        var currentChar: Character?
        var currentCount: Int = 0
        for char in chars {
            if currentChar != char {
                result.append(contentsOf: generateComponents(currentChar, count: currentCount))
                currentChar = char
                currentCount = 1
            } else {
                currentCount += 1
            }
        }
        result.append(contentsOf: generateComponents(currentChar, count: currentCount))
        chars = result
        return result.count
    }
    
    func generateComponents(_ char: Character?, count: Int) -> [Character] {
        guard let char = char, count > 0 else {
            return []
        }
        if count == 1 {
            return [char]
        }
        var result: [Character] = []
        var count = count
        let thousand = count / 1000
        if let t = "\(thousand)".first {
            result.append(t)
        }
        count -= thousand * 1000
        let hundred = count / 100
        if let h = "\(hundred)".first {
            result.append(h)
        }
        count -= hundred * 100
        let ten = count / 10
        if let t = "\(ten)".first {
            result.append(t)
        }
        count -= ten * 10
        if let c = "\(count)".first {
            result.append(c)
        }
        // 去先导0
        while true {
            if let first = result.first {
                if first == "0" {
                    result.removeFirst()
                } else {
                    break
                }
            } else {
                break
            }
        }
        result.insert(char, at: 0)
        return result
    }
}
 */

/*
// MARK: 1646. 获取生成数组中的最大值
// https://leetcode-cn.com/problems/get-maximum-in-generated-array/
class Solution {
    func getMaximumGenerated(_ n: Int) -> Int {
        if n == 0 {
            return 0
        } else if n == 1 {
            return 1
        }
        var nums: [Int] = [0, 1]
        var max = 1
        for i in 2...n {
            var value: Int = 0
            if i % 2 == 0 {
                value = nums[i / 2]
            } else {
                value = nums[i / 2] + nums[i / 2 + 1]
            }
            if value > max {
                max = value
            }
            nums.append(value)
        }
        return max
    }
}
 */

/*
// MARK: 51. N 皇后
// https://leetcode-cn.com/problems/n-queens/
// 回溯法
 
// 正面求解法
class QueenNode {
    var targetN: Int = 0 // N皇后的N
    var solutionPath: [Int] = [] // 解的路径
    
    init(_ targetN: Int, _ solutionPath: [Int]) {
        self.targetN = targetN
        self.solutionPath = solutionPath
    }
    
    func nextValidPos() -> [Int] {
        var pos: [Int] = []
        for i in 0..<targetN { // 先将0-n都塞进数组
            pos.append(i)
        }
        for i in 0..<solutionPath.count { // 遍历此前的路径，将不可摆放的位置剔除
            let val = solutionPath[i]
            pos.removeAll { p in
                // 剔除皇后正下方、右下方、左下方的位置（左右偏移量与相隔的行数相关）
                return p == val || p == val + (solutionPath.count - i) || p == val - (solutionPath.count - i)
            }
        }
        return pos
    }
}

class Solution {
    func solveNQueens(_ n: Int) -> [[String]] {
        if (n == 1) {
            return [["Q"]]
        }
        var result: [[String]] = [] // 存储结果
        var nodes: [QueenNode] = [] // 存储临时节点
        for i in 0..<n {
            nodes.append(QueenNode(n, [i])) // 启动时从第一行所有位置生成节点，开始检查
        }
        while nodes.count > 0 {
            let currentNode = nodes.removeFirst() // 取出并删除第一个
            let nextValidPos = currentNode.nextValidPos()
            if nextValidPos.count > 0 {
                // 下一步有的走
                if currentNode.solutionPath.count == n - 1 {
                    // 当前节点解路径的长度已经到达n-1且下一步有的走，这就是一个解
                    var solutionPath = currentNode.solutionPath
                    solutionPath.append(nextValidPos[0])
                    result.append(convertSolution(solutionPath))
                } else {
                    // 与终点仍有距离，存储所有的可能，继续检查
                    for pos in nextValidPos {
                        var solutionPath = currentNode.solutionPath
                        solutionPath.append(pos)
                        nodes.insert(QueenNode(n, solutionPath), at: 0)
                    }
                }
            }
            // 下一步没的走，当前节点死路，废弃，开始检查下一个节点
        }
        return result
    }
    
    func convertSolution(_ solutionPath: [Int]) -> [String] {
        var result: [String] = []
        let n = solutionPath.count
        for val in solutionPath {
            result.append("\(String(repeating: ".", count: val))Q\(String(repeating: ".", count: n - val - 1))")
        }
        return result
    }
}
 */

/*
// MARK: 789. 逃脱阻碍者
// https://leetcode-cn.com/problems/escape-the-ghosts/
class Solution {
    func escapeGhosts(_ ghosts: [[Int]], _ target: [Int]) -> Bool {
        let myDis = abs(target[0]) + abs(target[1])
        for ghost in ghosts {
            let ghostDis = abs(ghost[0] - target[0]) + abs(ghost[1] - target[1])
            if ghostDis <= myDis {
                return false
            }
        }
        return true
    }
}
 */

/*
// MARK: 108. 将有序数组转换为二叉搜索树
// https://leetcode-cn.com/problems/convert-sorted-array-to-binary-search-tree/
class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    // BST = binary search tree
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        if (nums.count == 0) {
            return nil
        }
        if (nums.count == 1) {
            return TreeNode(nums[0])
        }
        let mid = nums.count / 2
        let node = TreeNode(nums[mid])
        node.left = sortedArrayToBST(Array(nums[0..<mid]))
        node.right = sortedArrayToBST(Array(nums[mid+1..<nums.count]))
        return node
    }
    
    // BFS = breadth first search
    func outputNodeByBFS(_ node: TreeNode) -> [Int] {
        // no need
        return []
    }
}
 */

/*
// MARK: 633. 平方数之和
// https://leetcode-cn.com/problems/sum-of-square-numbers/
class Solution {
    func judgeSquareSum(_ c: Int) -> Bool {
        let inputRoot = Int(floor(sqrt(Double(c))))
        for i in 0...inputRoot {
            let anotherRoot = sqrt(Double(c - (i * i)))
            if anotherRoot - floor(anotherRoot) == 0 {
                return true
            }
        }
        return false
    }
}
 */

/*
// MARK: 剑指 Offer 20. 表示数值的字符串
// https://leetcode-cn.com/problems/biao-shi-shu-zhi-de-zi-fu-chuan-lcof/
class Solution {
    enum CharacterType {
        case empty
        case numbers
        case posNegSymbols
        case dots
        case eSymbols
        case others
    }
    
    let numbersSet: [Character] = ["0","1","2","3","4","5","6","7","8","9"]
    let posNegSymbolsSet: [Character] = ["+","-"]
    let dotsSet: [Character] = ["."]
    let eSymbolsSet: [Character] = ["e","E"]
    
    var lastCharacterType: CharacterType = .empty
    
    func isNumber(_ s: String) -> Bool {
        var str = s
        // 去前后空格
        while str.count > 0 {
            if let first = str.first, first == " " {
                str = String(str.dropFirst())
            } else if let last = str.last, last == " " {
                str = String(str.dropLast())
            } else {
                break
            }
        }
        
        var hasNumbers = false
        var hasDots = false
        var hasESymbols = false
        
        lastCharacterType = .empty
        for ch in str {
            let type = characterType(ch)
            switch type {
                case .numbers:
                    hasNumbers = true
                case .posNegSymbols:
                    if lastCharacterType != .empty && lastCharacterType != .eSymbols {
                        // 正负号既不在开头也不在e后面，非法
                        return false
                    }
                case .dots:
                    if hasESymbols {
                        // e符号后方出现小数点即为非法
                        return false
                    }
                    if hasDots {
                        // 小数点二次出现即为非法
                        return false
                    }
                    if lastCharacterType != .numbers && lastCharacterType != .posNegSymbols && lastCharacterType != .empty {
                        // 小数点只能接在数字之后、符号之后或开头
                        return false
                    }
                    hasDots = true
                case .eSymbols:
                    if hasESymbols {
                        // e符号二次出现即为非法
                        return false
                    }
                    if lastCharacterType != .numbers && lastCharacterType != .dots {
                        // e符号只能接在数字或小数点之后
                        return false
                    }
                    if !hasNumbers && lastCharacterType == .dots {
                        // 没有出现过数字，且e符号出现在小数点之后，非法
                        return false
                    }
                    hasESymbols = true
                case .others:
                    // 其余字符一经收到即判为非法
                    return false
                default:
                    print("")
            }
            lastCharacterType = type
        }
        if !hasNumbers {
            // 没有出现过数字，非法
            return false
        }
        // 必须以数字或小数点结尾，否则非法
        return lastCharacterType == .numbers || lastCharacterType == .dots
    }
    
    func characterType(_ ch: Character) -> CharacterType {
        if numbersSet.contains(ch) {
            return .numbers
        } else if posNegSymbolsSet.contains(ch) {
            return .posNegSymbols
        } else if dotsSet.contains(ch) {
            return .dots
        } else if eSymbolsSet.contains(ch) {
            return .eSymbols
        }
        return .others
    }
}
 */

/*
// MARK: 841. 钥匙和房间
// https://leetcode-cn.com/problems/keys-and-rooms/
class Solution {
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        var alreadyFetchedKeysRoomNo: [Int] = [] // 已经找了钥匙的RoomNo，防止重复找钥匙
        var searchQueue: [Int] = [] // 正在查找的queue
        
        if let room0 = rooms.first {
            searchQueue.append(contentsOf: room0)
            alreadyFetchedKeysRoomNo.append(0)
        }
        while searchQueue.count > 0 {
            if let currentRoomNo = searchQueue.first {
                searchQueue.removeFirst()
                if alreadyFetchedKeysRoomNo.contains(currentRoomNo) {
                    continue
                } else {
                    let newKeys = rooms[currentRoomNo]
                    searchQueue.append(contentsOf: newKeys)
                    alreadyFetchedKeysRoomNo.append(currentRoomNo)
                }
            } else {
                break
            }
        }
        return alreadyFetchedKeysRoomNo.count == rooms.count
    }
}
 */

/*
// MARK: 45. 跳跃游戏 II
// https://leetcode-cn.com/problems/jump-game-ii/
class Solution {
    func jump(_ nums: [Int]) -> Int {
        if nums.count <= 1 {
            return 0
        }
        var startIndex = 0
        var stepCount = 0
        while true {
            let currentValue = nums[startIndex]
            var maxValue = 0
            var maxI = 0
            if startIndex + currentValue >= nums.count - 1 {
                // 抵达终点
                return stepCount + 1
            }
            for i in 0...currentValue {
                if startIndex + i + nums[startIndex + i] > maxValue {
                    // 寻找让下一步的可达距离最远的跳法
                    maxValue = startIndex + i + nums[startIndex + i]
                    maxI = i
                }
            }
            if maxI == 0 {
                // 陷入黑洞，例如 [1,3,2,1,0,4]，第一步跳到3后，无法继续向前
                return -1
            }
            // 更新 startIndex，准备下一跳
            startIndex += maxI
            stepCount += 1
        }
    }
    
    // 动态规划太慢
//    var resultMap: [Int: Int] = [:] // 结果记忆
//
//    func jump(_ nums: [Int]) -> Int {
//        if nums.count <= 1 {
//            return 0
//        }
//        let step = findFast(nums, startIndex: 0)
//        if step == Int.max {
//            return 0
//        } else {
//            return step
//        }
//    }
//
//    func findFast(_ nums: [Int], startIndex: Int) -> Int {
//        if nums[startIndex] == 0 {
//            return Int.max // 误入黑洞
//        }
//        if startIndex + nums[startIndex] >= nums.count - 1 {
//            return 1 // 一步到底
//        }
//        var minStep = Int.max
//        for i in 1..<nums[startIndex] + 1 {
//            let newStartIndex = startIndex + i
//            var step = 0
//            if let memory = resultMap[newStartIndex] {
//                step = memory
//            } else {
//                step = findFast(nums, startIndex: newStartIndex)
//                resultMap[newStartIndex] = step
//            }
//            if step < minStep {
//                minStep = step
//            }
//        }
//        if minStep == Int.max {
//            return minStep
//        } else {
//            return minStep + 1
//        }
//    }
}
 */

/*
// MARK: 20. 有效的括号
// https://leetcode-cn.com/problems/valid-parentheses/
class Solution {
    var leftSymbols: [Character] = ["(","[","{"]
    var rightSymbols: [Character] = [")","]","}"]
    var symbolsMap: [Character: Character] = [")":"(","]":"[","}":"{"]
    
    var stack: [Character] = []
    
    func isValid(_ s: String) -> Bool {
        for ch in s {
            if leftSymbols.contains(ch) {
                push(ch)
            } else if rightSymbols.contains(ch) {
                if let compare = pop(), let target = symbolsMap[ch] {
                    if compare != target {
                        // 不匹配，非法
                        return false
                    }
                } else {
                    // 收到右括号时栈已经空了，非法
                    return false
                }
            }
        }
        if let _ = pop() {
            // 栈不为空，有未匹配的左符号，非法
            return false
        } else {
            return true
        }
    }
    
    func push(_ ch: Character) {
        stack.append(ch)
    }
    
    func pop() -> Character? {
        if let last = stack.last {
            stack = stack.dropLast()
            return last
        } else {
            return nil
        }
    }
}
 */

/*
// MARK: 6. Z字形变换
// https://leetcode-cn.com/problems/zigzag-conversion/
class Question6 {
    func solve() {
        let result = convert("LEETCODEISHIRING", 4)
        print("\(result)")
    }

    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows <= 0 {
            return "Error"
        }
        if numRows == 1 {
            return s
        }
        var container: [String] = []
        for _ in 0..<numRows {
            container.append("")
        }
        var currentIndex = 0
        var isAdding = true
        for ch in s {
            container[currentIndex].append(ch)
            if isAdding {
                currentIndex += 1
                if currentIndex == numRows {
                    currentIndex -= 2
                    isAdding = false
                }
            } else {
                currentIndex -= 1
                if currentIndex < 0 {
                    currentIndex += 2
                    isAdding = true
                }
            }
        }
        return container.joined()
    }
}
 */

/*
// MARK: 2. 两数相加
// https://leetcode-cn.com/problems/add-two-numbers/
class Question2 {
    func solve() {
        // 准备数据
        var ln1 = buildNode([8, 7, 9]) // 879
        var ln2 = buildNode([4, 9, 6]) // 496
        
        // 计算
        let begin = Date().timeIntervalSince1970
        var result = addTwoNumbers(ln1, ln2);
        let end = Date().timeIntervalSince1970
        let time = (end - begin) * 1000
        
        // 耗时
        print("time \(time) ms");
        
        // 结果
        print("l1 node")
        while ln1 != nil {
            if let value = ln1?.value {
                print("\(value)")
            }
            ln1 = ln1?.next
        }
        
        print("l2 node")
        while ln2 != nil {
            if let value = ln2?.value {
                print("\(value)")
            }
            ln2 = ln2?.next
        }
        
        print("result node")
        while result != nil {
            if let value = result?.value {
                print("\(value)")
            }
            result = result?.next
        }
    }
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var next1: ListNode? = l1; // 逐个遍历 l1
        var next2: ListNode? = l2; // 逐个遍历 l2
        var first: ListNode? // 最终返回的节点，即两数之和的个位
        var result: ListNode? // 每次循环产生的节点
        while next1 != nil || next2 != nil {
            var value = 0
            if let n1 = next1 {
                value += n1.value
            }
            if let n2 = next2 {
                value += n2.value
            }
            let node = ListNode(value, nil);
            if first == nil {
                first = node
            }
            if let r = result {
                r.next = node
                // 处理进位
                if r.value >= 10 {
                    r.value -= 10
                    node.value += 1
                }
            }
            result = node
            
            next1 = next1?.next
            next2 = next2?.next
        }
        // 处理最高位进位
        if let r = result, r.value >= 10 {
            r.value -= 10;
            r.next = ListNode(1, nil)
        }
        return first;
    }
    
    func buildNode(_ nums: [Int]) -> ListNode? {
        var nextNode: ListNode?
        for i in 0..<nums.count {
            nextNode = ListNode(nums[i], nextNode);
        }
        return nextNode!
    }
}

class ListNode {
    var value: Int
    var next: ListNode?
    
    init(_ value: Int, _ next: ListNode?) {
        self.value = value
        self.next = next
    }
}
 */

/*
// MARK: 1. 两数之和
// https://leetcode-cn.com/problems/two-sum/
class Question1 {
    func solve() {
        // 准备数据
        var nums = [Int]();
        for i in 0..<1000 {
            nums.append(i * 2)
        }
        let target = (998 + 999) * 2
        
        // 开始计算
        let begin = Date().timeIntervalSince1970
        let result = twoSum2(nums, target)
        let end = Date().timeIntervalSince1970
        let time = (end - begin) * 1000
 
        // 输出结果
        print("result \(result[0]) \(result[1]), time \(time) ms");
    }
    
    // 哈希表
    func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
        var dic = [Int:Int]()
        for i in 0..<nums.count {
            let remain = target - nums[i];
            if let another = dic[remain] {
                return [another, i];
            } else {
                dic[nums[i]] = i
            }
        }
        return [-1, -1]
    }
    
    // 暴力双循环
    func twoSum1(_ nums: [Int], _ target: Int) -> [Int] {
        var value1 = -1;
        var value2 = -1;
        label: for i in 0..<nums.count {
            for j in i+1..<nums.count {
                if nums[i] + nums[j] == target {
                    value1 = i
                    value2 = j
                    break label
                }
            }
        }
        return [value1, value2]
    }
}
*/

// MARK: ⚠️⚠️⚠️真实面试题
/*
// MARK: 三数之和 懂车帝面试题
class ThreeSum {
    func findThreeSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var result: [[Int]] = []
        var map: [Int: Int] = [:]
        for i in 0..<nums.count {
            // 值为key, 下标为value
            map[nums[i]] = i
        }
        for i in 0..<nums.count / 2 {
            let twoTarget = target - nums[i]
            for j in i+1..<nums.count {
                let oneTarget = twoTarget - nums[j]
                if let index = map[oneTarget], index > j {
                    // 存在要找的数
                    result.append([nums[i], nums[j], oneTarget])
                } else {
                    // 不存在要找的数, 无需处理
                }
            }
        }
        return result
    }
}
 */

/*
// MARK: 之字形遍历 懂车帝面试题
class TreeTracking {
    func beginZTracking(_ root: TreeNode) {
        safePrintValue(root)
        zTracking([root], false)
    }
    
    func zTracking(_ nodes: [TreeNode], _ isLeftToRigth: Bool) {
        if (nodes.count == 0) {
            return
        }
        var queue: [TreeNode] = []
        for node in nodes {
            if let left = root.left {
                queue.append(left)
            }
            if let right = root.right {
                queue.append(right)
            }
        }
        var trackingArray: [TreeNode] = []
        if (isLeftToRigth) {
            trackingArray.append(contentsOf: queue)
        } else {
            trackingArray.append(contentsOf: queue.reverse())
        }
        for node in trackingArray {
            safePrintValue(node)
        }
        zTracking(queue, !isLeftToRigth)
    }
    
    func safePrintValue(_ node: TreeNode?) {
        if let value = node?.value {
            print("\(value)")
        }
    }
}

class TreeNode {
    var left: TreeNode?
    var right: TreeNode?
    var value: Int?
}
 */
