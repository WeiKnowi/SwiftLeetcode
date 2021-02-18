//
//  Leetcode2.swift
//  Leetcode
//
//  Created by 未可知 on 2020/4/30.
//  Copyright © 2020 com.septnet.business. All rights reserved.
//

import Foundation

public class Node: Hashable {
	public var val: Int
	public var neighbors: [Node?]
	public init(_ val: Int) {
		self.val = val
		self.neighbors = []
	}
	public func hash(into hasher: inout Hasher) {
		hasher.combine(val)
	}
	public static func == (lhs: Node, rhs: Node) -> Bool {
		return lhs.val == rhs.val
	}
}

public class Leetcode2: NSObject {
	// 2
	func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
		var dummy = ListNode(0)
		var p = dummy
		var jin1 = false
		var a = l1
		var b = l2
		while a != nil || b != nil {
			let i = a != nil ? a!.val : 0
			let j = b != nil ? b!.val : 0
			var sum = i + j
			sum = jin1 ? sum + 1 : sum
			jin1 = sum/10 >= 1
			sum = sum%10
			let n = ListNode(sum)
			p.next = n
			p = n
			a = a?.next
			b = b?.next
		}
		if jin1 {
			p.next = ListNode(1)
		}
		return dummy.next
	}
	
	// 3
	//	func lengthOfLongestSubstring(_ s: String) -> Int {
	//		var ans = [Character]()
	//		var max = 0
	//		for item in s {
	//			if ans.contains(item) {
	//				let index = ans.firstIndex(of: item)
	//				ans = Array(ans.suffix(from: index!+1))
	//				ans.append(item)
	//			}
	//			else {
	//				ans.append(item)
	//			}
	//			max = max > ans.count ? max : ans.count
	//		}
	//		return max
	//    }
	func lengthOfLongestSubstring(_ s: String) -> Int {
		var map = [Character : Int]()
		var start = 0
		var max = 0
		for i in 0..<s.count {
			if map.keys.contains(s[i]!) {
				start = start > map[s[i]!]! + 1 ? start : map[s[i]!]! + 1
			}
			map[s[i]!] = i
			max = max > i-start+1 ? max : i-start+1
		}
		return max
	}
	
	// 5
	func longestPalindrome(_ s: String) -> String {
		let len = s.count
		if len < 2 {
			return s
		}
		var maxLen = 1
		var begin = 0
		var dp = Array.init(repeating: Array.init(repeating: false, count: len), count: len)
		var charArr = [Character]()
		for c in s {
			charArr.append(c)
		}
		for j in 1..<len {
			for i in 0..<j {
				if charArr[i] != charArr[j] {
					dp[i][j] = false
				}
				else {
					if j - i < 3 {
						dp[i][j] = true
					}
					else {
						dp[i][j] = dp[i+1][j-1]
					}
				}
				if dp[i][j] && j - i + 1 > maxLen {
					maxLen = j - i + 1
					begin = i
				}
			}
		}
		let i1 = s.index(s.startIndex, offsetBy: begin)
		let i2 = s.index(s.startIndex, offsetBy: begin + maxLen)
		return String(s[i1..<i2])
	}
	
	// 6
	func convert(_ s: String, _ numRows: Int) -> String {
		if numRows == 1 {
			return s
		}
		var ans = Array.init(repeating: String(), count: numRows)
		var i = 0, flag = -1
		for c in s {
			ans[i] = ans[i] + String(c)
			if i == 0 || i == numRows - 1 {
				flag = -flag
			}
			i+=flag
		}
		var str = String()
		for subs in ans {
			str+=subs
		}
		return str
	}
	
	// 7
	func reverse(_ x: Int) -> Int {
		if abs(x) < 10 {
			return x
		}
		var ans = [Int]()
		var num = x < 0 ? -x : x
		var count = 0
		while num != 0 {
			ans.append(num%10)
			num = num/10
			count+=1
		}
		for i in 0..<count {
			num = num*10 + ans[i]
		}
		if x < 0 {
			num = -num
		}
		if abs(num) > Int32.max {
			num = 0
		}
		return num
	}
	
	// 9
	func isPalindrome(_ x: Int) -> Bool {
		if x < 0 {
			return false
		}
		if x < 10 {
			return true
		}
		let str = String(x)
		let l = str.count
		for i in 0..<l/2 {
			if str[i] != str[l-1-i] {
				return false
			}
		}
		return true
	}
	
	// 11
	func maxArea(_ height: [Int]) -> Int {
		if height.count < 2 {
			return 0
		}
		var left = 0, right = height.count - 1
		var max = 0
		for i in 0..<height.count {
			let area = min(height[left], height[right]) * (right - left)
			max = area > max ? area : max
			if height[left] < height[right] {
				left += 1
			}
			else {
				right -= 1
			}
			if left >= right {
				break
			}
		}
		return max
	}
	
	// 12
	func intToRoman(_ num: Int) -> String {
		let nums = [1000,900,500,400,100,90,50,40,10,9,5,4,1]
		let chas = ["M","CM","D","CD","C","XC","L","XL","X","IX","V","IV","I"]
		var i = 0
		var n = num
		var str = String()
		while i < nums.count {
			let v = n/nums[i]
			if v != 0 {
				for _ in 0..<v {
					str+=chas[i]
				}
			}
			n%=nums[i]
			i+=1
		}
		return str
	}
	
	// 13
	func romanToInt(_ s: String) -> Int {
		if s.count == 0 {
			return 0
		}
		var v = 0
		let a = ["CM":900,"CD":400,"XC":90,"XL":40,"IX":9,"IV":4]
		let b = ["M":1000,"D":500,"C":100,"L":50,"X":10,"V":5,"I":1]
		var i = 0
		while i < s.count {
			if i + 1 < s.count {
				// 边界条件
				let start = s.index(s.startIndex, offsetBy: i)
				let end = s.index(s.startIndex, offsetBy: i+1)
				let subs = String(s[start...end])
				if a.keys.contains(subs) {
					v+=a[subs]!
					i+=2
				}
				else {
					let start = s.index(s.startIndex, offsetBy: i)
					let subs = String(s[start...start])
					v+=b[subs]!
					i+=1
				}
			}
			else {
				let start = s.index(s.startIndex, offsetBy: i)
				let subs = String(s[start...start])
				v+=b[subs]!
				i+=1
			}
		}
		return v
	}
	
	// 15
	func threeSum(_ nums: [Int]) -> [[Int]] {
		if nums.count < 3 {
			return [[Int]]()
		}
		var res = [[Int]]()
		let n = nums.sorted { $1 > $0}
		for i in 0..<n.count-2 {
			if n[i] > 0 {
				break
			}
			if i > 0 && n[i] == n[i-1] {
				continue
			}
			var L = i + 1
			var R = n.count - 1
			while L < R {
				let sum = n[i] + n[L] + n[R]
				if sum == 0 {
					res.append([n[i],n[L],n[R]])
					while L < R && n[L] == n[L+1] {
						L+=1
					}
					while L < R && n[R] == n[R-1] {
						R-=1
					}
					L+=1
					R-=1
				}
				else if sum > 0 {
					R-=1
				}
				else if sum < 0 {
					L+=1
				}
			}
		}
		return res
	}
	
	// 19
	func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
		let dummy: ListNode = ListNode.init(0)
		dummy.next = head
		var slow = dummy
		var fast = dummy
		for _ in 0..<n {
			fast = fast.next!
		}
		while fast.next != nil {
			slow = slow.next!
			fast = fast.next!
		}
		slow.next = slow.next?.next
		return dummy.next
	}
	
	// 20
	func isValid(_ s: String) -> Bool {
		//		let map: [Character:Character] = ["(":")","[":"]","{":"}"]
		let map: [Character:Character] = [")":"(","]":"[","}":"{"]
		var ans = [Character]()
		for c in s {
			if c == "(" || c == "[" || c == "{" {
				ans.append(c)
			}
			else {
				if ans.last != map[c] {
					return false
				}
				ans.removeLast()
			}
		}
		return ans.count == 0 ? true : false
	}
	
	// 22
	func generateParenthesis(_ n: Int) -> [String] {
		if n == 0 {
			return [String]()
		}
		var str = String()
		var res = [String]()
		var map = [String:Int]()
		map["("] = 0
		map[")"] = 0
		backTrack22(str: &str, res: &res, depth: 0, map: &map, n: n, arr: ["(",")"])
		return res
	}
	
	func backTrack22(str: inout String, res: inout [String], depth: Int, map: inout [String:Int], n: Int, arr: [String]) {
		if depth >= n*2 {
			if map["("] == map[")"] {
				res.append(str)
			}
			return
		}
		for s in arr {
			if map["("] == map[")"] && s == ")" {
				// 剪枝
				return
			}
			str.append(s)
			map[s]!+=1
			backTrack22(str: &str, res: &res, depth: depth+1, map: &map, n: n, arr: arr)
			map[s]!-=1
			str.removeLast()
		}
	}
	
	// 29
	func divide(_ dividend: Int, _ divisor: Int) -> Int {
		if divisor == 0 {
			return 0
		}
		
		if divisor == 1 {
			return dividend
		}
		if divisor == -1 {
			return dividend == Int32.min ? Int(Int32.max) : -dividend
		}
		let isP = dividend*divisor < 0
		let res = div(a: abs(dividend), b: abs(divisor))
		return isP ? -res : res
	}
	
	func div(a: Int, b: Int) -> Int {
		if a < b {
			return 0
		}
		var count = 1
		var tmp = b
		while tmp + tmp < a {
			tmp+=tmp
			count+=count
		}
		return count + div(a: a-tmp, b: b)
	}
	
	// 31
	func nextPermutation(_ nums: inout [Int]) {
		if nums.count == 0 || nums.count == 1 {
			return
		}
		var i = nums.count - 1, j = nums.count - 2
		while j >= 0 {
			var flag = false
			for k in (j+1...i).reversed() {
				if nums[k] > nums[j] {
					nums.swapAt(k, j)
					flag = true
					break
				}
			}
			if flag {
				break
			}
			j-=1
		}
		if j == -1 {
			return nums.sort()
		}
		let sub = nums[j+1..<nums.count]
		nums.replaceSubrange(j+1..<nums.count, with: sub.sorted { $1 > $0 })
	}
	
	func search(_ nums: [Int], _ target: Int) -> Int {
		if nums.count == 0 {
			return -1
		}
		var L = 0, R = nums.count-1, M = (L+R)/2
		var index = 0
		while L < M {
			
		}
		return index
	}
	
	// 34
	func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
		if nums.count == 0 {
			return [-1, -1]
		}
		if nums.count == 1 {
			return nums[0] == target ? [0, 0] : [-1,-1]
		}
		let l = lBackTrack34(nums, target: target, l: 0, r: nums.count-1)
		let r = rBackTrack34(nums, target: target, l: 0, r: nums.count-1)
		return [l,r]
	}
	
	func lBackTrack34(_ nums: [Int], target: Int, l: Int, r: Int) -> Int {
		if l == r {
			if nums[l] != target  {
				return -1
			}
			else {
				return l
			}
		}
		let m = (l + r)/2
		if nums[m] == target {
			if m-1>=0 && nums[m-1] < target {
				return m
			}
			return lBackTrack34(nums, target: target, l: l, r: m)
		}
		else if nums[m] > target {
			return lBackTrack34(nums, target: target, l: l, r: m)
		}
		else {
			return lBackTrack34(nums, target: target, l: m+1, r: r)
		}
	}
	
	func rBackTrack34(_ nums: [Int], target: Int, l: Int, r: Int) -> Int {
		if l == r {
			if nums[l] != target  {
				return -1
			}
			else {
				return l
			}
		}
		let m = (l + r)/2
		if nums[m] == target {
			if m+1<nums.count && nums[m+1] > target {
				return m
			}
			return rBackTrack34(nums, target: target, l: m+1, r: r)
		}
		else if nums[m] > target {
			return rBackTrack34(nums, target: target, l: l, r: m)
		}
		else {
			return rBackTrack34(nums, target: target, l: m+1, r: r)
		}
	}
	
	// 36
	func isValidSudoku(_ board: [[Character]]) -> Bool {
		var ansLine = Array.init(repeating: Array.init(repeating: 0, count: 10), count: 9)
		var ansColumn = Array.init(repeating: Array.init(repeating: 0, count: 10), count: 9)
		var ansS = Array.init(repeating: Array.init(repeating: 0, count: 10), count: 9)
		for i in 0..<9 {
			for j in 0..<9 {
				if board[i][j] == "." {
					continue
				}
				let k = Int(String(board[i][j]))!
				if ansLine[i][k] == 1 {
					return false
				}
				if ansColumn[j][k] == 1 {
					return false
				}
				if ansS[j/3+(i/3)*3][k] == 1 {
					return false
				}
				ansLine[i][k] = 1
				ansColumn[j][k] = 1
				ansS[j/3+(i/3)*3][k] = 1
			}
		}
		return true
	}
	
	// 39
	func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
		var res = [[Int]]()
		var ans = [Int]()
		var c = candidates.sorted { $1 > $0 }
		c = c.filter { (v) -> Bool in
			return v <= target
		}
		backTrack39(candidates: c, res: &res, ans: &ans, target: target, index: 0)
		return res
	}
	
	func backTrack39(candidates: [Int], res: inout [[Int]], ans: inout [Int], target: Int, index: Int) -> Bool {
		let sum = ans.reduce(0, +)
		if sum == target {
			res.append(Array.init(ans))
			return false
		}
		else if sum > target {
			return true
		}
		for i in index..<candidates.count {
			ans.append(candidates[i])
			let b = backTrack39(candidates: candidates, res: &res, ans: &ans, target: target, index: i)
			ans.removeLast()
			if b {
				break
			}
		}
		return false
	}
	
	//43
	func multiply(_ num1: String, _ num2: String) -> String {
		if num1 == "0" || num2 == "0" {
			return "0"
		}
		let n1 = num1.map {Int(String($0))}
		let n2 = num2.map {Int(String($0))}
		var res = Array.init(repeating: 0, count: n1.count + n2.count)
		for i in (0..<n1.count).reversed() {
			for j in (0..<n2.count).reversed() {
				let sum = res[i+j+1]+n1[i]!*n2[j]!
				res[i+j+1]=sum%10
				res[i+j]=sum/10
			}
		}
		var str = ""
		for i in 0..<res.count {
			if i == 0 && res[i] == 0 {
				continue
			}
			str.append(String(res[i]))
		}
		return str
	}
	
	func permuteUnique(_ nums: [Int]) -> [[Int]] {
		var res = [[Int]]()
		var ans = [Int]()
		var used = Array.init(repeating: false, count: nums.count)
		let n = nums.sorted { $1 > $0 }
		dfs47(ans: &ans, len: nums.count, depth: 0, nums: n, used: &used, res: &res)
		return res
	}
	
	func dfs47(ans: inout [Int], len: Int, depth: Int, nums: [Int], used: inout [Bool], res: inout [[Int]]) {
		if len == depth {
			res.append(Array.init(ans))
			return
		}
		for i in 0..<nums.count {
			if used[i] {
				continue
			}
			// !used[i-1] 代表同一层中,使用了相同的元素，这样必然会造成重复
			if i > 0 && nums[i] == nums[i-1] && !used[i-1] {
				continue
			}
			ans.append(nums[i])
			used[i] = true
			dfs47(ans: &ans, len: len, depth: depth+1, nums: nums, used: &used, res: &res)
			used[i] = false
			ans.removeLast()
		}
	}
	
	// 48
	func rotate(_ matrix: inout [[Int]]) {
		let n = matrix.count
		for i in 0..<n/2 {
			for j in i..<n-i-1 {
				let tmp = matrix[i][j]
				matrix[i][j] = matrix[n-j-1][i]
				matrix[n-j-1][j] = matrix[n-i-1][n-j-1]
				matrix[n-i-1][n-j-1] = matrix[j][n-i-1]
				matrix[j][n-i-1] = tmp
			}
		}
	}
	
	// 49
	func groupAnagrams(_ strs: [String]) -> [[String]] {
		if strs.count <= 1 {
			return [strs]
		}
		var res = [[String]]()
		var ans = [String]()
		var used = Array.init(repeating: false, count: strs.count)
		for i in 0..<strs.count {
			if used[i] {
				// 剪枝
				continue
			}
			ans.append(strs[i])
			used[i] = true
			if i+1 < strs.count {
				for j in i+1..<strs.count {
					if used[j] {
						// 剪枝
						continue
					}
					let flag = isAnagrams(strs[i], strs[j])
					if flag {
						used[j] = true
						ans.append(strs[j])
					}
				}
			}
			res.append(Array.init(ans))
			ans.removeAll()
		}
		return res
	}
	
	func isAnagrams2(_ a: String, _ b: String) -> Bool {
		if a.count != b.count {
			return false
		}
		let c = a.sorted { $1 > $0 }
		let d = b.sorted { $1 > $0 }
		return c == d
	}
	
	func isAnagrams(_ a: String, _ b: String) -> Bool {
		if a.count != b.count {
			return false
		}
		var map = [Character:Int]()
		for c in b {
			if map[c] == nil {
				map[c] = 1
			}
			else {
				map[c]!+=1
			}
		}
		for c in a {
			if map[c] == nil {
				return false
			}
			else {
				map[c]!-=1
				if map[c]! < 0 {
					return false
				}
			}
		}
		for (_, value) in map {
			if value != 0 {
				return false
			}
		}
		return true
	}
	
	// 50
	func myPow(_ x: Double, _ n: Int) -> Double {
		return n >= 0 ? quickPow(x, n) : 1.0/quickPow(x, -n)
	}
	
	func quickPow(_ x: Double, _ n: Int) -> Double {
		if n == 0 {
			return 1.0
		}
		let y = quickPow(x, n/2)
		return n%2 == 0 ? y*y : y*y*x
	}
	//	func myPow(_ x: Double, _ n: Int) -> Double {
	//		let isPoint = n < 0 // 是否是小数
	//		let isPositive = x > 0 || n%2 == 0 // 是否是正数
	//		var i = abs(n)
	//		let xv = fabs(x)
	//		var sum = xv
	//			while i != 0 {
	//				let flag = i%2 != 0
	//				i/=2
	//				if i == 0 {
	//					break
	//				}
	//				sum*=sum
	//				if flag {
	//					sum*=xv
	//				}
	//			}
	//		if isPoint  {
	//			return (1/sum) * (isPositive ? 1.0 : -1.0)
	//		}
	//		else {
	//			return sum * (isPositive ? 1.0 : -1.0)
	//		}
	//	}
	
	//51
	func maxSubArray(_ nums: [Int]) -> Int {
		if nums.count == 0 {
			return 0
		}
		var sum = 0
		var ans = nums[0]
		for i in nums {
			if sum > 0 {
				sum+=i
			}
			else {
				sum=i
			}
			ans = max(sum, ans)
		}
		return ans
	}
	
	func spiralOrder(_ matrix: [[Int]]) -> [Int] {
		if matrix.count == 0 {
			return [Int]()
		}
		var l = 0, r = matrix[0].count-1, t = 0, b = matrix.count-1
		var res = [Int]()
		while l <= r && t <= b {
			for k in l...r {
				res.append(matrix[t][k])
			}
			t+=1
			
			if t > b {
				break
			}
			for k in t...b {
				res.append(matrix[k][r])
			}
			r-=1
			
			if l > r {
				break
			}
			for k in (l...r).reversed() {
				res.append(matrix[b][k])
			}
			b-=1
			
			if t > b {
				break
			}
			for k in (t...b).reversed() {
				res.append(matrix[k][l])
			}
			l+=1
		}
		return res
	}
	
	func canJump(_ nums: [Int]) -> Bool {
		var k = 0
		for i in 0..<nums.count {
			if i > k {
				return false
			}
			k = max(k, i+nums[i])
		}
		return true
	}
	
	// 60
	func getPermutation(_ n: Int, _ k: Int) -> String {
		var used = Array.init(repeating: false, count: n+1)
		let factorial = factorial60(n)
		var str = ""
		var l = k
		backTrack60(n, used: &used, k: &l, str: &str, index: 0, fac: factorial)
		return str
	}
	
	func backTrack60(_ n: Int, used: inout [Bool], k: inout Int, str: inout String, index: Int, fac: [Int]) {
		if index == n {
			return
		}
		let v = fac[n-1-index]
		for i in 1...n {
			if used[i] {
				continue
			}
			if v < k {
				k-=v
				continue
			}
			str.append(String(i))
			used[i] = true
			backTrack60(n, used: &used, k: &k, str: &str, index: index+1, fac: fac)
			return
		}
	}
	
	func factorial60(_ n: Int) -> [Int] {
		var res = Array.init(repeating: 0, count: n+1)
		res[0] = 1
		for i in 1...n {
			res[i] = res[i-1]*i
		}
		return res
	}
	
	// 62
	func uniquePaths(_ m: Int, _ n: Int) -> Int {
		/**
		* 1、特殊情况处理
		* 2、边界填充
		* 3、
		*/
		if m == 0 || n == 0 {
			return 0
		}
		if m == 1 || n == 1 {
			return 1
		}
		var dp = Array.init(repeating: Array.init(repeating: 0, count: n+1), count: m+1)
		for i in 1...n {
			dp[1][i] = 1
		}
		for i in 1...m {
			dp[i][1] = 1
		}
		for i in 2...m {
			for j in 2...n {
				dp[i][j] = dp[i-1][j] + dp[i][j-1]
			}
		}
		return dp[m][n]
	}
	
	func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
		let m = obstacleGrid.count
		if m == 0 {
			return 0
		}
		let n = obstacleGrid[0].count
		if n == 0 {
			return 0
		}
		var dp = Array.init(repeating: Array.init(repeating: 0, count: n), count: m)
		var i = 0
		while i < n && obstacleGrid[0][i] == 0 {
			dp[0][i] = 1
			i+=1
		}
		i = 0
		while i  < m && obstacleGrid[i][0] == 0 {
			dp[i][0] = 1
			i+=1
		}
		for i in 1..<m {
			for j in 1..<n {
				if obstacleGrid[i][j] == 0 {
					dp[i][j] = dp[i-1][j] + dp[i][j-1]
				}
			}
		}
		return dp[m-1][n-1]
	}
	
	func minPathSum(_ grid: [[Int]]) -> Int {
		let m = grid.count
		if m == 0 {
			return 0
		}
		let n = grid[0].count
		if n == 0 {
			return 0
		}
		var dp = Array.init(repeating: Array.init(repeating: 0, count: n), count: m)
		var i = 0
		while i < m {
			if i == 0 {
				dp[i][0] = grid[0][0]
			}
			else {
				dp[i][0] = grid[i][0] + dp[i-1][0]
			}
			i+=1
		}
		i = 0
		while i < n {
			if i == 0 {
				dp[0][i] = grid[0][0]
			}
			else {
				dp[0][i] = grid[0][i] + dp[0][i-1]
			}
			i+=1
		}
		for i in 1..<m {
			for j in 1..<n {
				if dp[i-1][j] > dp[i][j-1] {
					dp[i][j] = dp[i][j-1] + grid[i][j]
				}
				else {
					dp[i][j] = dp[i-1][j] + grid[i][j]
				}
			}
		}
		return dp[m-1][n-1]
	}
	
	func mySqrt(_ x: Int) -> Int {
		if x == 0 {
			return 0
		}
		if x <= 3 {
			return 1
		}
		var L = 0, R = x, M = (L+R)/2
		while L != M {
			let res = M*M
			if res == x {
				return M
			}
			else if res > x {
				R = M
			}
			else {
				L = M
			}
			M = (L+R)/2
		}
		return L
	}
	
	func climbStairs(_ n: Int) -> Int {
		if n < 3 {
			return n
		}
		var dp = Array.init(repeating: 0, count: n+1)
		dp[1] = 1
		dp[2] = 2
		for i in 3...n {
			dp[i] = dp[i-1] + dp[i-2]
		}
		return dp[n]
	}
	
	func simplifyPath(_ path: String) -> String {
		var list = [String]()
		let ps = path.split(separator: "/").map { String($0) }
		for str in ps {
			if !list.isEmpty && str == ".." {
				list.removeLast()
			}
			else if !str.isEmpty && str != "." {
				list.append(str)
			}
		}
		var p = ""
		for str in list {
			p = p + "/"+str
		}
		return p.isEmpty ? "/" : p
	}
	
	func setZeroes(_ matrix: inout [[Int]]) {
		if matrix.count == 0 {
			return
		}
		if matrix[0].count == 0 {
			return
		}
		let m = matrix.count
		let n = matrix[0].count
		var col0_flag = false
		var row0_flag = false
		for i in 0..<n {
			if matrix[0][i] == 0 {
				row0_flag = true
				break
			}
		}
		
		for i in 0..<m {
			if matrix[i][0] == 0 {
				col0_flag = true
				break
			}
		}
		
		for i in 1..<m {
			for j in 1..<n {
				if matrix[i][j] == 0 {
					matrix[i][0] = 0
					matrix[0][j] = 0
				}
			}
		}
		
		for i in 0..<m {
			for j in 0..<n {
				if matrix[0][j] == 0 || matrix[i][0] == 0 {
					matrix[i][j] = 0
				}
			}
		}
		
		if row0_flag {
			for i in 0..<n {
				matrix[0][i] = 0
			}
		}
		if col0_flag {
			for i in 0..<m {
				matrix[i][0] = 0
			}
		}
	}
	
	//	func sortColors(_ nums: inout [Int]) {
	//		var redc = 0
	//		var whc = 0
	//		var blc = 0
	//		for num in nums {
	//			if num == 0 {
	//				redc+=1
	//			}
	//			else if num == 1 {
	//				whc+=1
	//			}
	//			else {
	//				blc+=1
	//			}
	//		}
	//		for i in 0..<redc {
	//			nums[i] = 0
	//		}
	//		for i in 0..<whc {
	//			nums[redc+i] = 1
	//		}
	//		for i in 0..<blc {
	//			nums[redc+whc+i] = 1
	//		}
	//	}
	
	// 76
	func sortColors(_ nums: inout [Int]) {
		var r = 0, w = 0, b = 0, i = 0
		while i < nums.count {
			if nums[i] == 0 {
				let num = nums.remove(at: i)
				nums.insert(num, at: r)
				r+=1
			}
			else if nums[i] == 1 {
				let num = nums.remove(at: i)
				nums.insert(num, at: w+r)
				w+=1
			}
			else if nums[i] == 2 {
				let num = nums.remove(at: i)
				nums.insert(num, at: b+w+r)
				b+=1
			}
			i+=1
		}
	}
	
	//78
	func subsets(_ nums: [Int]) -> [[Int]] {
		var ans = [Int]()
		var res = [[Int]]()
		for i in 0...nums.count {
			dfs78(depth: i, nums: nums, ans: &ans, res: &res, index: 0)
		}
		return res
	}
	
	func dfs78(depth: Int, nums: [Int], ans: inout [Int], res: inout [[Int]], index: Int) {
		if ans.count == depth {
			res.append(Array.init(ans))
			return
		}
		for i in index..<nums.count {
			ans.append(nums[i])
			dfs78(depth: depth, nums: nums, ans: &ans, res: &res, index: i+1)
			ans.removeLast()
		}
	}
	
	func exist(_ board: [[Character]], _ word: String) -> Bool {
		let m = board.count
		if m == 0 {
			return false
		}
		let n = board[0].count
		if n == 0 {
			return false
		}
		let dir = [[1,0],[0,1],[-1,0],[0,-1]]
		var marked = Array.init(repeating: Array.init(repeating: false, count: n), count: m)
		for i in 0..<m {
			for j in 0..<n {
				if dfs79(board, start: 0, marked: &marked, word: word, i: i, j: j, dir: dir) {
					return true
				}
			}
		}
		return false
	}
	
	func dfs79(_ board: [[Character]], start: Int, marked: inout [[Bool]], word: String, i: Int, j: Int, dir: [[Int]]) -> Bool {
		if start == word.count - 1 {
			return board[i][j] == word[start]
		}
		if board[i][j] == word[start] {
			marked[i][j] = true
			for k in 0..<4 {
				let nx = i + dir[k][0]
				let ny = j + dir[k][1]
				if inArea79(i: nx, j: ny, m: board.count, n: board[0].count) && !marked[nx][ny] {
					if dfs79(board, start: start+1, marked: &marked, word: word, i: nx, j: ny, dir: dir) {
						return true
					}
				}
			}
			marked[i][j] = false
		}
		return false
	}
	
	func inArea79(i: Int, j: Int, m: Int, n: Int) -> Bool {
		return i >= 0 && i < m && j >= 0 && j < n
	}
	
	func removeDuplicates(_ nums: inout [Int]) -> Int {
		var lastv: Int?
		var lastVC = 0
		var i = 0
		while i < nums.count {
			if lastv == nil {
				lastv = nums[i]
				lastVC+=1
				i+=1
			}
			else {
				if lastv! != nums[i] {
					lastv = nums[i]
					lastVC = 1
					i+=1
				}
				else {
					if lastVC >= 2 {
						nums.remove(at: i)
					}
					else {
						lastVC+=1
						i+=1
					}
				}
			}
		}
		return nums.count
	}
	
	//	func deleteDuplicates(_ head: ListNode?) -> ListNode? {
	//		var ans = [Int]()
	//		var node = head
	//		var lastV: Int?
	//		while node != nil {
	//			if lastV == nil {
	//				ans.append(1)
	//			}
	//			else {
	//				if lastV == node?.val {
	//					ans[ans.count-1]+=1
	//				}
	//			}
	//			lastV = node?.val
	//		}
	//		node = head
	//
	//	}
	
	func deleteDuplicates(_ head: ListNode?) -> ListNode? {
		var dummy = ListNode.init(0)
		dummy.next = head
		var pre = head
		var prepre = dummy
		var node = head?.next
		while node != nil {
			if pre!.val == node!.val {
				if node?.val != node?.next?.val {
					prepre.next = node?.next
					pre = node?.next
					node = node?.next?.next
				}
				else {
					node = node?.next
				}
			}
			else {
				prepre = prepre.next!
				pre = pre?.next
				node = node?.next
			}
		}
		return dummy.next
	}
	
	
	func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
		var ans = [Int]()
		var res = [[Int]]()
		var sortedNums = nums.sorted { $1 > $0 }
		for i in 0...nums.count {
			dfs90(depth: i, nums: sortedNums, ans: &ans, res: &res, index: 0)
		}
		return res
	}
	
	func dfs90(depth: Int, nums: [Int], ans: inout [Int], res: inout [[Int]], index: Int) {
		if ans.count == depth {
			res.append(Array.init(ans))
			return
		}
		var lastv: Int?
		for i in index..<nums.count {
			if lastv == nil {
				lastv = nums[i]
			}
			else {
				if lastv! == nums[i] {
					continue
				}
				lastv = nums[i]
			}
			ans.append(nums[i])
			dfs90(depth: depth, nums: nums, ans: &ans, res: &res, index: i+1)
			ans.removeLast()
		}
	}
	
	func numDecodings(_ s: String) -> Int {
		if s.count == 0 {
			return s.count
		}
		if s.count == 1 {
			return s != "0" ? 1:0
		}
		let nums = s.map { Int(String($0)) }
		var pre = 1, cur = 1
		for i in 1..<nums.count {
			let tmp = cur
			if nums[i] == 0 {
				if nums[i-1]! <= 2 {
					cur = pre
				}
				else {
					return 0
				}
			}
			else if nums[i-1]! == 1 || (nums[i-1]! == 2 && nums[i]! <= 6) {
				cur = cur + pre
			}
			pre = tmp
		}
		return cur
	}
	
	func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
		var dummy = ListNode.init(0)
		dummy.next = head
		var g = dummy
		var p = dummy.next
		var i = 0
		while i < m - 1 {
			g = g.next!
			p = p?.next
			i+=1
		}
		for _ in 0..<n-m {
			let removed = p?.next
			p?.next = p?.next?.next
			g.next = removed
			removed?.next = p
			p = p?.next
		}
		return dummy.next
	}
	
	func reverse1(_ head: ListNode?) -> ListNode? {
		if head?.next == nil {
			return head
		}
		head?.next?.next = head
		let node = reverse1(head?.next)
		return node
	}
	
	func reverse2(_ head: ListNode?) -> ListNode? {
		if head?.next == nil {
			return head
		}
		let node = reverse2(head?.next)
		node?.next = head
		return head
	}
	
	func restoreIpAddresses(_ s: String) -> [String] {
		if s.count < 4 {
			return []
		}
		var res = [String]()
		var str = ""
		dfs93(s, index: 0, str: &str, depth: 0, res: &res)
		return res
	}
	
	func dfs93(_ s: String, index: Int, str: inout String, depth: Int, res: inout [String]) {
		if depth == 3 {
			if index >= s.count {
				return
			}
			let v = Int(String(s[index..<s.count]))
			if v! <= 255 {
				let nstr = str + String(s[index..<s.count])
				res.append(String.init(nstr))
			}
			return
		}
		let max = s.count > index + 3 ? index + 3 : s.count
		for i in index..<max {
			if i == max - 1 && Int(String(s[index..<max]))! > 255  {
				return
			}
			if s[i] == "0" && str.last != "." && str.count != 0 {
				return
			}
			let start = str.index(str.startIndex, offsetBy: str.count)
			str.append(String(s[index..<i+1]) + ".")
			dfs93(s, index: i+1, str: &str, depth: depth+1, res: &res)
			let end = str.index(str.startIndex, offsetBy: str.count-1)
			str.removeSubrange(start...end)
		}
	}
	
	func numTrees(_ n: Int) -> Int {
		var dp = Array.init(repeating: 0, count: n+1)
		dp[0] = 1
		dp[1] = 1
		if n < 2 {
			return 1
		}
		for i in 2...n {
			for j in 1...i {
				dp[i] = dp[i] + dp[j-1]*dp[i-j]
			}
		}
		return dp[n]
	}
	
	var res94 = [Int]()
	func inorderTraversal(_ root: TreeNode?) -> [Int] {
		var res = [Int]()
		
		rescuire94(root)
		return res94
	}
	
	func rescuire94(_ root: TreeNode?) {
		if root == nil {
			return
		}
		rescuire94(root?.left)
		res94.append(root!.val)
		rescuire94(root?.right)
	}
	// 98
	func isValidBST(_ root: TreeNode?) -> Bool {
		var stack = [TreeNode]()
		var p = root
		var pre: TreeNode?
		while p != nil || !stack.isEmpty {
			while p != nil {
				stack.append(p!)
				p = p?.left
			}
			p = stack.removeLast()
			if pre != nil && pre!.val >= p!.val {
				return false
			}
			pre = p
			p = p?.right
		}
		return true
	}
//	var pre: Int?
//	func isValidBST(_ root: TreeNode?) -> Bool {
//		if root == nil {
//			return true
//		}
//		if !isValidBST(root?.left) {
//			return false
//		}
//		if pre != nil && pre! >= root!.val {
//			return false
//		}
//		pre = root!.val
//		return isValidBST(root?.right)
//	}
	
	
//	func isBST981(_ root: TreeNode?, max: Int, min: Int) -> Bool{
//		if root == nil {
//			return true
//		}
//		if root!.val >= max || root!.val <= min {
//			return false
//		}
//		return isBST981(root?.left, max: root!.val, min: min) && isBST981(root?.right, max: max, min: root!.val)
//	}

	func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
		if p == nil && q == nil {
			return true
		}
		if p == nil || q == nil {
			return false
		}
		if p!.val != q!.val {
			return false
		}
		return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
	}
	
	func generateTrees(_ n: Int) -> [TreeNode?] {
		if n == 0 {
			return [TreeNode?]()
		}
		return rescuire95(1, n)
	}
	
	func rescuire95(_ start: Int, _ end: Int) -> [TreeNode?] {
		var res = [TreeNode?]()
		if start > end {
			res.append(nil)
			return res
		}
		if start == end {
			let t = TreeNode.init(start)
			res.append(t)
			return res
		}
		for i in start...end {
			let lr = rescuire95(start, i-1)
			let rr = rescuire95(i+1, end)
			for ln in lr {
				for rn in rr {
					let t = TreeNode.init(i)
					t.left = ln
					t.right = rn
					res.append(t)
				}
			}
		}
		return res
	}
	
	func isSymmetric(_ root: TreeNode?) -> Bool {
		return recurse101(left: root?.left, right: root?.right)
	}
	
	func recurse101(left: TreeNode?, right: TreeNode?) -> Bool {
		if left == nil && right == nil {
			return true
		}
		if left == nil || right == nil {
			return false
		}
		if left!.val != right!.val {
			return false
		}
		return recurse101(left: left?.right, right: right?.left) && recurse101(left: left?.left, right: right?.right)
	}
	
	func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
		if preorder.count == 0 || inorder.count == 0 {
			return nil
		}
		if inorder.count == 1 {
			let root = TreeNode.init(inorder[0])
			return root
		}
		let root = TreeNode.init(preorder[0])
		var i = 0
		while inorder[i] != preorder[0] {
			i+=1
		}
		if i > 0 {
			let lnpreorder = preorder[1...i]
			let lninorder = inorder[0..<i]
			let left = buildTree(Array(lnpreorder), Array(lninorder))
			root.left = left
		}
		else {
			root.left = nil
		}
		if i < preorder.count - 1 {
			let rninorder = inorder[i+1..<inorder.count]
			let rnpreorder = preorder[1+i..<preorder.count]
			let right = buildTree(Array(rnpreorder), Array(rninorder))
			root.right = right
		}
		else {
			root.right = nil
		}
		return root
	}
	
	func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
		var res = [[Int]]()
		dfs107(root, level: 0, res: &res)
		return res
	}
	
	func dfs107(_ root: TreeNode?, level: Int, res: inout [[Int]]) {
		if root == nil {
			return
		}
		if res.count <= level {
			var ans = [Int]()
			res.insert(ans, at: 0)
		}
		res[res.count - level - 1].append(root!.val)
		dfs107(root?.left, level: level+1, res: &res)
		dfs107(root?.right, level: level+1, res: &res)
	}
	
	func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
		if nums.count == 0 {
			return nil
		}
		return dfs108(left: 0, right: nums.count, nums: nums)
	}
	
	func dfs108(left: Int, right: Int, nums: [Int]) -> TreeNode? {
		if left > right {
			return nil
		}
		if left == right {
			return TreeNode.init(nums[left])
		}
		let m = (left + right)/2
		let root = TreeNode.init(nums[m])
		if left == m {
			root.left = nil
		}
		else {
			root.left = dfs108(left: left, right: m-1, nums: nums)
		}
		if right == m {
			root.right = nil
		}
		else {
			root.right = dfs108(left: m+1, right: right, nums: nums)
		}
		return root
	}
	
//	func sortedListToBST(_ head: ListNode?) -> TreeNode? {
//
//	}
//	var min110 = 0, max110 = 0
//	func isBalanced(_ root: TreeNode?) -> Bool {
//		dfs110(root, level: 0)
//		return re110
//	}
	
	func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
		return dfs112(root, sum, ans: 0)
	}
	
	func dfs112(_ root: TreeNode?, _ sum: Int, ans: Int) -> Bool {
		if root == nil {
			return sum == ans
		}
		if root?.left == nil && root?.right == nil {
			return sum == ans+root!.val
		}
		if root?.left == nil {
			return dfs112(root?.right, sum, ans: ans+root!.val)
		}
		if root?.right == nil {
			return dfs112(root?.left, sum, ans: ans+root!.val)
		}
		var flag = dfs112(root?.left, sum, ans: ans+root!.val)
		if flag {
			return true
		}
		flag = dfs112(root?.right, sum, ans: ans+root!.val)
		return flag
	}
	
	func flatten(_ root: TreeNode?) {
		var stack = [TreeNode]()
		var p = root
		var pre = root
		while p != nil || !stack.isEmpty {
			while p != nil {
				stack.append(p!)
				pre = p
				p = p?.left
			}
			var node = stack.removeLast()
			p = node.right
		}
	}
	
	func flattern(_ root: TreeNode?) {
		var node = root
		while node != nil {
			if node?.left == nil {
				node = node?.right
			}
			else {
				var pre = node?.left
				while pre?.right != nil {
					pre = pre?.right
				}
				pre?.right = node?.right
				node?.right = node?.left
				node?.left = nil
				node = node?.right
			}
		}
	}
	
	func connect(_ root: Node1?) -> Node1? {
		if root == nil {
			return nil
		}
		var left = root?.left
		var right = root?.right
		while left != nil {
			left?.next = right
			left = left?.right
			right = right?.left
		}
		connect(root?.left)
		connect(root?.right)
		return root
	}
	
	func generate(_ numRows: Int) -> [[Int]] {
		if numRows == 0 {
			return [[Int]]()
		}
		if numRows == 1 {
			return [[1]]
		}
		if numRows == 2 {
			return [[1],[1,1]]
		}
		var res = [[Int]]()
		res.append([1])
		res.append([1,1])
		for i in 3...numRows {
			var ans = [Int]()
			ans.append(1)
			var pre  = res.last![0]
			var cur = res.last![1]
			for j in 1...i-2 {
				ans.append(pre+cur)
				pre = cur
				if j != i-2 {
					cur = res.last![j+1]
				}
			}
			ans.append(1)
			res.append(ans)
		}
		return res
	}
	
	// 121
	func maxProfit(_ prices: [Int]) -> Int {
		if prices.count < 2 {
			return 0
		}
		var diff = Array.init(repeating: 0, count: prices.count-1)
		for i in 0..<prices.count-1 {
			diff[i] = prices[i+1] - prices[i]
		}
		var dp = Array.init(repeating: 0, count: prices.count)
		dp[0] = max(0, diff[0])
		var profit = dp[0]
		for i in 1..<diff.count {
			dp[i] = max(0, dp[i-1]+diff[i]) // 为什么这里是0 而第53题不是0，因为股票交易不允许有负值
			profit = max(profit, dp[i])
		}
		return profit
	}
	
//	func maxProfit(_ prices: [Int]) -> Int {
//		if prices.count < 2 {
//			return 0
//		}
//		let count = prices.count
//		var maxv = 0
//		for i in 0..<count-1 {
//			for j in i+1..<count {
//				maxv = max(maxv, prices[j]-prices[i])
//			}
//		}
//		return maxv
//	}
	
	
	
//	func sortList(_ head: ListNode?) -> ListNode? {
//
//	}
	
	// 125 超时
	func isPalindrome(_ s: String) -> Bool {
		if s.count < 2 {
			return true
		}
		var temp = ""
		for ch in s {
			if ch.isNumber || ch.isLowercase {
				temp.append(ch)
			}
			else if ch.isUppercase {
				temp.append(ch.lowercased())
			}
		}
		var i = 0, j = temp.count-1
		while i < j {
			if temp[i] != temp[j] {
				return false
			}
			i+=1
			j-=1
		}
		return true
	}
	
	// 126  超时了 ，但是跟题解的是一样的，可以试试其他语言
	func findLadders(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
		if !wordList.contains(endWord) || wordList.count == 0 {
			return []
		}
		var successors = [String:Set<String>]()
		var founded = false
		bfs126(beginWorld: beginWord, endWorld: endWord, wordList: wordList, founded: &founded, successors: &successors)
		if !founded {
			return []
		}
		var res = [[String]]()
		var ans = [String]()
		ans.append(beginWord)
		dfs126(beginWorld: beginWord, endWorld: endWord, ans: &ans, res: &res, successors: successors)
		return res
	}
	
	func bfs126(beginWorld: String, endWorld: String, wordList: [String], founded: inout Bool, successors: inout [String:Set<String>]) {
		var visited = Set<String>()
		visited.insert(beginWorld)
		visited.insert(endWorld)
		var beginVisited = Set<String>()
		beginVisited.insert(beginWorld)
		var endVisited = Set<String>()
		endVisited.insert(endWorld)
		var forward = true
		while !beginVisited.isEmpty && !endVisited.isEmpty {
			if beginVisited.count > endVisited.count {
				let temp = beginVisited
				beginVisited = endVisited
				endVisited = temp
				forward = !forward
			}
			var nextlLevelVisited = Set<String>()
			for currentWord in beginVisited {
				for j in 0..<beginWorld.count {
					let start = Character("a").asciiValue!
					let end = Character("z").asciiValue!
					var cs = Array(currentWord).map { (c) -> UInt8 in
						c.asciiValue!
					}
					let pre = cs[j]
					for k in start...end {
						if cs[j] == k {
							continue
						}
						cs[j] = k
						let nextWorld = String(cs.map({ (ascii) -> Character in
							Character(UnicodeScalar(ascii))
						}))
						if wordList.contains(nextWorld) {
							if endVisited.contains(nextWorld) {
								founded = true
								addToSuccessors(successors: &successors, forward: forward, currentWord: currentWord, nextWord: nextWorld)
							}
							if !visited.contains(nextWorld) {
								nextlLevelVisited.insert(nextWorld)
								addToSuccessors(successors: &successors, forward: forward, currentWord: currentWord, nextWord: nextWorld)
							}
						}
						cs[j] = pre
					}
				}
			}
			beginVisited = nextlLevelVisited
			visited.formUnion(nextlLevelVisited)
			if founded {
				break
			}
		}
	}
	
	func addToSuccessors(successors: inout [String:Set<String>], forward: Bool, currentWord: String, nextWord: String) {
		var cur = currentWord
		var next = nextWord
		if !forward {
			let tem = cur
			cur = next
			next = tem
		}
		if successors[cur] == nil {
			successors[cur] = Set<String>()
		}
		successors[cur]?.insert(next)
	}
	
	func dfs126(beginWorld: String, endWorld: String, ans: inout [String], res: inout [[String]], successors: [String:Set<String>]) {
		if beginWorld == endWorld {
			res.append(Array(ans))
			return
		}
		if !successors.keys.contains(beginWorld) {
			return
		}
		let set = successors[beginWorld]!
		for value in set {
			ans.append(value)
			dfs126(beginWorld: value, endWorld: endWorld, ans: &ans, res: &res, successors: successors)
			ans.removeLast()
		}
	}
	
//	func backtrack126(_ beginWord: String, _ endWord: String, _ worldList: [String], ans: inout [String], result: inout [[String]], depth: Int, used: inout [Bool]) {
//		if beginWord == endWord {
//			if result.count == 0 {
//				result.append(Array(ans))
//			}
//			else {
//				if ans.count < result[0].count {
//					result.removeAll()
//					result.append(Array(ans))
//				}
//				else if ans.count == result[0].count {
//					result.append(Array(ans))
//				}
//			}
//			// 相等
//			return
//		}
//		if depth >= worldList.count {
//			return
//		}
//		for i in 0..<worldList.count {
//			print("depth = \(depth) i = \(i)")
//			if used[i] {
//				continue
//			}
//			if isOnlyOneCharacterUnSame(beginWord, worldList[i]) && (result.count == 0 || result[0].count > ans.count) {
//				used[i] = true
//				ans.append(worldList[i])
//				backtrack126(worldList[i], endWord, worldList, ans: &ans, result: &result, depth: depth+1, used: &used)
//				ans.removeLast()
//				used[i] = false
//			}
//			else {
//				continue
//			}
//		}
//	}
	
//	func isOnlyOneCharacterUnSame(_ a: String, _ b: String) -> Bool {
//		var unsameCount = 0
//		for i in 0..<a.count {
//			if a[i] != b[i] {
//				unsameCount+=1
//			}
//			if unsameCount > 1 {
//				return false
//			}
//		}
//		return true
//	}
	
	// [0,3,7,2,5,8,4,6,0,1]
	// 128
	func longestConSecutive(nums: [Int]) -> Int {
		if nums.count == 0 {
			return 0
		}
		if nums.count == 1 {
			return 1
		}
		var map = [Int:Int]()
		var maxV = 0
		for i in 0..<nums.count {
			let num = nums[i]
			if map.keys.contains(num) {
				continue
			}
			let left = map[num-1] ?? 0
			let right = map[num+1] ?? 0
			let sum = left + 1 + right
			maxV = max(sum, maxV)
			map[num] = 0
			map[num-left] = sum
			map[num+right] = sum
			//MARK: - 为什么更新首尾的值就可以了
			//[1,2,3,4,5]，如果出现的新的值6，因为num-1的存在只会找到map[5]的值，如果出现新的值3，因为continue的存在，不会继续往下走，0和6同理
		}
		return maxV
	}
	
	func longestConSecutive2(nums: [Int]) -> Int {
		if nums.count == 0 {
			return 0
		}
		if nums.count == 1 {
			return 1
		}
		var maxV = 0
		let set = Set(nums)
		for i in 0..<nums.count {
			var num = nums[i]
			if set.contains(num-1) {
				continue
			}
			var count = 0
			while set.contains(num) {
				count+=1
				num+=1
			}
			maxV = max(maxV, count)
		}
		return maxV
	}
	
	// 129
	var sum129 = 0
	func sumNumbers(_ root: TreeNode?) -> Int {
		dfs129(root, ans: 0)
		return sum129
	}
	
	func dfs129(_ root: TreeNode?, ans: Int) {
		if root == nil {
			return
		}
		if root?.left == nil && root?.right == nil {
			sum129+=(ans*10+root!.val)
		} else if root?.left != nil && root?.right != nil {
			dfs129(root?.left, ans: ans*10+root!.val)
			dfs129(root?.right, ans: ans*10+root!.val)
		} else if root?.left != nil {
			dfs129(root?.left, ans: ans*10+root!.val)
		} else if root?.right != nil {
			dfs129(root?.right, ans: ans*10+root!.val)
		}
	}
	
	// 130
//	struct Tuple: Equatable, Hashable {
//
//		var a: Int
//		var b: Int
//
//		init(_ a: Int, _ b: Int) {
//			self.a = a
//			self.b = b
//		}
//
//		func hash(into hasher: inout Hasher) {
//			hasher.combine(a)
//			hasher.combine(b)
//		}
//
//	}
//
//	// 使用Tuple 超时
//	func solve(_ board: inout [[Character]]) {
//		if board.count == 0 {
//			return
//		}
//		if board.count == 1 && board[0].count == 0 {
//			return
//		}
//		var visited = Set<Tuple>()
//		let row = board.count
//		let column = board[0].count
//		var needChanges = [Tuple]()
//		for i in 0..<row {
//			for j in 0..<column {
//				if board[i][j] == "X" {
//					continue
//				}
//				if visited.contains(Tuple(i,j)) {
//					continue
//				}
//				var queue = [Tuple]()
//				queue.append(Tuple(i, j))
//				var containEdge = false
//				while !queue.isEmpty {
//					let tuple = queue.removeFirst()
//					if visited.contains(tuple) {
//						continue
//					}
//					visited.insert(tuple)
//					if !containEdge {
//						if isEdge130(v: tuple, row: row, column: column) {
//							containEdge = true
//							needChanges.removeAll()
//						}
//						else {
//							if board[tuple.a][tuple.b] == "O" && !needChanges.contains(tuple) {
//								needChanges.append(tuple)
//							}
//						}
//					}
//					let m = tuple.a, n = tuple.b
//					// 上面
//					if m > 0 && board[m-1][n] == "O" {
//						let next = Tuple(m-1, n)
//						if !queue.contains(next) {
//							queue.append(next)
//						}
//					}
//					// 下面
//					if m < row-1 && board[m+1][n] == "O" {
//						let next = Tuple(m+1, n)
//						if !queue.contains(next) {
//							queue.append(next)
//						}
//					}
//					// 左面
//					if n > 0 && board[m][n-1] == "O" {
//						let next = Tuple(m, n-1)
//						if !queue.contains(next) {
//							queue.append(next)
//						}
//					}
//					// 右面
//					if n < column-1 && board[m][n+1] == "O" {
//						let next = Tuple(m, n+1)
//						if !queue.contains(next) {
//							queue.append(next)
//						}
//					}
//				}
//				if needChanges.count != 0 {
//					for v in needChanges {
//						board[v.a][v.b] = "X"
//					}
//				}
//			}
//		}
//	}
//
//	func isEdge130(v: Tuple, row: Int, column: Int) -> Bool {
//		let a = v.a
//		let b = v.b
//		if a == 0 || a == row-1 {
//			return true
//		}
//		else if b == 0 || b == column-1 {
//			return true
//		}
//		return false
//	}
	
	func solve(board: inout [[Character]]) {
		if board.count == 0 || board[0].count == 0 {
			return
		}
		let directions = [[0,-1],[0,1],[-1,0],[1,0]]
		let row = board.count, column = board[0].count
		for i in 0..<column {
			if board[0][i] == "O" {
				dfs130(i: 0, j: i, directions: directions, board: &board)
			}
			if board[row-1][i] == "O" {
				dfs130(i: row-1, j: i, directions: directions, board: &board)
			}
		}
		for i in 0..<row {
			if board[i][0] == "O" {
				dfs130(i: i, j: 0, directions: directions, board: &board)
			}
			if board[i][column-1] == "O" {
				dfs130(i: i, j: column-1, directions: directions, board: &board)
			}
		}
		for i in 0..<row {
			for j in 0..<column {
				if board[i][j] == "O" {
					board[i][j] = "X"
				}
				if board[i][j] == "?" {
					board[i][j] = "O"
				}
			}
		}
	}
	
	func dfs130(i: Int, j: Int, directions: [[Int]], board: inout [[Character]]) {
		board[i][j] = "?"
		for dir in directions {
			let newI = i+dir[0]
			let newJ = j+dir[1]
			if newI < 0 || newI >= board.count || newJ < 0 || newJ >= board[0].count || board[newI][newJ] != "O" {
				continue
			}
			dfs130(i: newI, j: newJ, directions: directions, board: &board)
		}
	}
	
	// 131
	func partition(_ s: String) -> [[String]] {
		var res = [[String]]()
		var ans = [String]()
		for i in 1..<s.count {
			let maxLength = i
		}
		return res
	}
	
	func dfs131(ans: inout [String], res: inout [[String]], s: String, start: Int) {
		if start == s.count {
			res.append(Array(ans))
			return
		}
		for i in start..<s.count {
			if !isPalindrome131(s, left: start, right: i) {
				continue
			}
			ans.append(String(s[start..<i+1]))
			dfs131(ans: &ans, res: &res, s: s, start: i+1)
			ans.removeLast()
		}
	}
	
	func isPalindrome131(_ s: String, left: Int, right: Int) -> Bool {
		var l = left, r = right
		while l < r {
			if s[l] != s[r] {
				return false
			}
			l+=1
			r-=1
		}
		return true
	}
	
	var visited133 = [Int:Node]()
	func cloneGraph(_ node: Node?) -> Node? {
		if node == nil {
			return nil
		}
		if visited133[node!.val] != nil{
			return node
		}
		let cloneNode = Node(node!.val)
		visited133[node!.val] = cloneNode
		for neighbor in node!.neighbors {
			if let newNeighbor = dfs133(neighbor, visited: &visited133) {
				cloneNode.neighbors.append(newNeighbor)
			}
		}
		return cloneNode
	}
	
	func dfs133(_ node: Node?, visited: inout [Int:Node]) -> Node? {
		if node == nil {
			return nil
		}
		if visited[node!.val] != nil{
			return node
		}
		let cloneNode = Node(node!.val)
		visited[node!.val] = cloneNode
		for neighbor in node!.neighbors {
			if let v = visited[neighbor!.val] {
				cloneNode.neighbors.append(v)
				continue
			}
			if let newNeighbor = dfs133(neighbor, visited: &visited) {
				cloneNode.neighbors.append(newNeighbor)
			}
		}
		return cloneNode
	}
	
	// 134
	func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
		var result = -1
		var i = 0
		var a: UInt32 = 8
		while i < gas.count {
//			i = (i + cantReachCount)%gas.count
			var currentGas = gas[i]
			var currentCost = cost[i]
			var index = i
			var count = 0
			while currentGas >= currentCost && count < gas.count {
				let remainGas = currentGas - currentCost
				index = (index+1)%gas.count
				currentGas = gas[index] + remainGas
				currentCost = cost[index]
				count+=1
			}
			if count == gas.count {
				result = i
				break
			}
			else {
				i+=count
			}
			i+=1
		}
		return result
	}
	
	func candy(_ ratings: [Int]) -> Int {
		var left = Array(repeating: 1, count: ratings.count)
		var right = Array(repeating: 1, count: ratings.count)
		var sum = 0
		for i in 1..<ratings.count {
			if ratings[i] > ratings[i-1] {
				left[i] = left[i-1]+1
			}
		}
		sum+=left[ratings.count-1]
		for i in (0..<ratings.count-1).reversed() {
			if ratings[i] > ratings[i+1] {
				right[i] = right[i+1]+1
			}
			sum+=(max(left[i], right[i]))
		}
		return sum
	}
	
	// 136
//	func singleNumber(_ nums: [Int]) -> Int {
//		var map = [Int:Int]()
//		var num = 0
//		for i in nums {
//			if map[i] != nil {
//				num-=i
//			}
//			else {
//				map[i] = 1
//				num+=i
//			}
//		}
//		return num
//	}
//	func singleNumber(_ nums: [Int]) -> Int {
//		var ans = 0
//		for i in nums {
//			ans = ans ^ i
//		}
//		return ans
//	}
	
	// 137
//	func singleNumber(_ nums: [Int]) -> Int {
//		var ones = 0, twos = 0
//		for num in nums {
//			ones = ones ^ num & ~twos
//			twos = twos ^ num & ~ones
//		}
//		return ones
//	}
	
//	func singleNumber(_ nums: [Int]) -> Int {
//		var ans = 0
//		var c = 0
//		for i in (0..<32).reversed() {
//			var count = 0
//			for num in nums {
//				if (num >> i & 1) == 1  {
//					count+=1
//				}
//			}
//			if count%3 != 0 {
//				ans = (ans << (1+c)) + 1
//				c = 0
//			}
//			else {
//				c+=1
//			}
//		}
//		ans = ans << c
//		return ans
//	}
	
	class RandomNode {
		var val: Int
		var next: RandomNode?
		var random: RandomNode?
		init(_ val: Int) {
			self.val = val
			self.next = nil
			self.random = nil
		}
	}
	
	// 138
	func copyRandomList(_ head: RandomNode?) -> RandomNode? {
		if head == nil {
			return nil
		}
		var node = head
		while node != nil {
			let copy = RandomNode(node!.val)
			copy.next = node?.next
			node?.next = copy
			node = copy.next
		}
		node = head
		while node != nil {
			if node?.random != nil {
				node?.next?.random = node?.random?.next
			}
			node = node?.next?.next
		}
		node = head
		let dummy: RandomNode? = RandomNode(0)
		var cur = dummy
		while node != nil {
			cur?.next = node?.next
			cur = cur?.next
			node?.next = cur?.next
			node = node?.next
		}
		return dummy?.next
	}
	
	// 139
	var result139 = false
	func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
		if s.count == 0 {
			return false
		}
		if s.count == 1 {
			return wordDict.contains(s)
		}
		let set = Set<String>(wordDict)
		var visited: [Bool?] = Array(repeating: nil, count: s.count)
		return dfs139(start: 0, s: s, set: set, visited: &visited)
	}
	
	func dfs139(start: Int, s: String, set: Set<String>, visited: inout [Bool?]) -> Bool {
		if start >= s.count {
			return true
		}
		if visited[start] != nil {
			return visited[start]!
		}
		for i in start..<s.count {
			if set.contains(String(s[start..<i+1])) {
				if dfs139(start: i+1, s: s, set: set, visited: &visited) {
					visited[start] = true
					return true
				}
			}
		}
		visited[start] = false
		return false
	}
	
	
	func hasCycle(_ head: ListNode?) -> Bool {
		if head == nil {
			return false
		}
		if head?.next == nil {
			return false
		}
		var slow = head, fast = head?.next
		while slow != nil && fast != nil && slow!.val != fast!.val {
			slow = slow?.next
			fast = fast?.next?.next
		}
		if fast == nil {
			return false
		}
		else {
			return slow!.val == fast!.val
		}
		
	}
	
	// 142 java
//	func detectCycle(_ head: ListNode?) -> ListNode? {
//		if head == nil {
//			return nil
//		}
//		if head?.next == nil {
//			return nil
//		}
//		var slow = head, fast = head?.next
//		while slow != nil && fast != nil && slow!.val != fast!.val {
//			slow = slow?.next
//			fast = fast?.next?.next
//		}
//		if fast == nil {
//			return nil
//		}
//		let hasCycle = slow!.val == fast!.val
//		if !hasCycle {
//			return nil
//		}
//		let val = slow!.val
//		slow = slow?.next
//		// 计算环中节点的个数
//		var count = 1
//		while val != slow!.val  {
//			count+=1
//			slow = slow?.next
//		}
//		var p = head
//		for _ in 0..<count {
//			p = p?.next
//		}
//		var node = head
//		while p!.val != node!.val {
//			p = p?.next
//			node = node?.next
//		}
//		return p
//	}
	
	// 143
	func reorderList(_ head: ListNode?) {
		var p = head
		var count = 0
		while p != nil {
			p = p?.next
			count+=1
		}
		if count <= 2 {
			return
		}
		p = head
		let isEven = count%2 == 0
		let index = count/2
		for i in 0..<index {
			let temp = p?.next
			if isEven && i == index - 1 {
				p?.next = nil
			}
			p = temp
		}
		var next = p?.next
		p?.next = nil
		while next != nil {
			let temp = next?.next
			next?.next = p
			p = next
			next = temp
		}
		// t 是否头 p是尾
		var t = head
		var tn = t?.next
		var pn = p?.next
		for _ in 0..<count/2 {
			t?.next = p
			p?.next = tn
			t = tn
			p = pn
			tn = tn?.next
			pn = pn?.next
		}
	}
	
	// 144
	func preorderTraversal(_ root: TreeNode?) -> [Int] {
		if root == nil {
			return []
		}
		var stack = [TreeNode?]()
		var res = [Int]()
		var p = root
		while true {
			while p != nil {
				res.append(p!.val)
				if p?.right != nil {
					stack.append(p!.right!)
				}
				p = p?.left
			}
			if stack.isEmpty {
				break
			}
			p = stack.removeLast()
		}
		return res
	}
	
	func postorderTraversal(_ root: TreeNode?) -> [Int] {
		if root == nil {
			return []
		}
		var stack = [TreeNode]()
		var res = [Int]()
		var p = root
		var last: TreeNode? = nil
		while !stack.isEmpty || p != nil {
			while p != nil {
				stack.append(p!)
				p = p?.left
			}
			if stack.isEmpty {
				break
			}
			let temp = stack.last
			if temp?.right != nil && temp?.right != last {
				p = temp?.right
			}
			else {
				res.append(temp!.val)
				last = temp
				stack.removeLast()
			}
		}
		return res
	}
	
//	func inorder(root: TreeNode?) {
//		if root == nil {
//			return
//		}
//		inorder(root: root?.left)
//		print(root!.val)
//		inorder(root: root?.right)
//	}
//
//	func afterorder(root: TreeNode?) {
//		if root == nil {
//			return
//		}
//		afterorder(root: root?.left)
//		afterorder(root: root?.right)
//		print(root!.val)
//	}
	
}

//[
//["hit", "hot", "dot", "dog", "log", "cog"],
//["hit", "hot", "dot", "dog", "cog"],
//["hit", "hot", "dot", "lot", "log", "dog", "cog"],
//["hit", "hot", "dot", "lot", "log", "cog"],
//["hit", "hot", "lot", "dot", "dog", "log", "cog"],
//["hit", "hot", "lot", "dot", "dog", "cog"],
//["hit", "hot", "lot", "log", "dog", "cog"],
//["hit", "hot", "lot", "log", "cog"]]
