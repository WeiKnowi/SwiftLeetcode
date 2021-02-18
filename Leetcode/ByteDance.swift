//
//  ByteDance.swift
//  Leetcode
//
//  Created by 未可知 on 2021/1/5.
//  Copyright © 2021 com.septnet.business. All rights reserved.
//

import Foundation

class ByteDance {
	init() {
	}
	
	// 206
	func reverseList(_ head: ListNode?) -> ListNode? {
		if head?.next == nil {
			return head
		}
		let node = reverseList(head?.next)
		head?.next?.next = head
		head?.next = nil
		return node
	}
	
	// 25
	func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
		if k == 1 || head?.next == nil {
			return head
		}
		var p = head
		var dummy: ListNode? = ListNode(0)
		dummy?.next = p
		var lastTail = dummy
		while p != nil {
			let oldHead = p
			for _ in 0..<k-1 {
				if p == nil {
					break
				}
				p?.next?.next = p
				let temp = p?.next
				p = temp
			}
			lastTail?.next = p
			lastTail = oldHead
			p = p?.next
		}
		return dummy?.next
	}
	
	//	func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
	//		var p = headA
	//		var countA = 0
	//		while p != nil {
	//			countA+=1
	//			p = p?.next
	//		}
	//		p = headB
	//		var countB = 0
	//		while p != nil {
	//			countB+=1
	//			p = p?.next
	//		}
	//		var pa = headA
	//		var pb = headB
	//		if countA > countB {
	//			for _ in 0..<countA-countB {
	//				pb = pb?.next
	//			}
	//		}
	//		else {
	//			for _ in 0..<countB-countA {
	//				pa = pa?.next
	//			}
	//		}
	//		while pa != pb {
	//			pa = pa?.next
	//			pb = pb?.next
	//		}
	//		return pa
	//	}
	
	// 53
	func maxSubArray(_ nums: [Int]) -> Int {
		if nums.count == 0 {
			return 0
		}
		var ans = nums[0]
		var dp = Array(repeating: 0, count: nums.count)
		dp[0] = nums[0]
		for i in 1..<nums.count {
			dp[i] = max(dp[i-1]+nums[i], nums[i])
			ans = max(ans, dp[i])
		}
		return ans
	}
	
	// 215
	//	func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
	//		if nums.count == 0 {
	//			return 0
	//		}
	//		let n = nums.sorted { $0 > $1 }
	//		var ans = 0
	//		for i in 0..<k {
	//			ans = n[i]
	//		}
	//		return ans
	//	}
	
	//		func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
	//			if nums.count == 0 {
	//				return 0
	//			}
	//			var map = [Int:Int]()
	//			var maxv = nums[0]
	//			for num in nums {
	//				maxv = max(maxv, num)
	//				if map[num] == nil {
	//					map[num] = 1
	//				}
	//				else {
	//					map[num] = map[num]! + 1
	//				}
	//			}
	//			var m = 0
	//			var ans = 0
	//			var i = maxv
	//			while m != k {
	//				if map[i] != nil {
	//					let v = map[i]!
	//					ans = i
	//					for j in 0..<v {
	//						m+=1
	//						if m == k {
	//							break
	//						}
	//					}
	//				}
	//				i-=1
	//			}
	//			return ans
	//		}
	func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
		if nums.count == 0 {
			return 0
		}
		var n = nums
		var left = 0
		var right = nums.count - 1
		let target = nums.count - k
		while true {
			let index = partition(nums: &n, left: left, right: right)
			if index == target {
				return nums[index]
			}
			else if index < target {
				left = index + 1
			}
			else {
				right = index - 1
			}
		}
		return 0
	}
	
	func partition(nums: inout [Int], left: Int, right: Int) -> Int {
		let pivot = nums[left]
		var j = left
		if left+1 > right {
			return left
		}
		for i in left+1...right {
			if nums[i] < pivot {
				j+=1
				nums.swapAt(i, j)
			}
		}
		nums.swapAt(left, j)
		return j
	}
	
	// 3
	// 超时
	//	func lengthOfLongestSubstring(_ s: String) -> Int {
	//		var maxv = 0
	//		var left = 0, right = 0
	//		for i in 0..<s.count {
	//			if left == right {
	//				right+=1
	//				maxv = max(maxv, right-left)
	//			}
	//			else {
	//				var equal = left
	//				for j in left..<right {
	//					if s[i] == s[j] {
	//						equal = j+1
	//					}
	//				}
	//				left = equal
	//				right+=1
	//				maxv = max(maxv, right-left)
	//			}
	//		}
	//		return maxv
	//	}
	
	func lengthOfLongestSubstring(_ s: String) -> Int {
		var maxv = 0
		var map = [Character:Int]()
		var left = 0
		for i in 0..<s.count {
			if map.contains(where: { $0.key == s[i]! }) {
				left = max(map[s[i]!]!+1, left)
			}
			map[s[i]!]=i
			maxv = max(maxv, i-left+1)
		}
		return maxv
	}
	
	// 199
	//	func rightSideView(_ root: TreeNode?) -> [Int] {
	//		if root == nil {
	//			return []
	//		}
	//		var ans = [TreeNode]()
	//		ans.append(root!)
	//		var res = [Int]()
	//		while !ans.isEmpty {
	//			res.append(ans.last!.val)
	//			var temp = [TreeNode]()
	//			for node in ans {
	//				if node.left != nil {
	//					temp.append(node.left!)
	//				}
	//				if node.right != nil {
	//					temp.append(node.right!)
	//				}
	//			}
	//			ans.removeAll()
	//			ans.append(contentsOf: temp)
	//		}
	//		return res
	//	}
	
	func rightSideView(_ root: TreeNode?) -> [Int] {
		if root == nil {
			return []
		}
		var res = [Int]()
		dfs199(root: root, res: &res, depth: 0)
		return res
	}
	
	func dfs199(root: TreeNode?, res: inout [Int], depth: Int) {
		if root == nil {
			return
		}
		if depth == res.count {
			res.append(root!.val)
		}
		dfs199(root: root?.right, res: &res, depth: depth+1)
		dfs199(root: root?.left, res: &res, depth: depth+1)
	}
	
	// 15
	// 超时
	//	func threeSum(_ nums: [Int]) -> [[Int]] {
	//		if nums.count < 3 {
	//			return []
	//		}
	//		var res = [[Int]]()
	//		let n = nums.sorted { $0 < $1 }
	//		if n[0] > 0 || n[n.count-1] < 0 {
	//			return []
	//		}
	//		var i = 0, j = 0, k = 0
	//		while i < n.count - 2 {
	//			if i != 0 && n[i] == n[i-1] {
	//				i+=1
	//				continue
	//			}
	//			j = i + 1
	//			while j < n.count - 1 {
	//				if j != 1 && n[j] == n[j-1] {
	//					j+=1
	//					continue
	//				}
	//				if n[i] + n[j] > 0 {
	//					// 前俩位大于0，最后一位一定大于等于0，所以相加不可能等于0
	//					break
	//				}
	//				k = n.count - 1
	//				while k > j {
	//					if n[i]+n[j]+n[k] < 0 {
	//						break
	//					}
	//					if n[i]+n[j]+n[k] == 0 {
	//						res.append([n[i], n[j], n[k]])
	//						break
	//					}
	//					k-=1
	//				}
	//				j+=1
	//			}
	//			i+=1
	//		}
	//		return res
	//	}
	
	func threeSum(_ nums: [Int]) -> [[Int]] {
		if nums.count < 3 {
			return []
		}
		let n = nums.sorted { $0 < $1 }
		var res = [[Int]]()
		for i in 0..<n.count {
			if n[i] > 0 {
				break
			}
			if i != 0 && n[i] == n[i-1] {
				continue
			}
			var L = i+1, R = n.count-1
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
				} else if sum > 0 {
					R-=1
				} else {
					L+=1
				}
			}
		}
		return res
	}
	
	// 236
	func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
		if root == nil || root?.val == p?.val || root?.val == q?.val {
			return root
		}
		let left = lowestCommonAncestor(root?.left, p, q)
		let right = lowestCommonAncestor(root?.right, p, q)
		if left == nil && right == nil {
			return nil
		} else if left == nil {
			return right
		} else if right == nil {
			return left
		}
		return root
	}
	
	func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
		if l1 == nil && l2 == nil {
			return nil
		} else if l1 == nil {
			return l2
		} else if l2 == nil {
			return l1
		}
		if l1!.val > l2!.val {
			let node = mergeTwoLists(l1, l2?.next)
			l2?.next = node
			return l2
		}
		else {
			let node = mergeTwoLists(l1?.next, l2)
			l1?.next = node
			return l1
		}
	}
	
	// 1
	//	func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
	//		var ns = nums.sorted { $0 < $1 }
	//		for i in 0..<ns.count-1 {
	//			let one = ns[i]
	//			if target >= 0 && one > target  {
	//				break
	//			}
	//			if target < 0 && one >= 0 {
	//				break
	//			}
	//			let two = target - one
	//			var L = i+1, R = ns.count-1
	//			while L <= R {
	//				let M = (L+R)/2
	//				if ns[M] == two {
	//					return [i, M]
	//				} else if ns[M] > two {
	//					R = M - 1
	//				} else {
	//					L = M + 1
	//				}
	//			}
	//		}
	//		return []
	//	}
	
	//	func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
	//		for i in 0..<nums.count-1 {
	//			for j in i+1..<nums.count {
	//				if nums[i] + nums[j] == target {
	//					return [i,j]
	//				}
	//			}
	//		}
	//		return []
	//	}
	
	func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
		var map = [Int:Int]()
		for i in 0..<nums.count-1 {
			let tmp = target - nums[i]
			if map.contains(where: { (key, value) -> Bool in
				return key == tmp
			}) {
				return [i, map[tmp]!]
			}
			map[nums[i]] = i
		}
		return []
	}
	
	// 958
	func isCompleteTree(_ root: TreeNode?) -> Bool {
		if root == nil {
			return true
		}
		var queue = [TreeNode?]()
		queue.append(root)
		var prev = root
		while !queue.isEmpty {
			let node = queue.removeFirst()
			if prev == nil && node != nil {
				return false
			}
			if node != nil {
				queue.append(node?.left)
				queue.append(node?.right)
			}
			prev = node
		}
		return true
	}
	
	// 543
	func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
		if root == nil {
			return 0
		}
		var v = 0
		dfs543(root, value: &v)
		return v
	}
	
	func dfs543(_ root: TreeNode?, value: inout Int) -> Int {
		if root == nil {
			return 0
		}
		let left = dfs543(root?.left, value: &value)
		let right = dfs543(root?.right, value: &value)
		value = max(value, left+right)
		return max(left+1, right+1)
	}
	
	// 34
	func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
		if nums.count == 0 {
			return [-1, -1]
		}
		let left = lBackTrack(nums, target)
		if left == -1 {
			return [-1,-1]
		}
		let right = rBackTrack(nums, target)
		return [left ,right]
	}
	
	func lBackTrack(_ nums: [Int], _ target: Int) -> Int {
		var L = 0, R = nums.count - 1
		while L < R {
			let M = (L + R)/2
			if nums[M] < target {
				L = M+1
			}
			else if nums[M] > target {
				R = M - 1
			}
			else {
				R = M
			}
		}
		if nums[L] == target {
			return L
		}
		return -1
	}
	
	func rBackTrack(_ nums: [Int], _ target: Int) -> Int {
		var L = 0, R = nums.count - 1
		while L < R {
			let M = (L + R + 1)/2
			if nums[M] < target {
				L = M+1
			}
			else if nums[M] > target {
				R = M - 1
			}
			else {
				L = M
			}
		}
		return L
	}
	
	// 200
	// 注意行和列
	func numIslands(_ grid: [[Character]]) -> Int {
		let row = grid.count
		let column = grid[0].count
		var visited = Array(repeating: Array(repeating: false, count: column), count: row)
		var count = 0
		for i in 0..<row {
			for j in 0..<column {
				if visited[i][j] {
					continue
				}
				if grid[i][j] == "0" {
					continue
				}
				count+=1
				visited[i][j] = true
				var stack = [(Int, Int)]()
				stack.append((i, j))
				while !stack.isEmpty {
					let tuple = stack.removeFirst()
					let m = tuple.0
					let n = tuple.1
					
					// 左边
					if n > 0 && grid[m][n-1] == "1" && visited[m][n-1] == false {
						visited[m][n-1] = true
						stack.append((m, n-1))
					}
					
					// 上边
					if m > 0 && grid[m-1][n] == "1" && visited[m-1][n] == false {
						visited[m-1][n] = true
						stack.append((m-1, n))
					}
					
					// 右边
					if n < column - 1 && grid[m][n+1] == "1" && visited[m][n+1] == false {
						visited[m][n+1] = true
						stack.append((m, n+1))
					}
					
					// 下边
					if m < row - 1 && grid[m+1][n] == "1" && visited[m+1][n] == false {
						visited[m+1][n] = true
						stack.append((m+1, n))
					}
				}
			}
		}
		return count
	}
	
	// 104
	func maxDepth(_ root: TreeNode?) -> Int {
		if root == nil {
			return 0
		}
		let left = maxDepth(root?.left)
		let right = maxDepth(root?.right)
		return max(left + 1, right + 1)
	}
	
	// 101
	func isSymmetric(_ root: TreeNode?) -> Bool {
		if root == nil {
			return true
		}
		return dfs101(root?.left, root?.right)
	}
	
	func dfs101(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
		if left == nil && right == nil {
			return true
		} else if left == nil || right == nil {
			return false
		}
		else {
			if left!.val != right!.val {
				return false
			}
		}
		return dfs101(left?.left, right?.right) && dfs101(left?.right, right?.left)
	}
	
	// 151
	//	func reverseWords(_ s: String) -> String {
	//		if s.count == 0 {
	//			return ""
	//		}
	//		var res = String()
	//		var ans = [Character]()
	//		var last: Character = s.last!
	//		for c in s.reversed() {
	////			let c = s[i]!
	//			if c == " " {
	//				if res.count == 0 && ans.count == 0 {
	//					last = c
	//					continue
	//				}
	//				else {
	//					if last == " " {
	//						 last = c
	//						continue
	//					}
	//					else {
	//						res.append(contentsOf: ans.reversed())
	//						res.append(" ")
	//						ans.removeAll()
	//					}
	//				}
	//			}
	//			else {
	//				ans.append(c)
	//			}
	//			last = c
	//		}
	//		if ans.count != 0 {
	//			res.append(contentsOf: ans.reversed())
	//		}
	//		else {
	//			if res.count != 0 {
	//				res.removeLast()
	//			}
	//		}
	//		return res
	//	}
	
	// 双指针法
	func reverseWords(_ s: String) -> String {
		var res = String()
		let string = s.trimmingCharacters(in: .whitespaces)
		var i = string.count - 1, j = i
		while i >= 0 {
			while i >= 0 && string[i] != " " {
				i-=1
			}
			let tmp = string[i+1..<j+1]
			res.append(contentsOf: tmp + " ")
			while i >= 0 && string[i] == " " {
				i-=1
			}
			j = i
		}
		return res.trimmingCharacters(in: .whitespaces)
	}
	
	// 189
	// 第一种
//	func rotate(_ nums: inout [Int], _ k: Int) {
//		if k == 0 {
//			return
//		}
//		let m = k%nums.count
//		for _ in 0..<m {
//			nums.insert(nums.removeLast(), at: 0)
//		}
//	}
	
	func rotate(_ nums: inout [Int], _ k: Int) {
		let n = nums.count
		let count = gcd189(n, k)
		for start in 0..<count {
			var current = start
			var pre = nums[start]
			repeat {
				let next = (current + k)%n
				let tmp = nums[next]
				nums[next] = pre
				pre = tmp
				current = next
			} while start != current
		}
	}
	
	func gcd189(_ x: Int, _ y: Int) -> Int {
		return y > 0 ? gcd189(y, x%y) : x
	}
	
	// 165
	func compareVersion(_ version1: String, _ version2: String) -> Int {
		let v1 = version1.split(separator: ".").map { (str) -> Int in
			return Int(str)!
		}
		let v2 = version2.split(separator: ".").map { (str) -> Int in
			return Int(str)!
		}
		let count = min(v1.count, v2.count)
		for i in 0..<count {
			if v1[i] > v2[i] {
				return 1
			} else if v1[i] < v2[i] {
				return -1
			}
		}
		if v1.count > v2.count {
			for v in v1[count..<v1.count] {
				if v > 0 {
					return 1
				}
			}
		} else if v1.count < v2.count {
			for v in v2[count..<v2.count] {
				if v > 0 {
					return -1
				}
			}
		} else {
			return 0
		}
		return 0
	}
	
	// 394
	func decodeString(_ s: String) -> String {
//		let aasc = Character("a").asciiValue!
//		let zasc = Character("z").asciiValue!
		let asc1 = Character("0").asciiValue!
		let asc9 = Character("9").asciiValue!
		var res = String()
		var i = 0
		while i < s.count {
			var tmp: String = String(s[i]!)
			let asc = s[i]!.asciiValue!
			// 是数字
			if asc >= asc1 && asc <= asc9 {
				var nstr = String()
				while s[i]!.asciiValue! >= asc1 && s[i]!.asciiValue! <= asc9 {
					nstr.append(s[i]!)
					i+=1
				}
				var backet = 1
				let start = i+1
				while backet != 0 {
					i+=1
					if s[i]! == "[" {
						backet+=1
					}
					else if s[i]! == "]" {
						backet-=1
					}
				}
				let v = decodeString(String(s[start..<i+1]))
				let count = Int(nstr)!
				var tmpres = ""
				for _ in 0..<count {
					tmpres.append(v)
				}
				tmp = tmpres
			}
			i+=1
			res.append(tmp)
		}
		return res
	}
	
	// 415
	func addStrings(_ num1: String, _ num2: String) -> String {
		var overflow = 0
		var res = String()
		var newnum1 = num1
		var newnum2 = num2
		if newnum1.count < newnum2.count {
			var str0 = ""
			for _ in 0..<newnum2.count - newnum1.count {
				str0.append("0")
			}
			newnum1 = str0 + newnum1
		} else if newnum1.count > newnum2.count {
			var str0 = ""
			for _ in 0..<newnum1.count - newnum2.count {
				str0.append("0")
			}
			newnum2 = str0 + newnum2
		}
		for i in (0..<newnum1.count).reversed() {
			let n1 = Int(String(newnum1[i]!))!
			let n2  = Int(String(newnum2[i]!))!
			let v = overflow + n1 + n2
			res.insert(Character(String(v%10)), at: res.startIndex)
			overflow = v/10
		}
		if overflow == 1 {
			res.insert("1", at: res.startIndex)
		}
		return res
	}
	
	// 113
	func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
		if root == nil {
			return [[Int]]()
		}
		var ans = [Int]()
		var res = [[Int]]()
		ans.append(root!.val)
		dfs113(root, ans: &ans, res: &res, sum: root!.val, target: sum)
		return res
	}
	
	func dfs113(_ root: TreeNode?, ans: inout [Int], res: inout [[Int]], sum: Int, target: Int) {
		if root?.left == nil && root?.right == nil {
			if sum == target {
				res.append(Array(ans))
			}
			return
		}
		if root?.left != nil {
		   ans.append(root!.left!.val)
		   dfs113(root?.left, ans: &ans, res: &res, sum: sum + root!.left!.val, target: target)
		   ans.removeLast()
	   }
		if root?.right != nil {
			ans.append(root!.right!.val)
			dfs113(root?.right, ans: &ans, res: &res, sum: sum + root!.right!.val, target: target)
			ans.removeLast()
		}
	}
	
	
	//69
	func mySqrt(_ x: Int) -> Int {
		var left = 0, right = x
		while left < right {
			let mid = (left + right)/2
			let res = mid*mid
			if res == x {
				return mid
			}
			else if res > x {
				right = mid
			}
			else {
				left = mid+1
			}
		}
		if left*left == x {
			return left
		} else if left*left < x {
			return left
		}
		else {
			return left - 1
		}
	}
	
	// 300
	func lengthOfLIS(_ nums: [Int]) -> Int {
		var dp = Array(repeating: 1, count: nums.count)
		var res = 0
		for i in 0..<nums.count {
			for j in 0..<i {
				if nums[i] > nums[j] {
					dp[i] = max(dp[i], dp[j]+1)
				}
			}
			res = max(res, dp[i])
		}
		return res
	}
	

	// 剑指offer27
	func mirrorTree(_ root: TreeNode?) -> TreeNode? {
		if root == nil {
			return nil
		}
		let node = TreeNode(root!.val)
		node.left = mirrorTree(root?.left)
		node.right = mirrorTree(root?.right)
		return node
	}
	
	func firstMissingPositive(_ nums: [Int]) -> Int {
		var ns = nums
		for i in 0..<ns.count {
			while ns[i] > 0 && ns[i] <= ns.count && ns[ns[i]-1] != ns[i] {
				ns.swapAt(i, ns[i]-1)
			}
		}
		for i in 0..<ns.count {
			if ns[i] != i+1 {
				return i+1
			}
		}
		return ns.count + 1
	}
	
	// 162
//	func findPeakElement(_ nums: [Int]) -> Int {
//		if nums.count == 1 {
//			return 0
//		}
//		var i = 1
//		while i < nums.count {
//			if nums[i] > nums[i-1] {
//				return i
//			}
//			i+=1
//		}
//		return i - 1
//	}
	
	//
	func findPeakElement(_ nums: [Int]) -> Int {
		var left = 0, right = nums.count
		while left < right {
			let mid = (left + right)/2
			if nums[mid+1] > nums[mid] {
				left = mid + 1
			}
			else {
				right = mid
			}
		}
		return left
	}
	
	// 5 超时 使用java
	func longestPalindrome(_ s: String) -> String {
		if s.count == 1 {
			return s
		}
		var start = 0
		var end = 0
		for i in 0..<s.count {
			let l1 = expandAroundCenter(s: s, left: i, right: i)
			let l2 = expandAroundCenter(s: s, left: i, right: i+1)
			let l = max(l1, l2)
			if l > end - start {
				start = i - (l - 1)/2
				end = i + l/2 + 1
			}
		}
		return String(s[start..<end])
	}
	
	func expandAroundCenter(s: String, left: Int, right: Int) -> Int {
		var l = left
		var r = right
		while l >= 0 && r < s.count && s[l] == s[r] {
			l-=1
			r+=1
		}
		return r - l - 1
	}
	
	// 240
//	func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
//		if matrix.count == 0 || matrix[0].count == 0 {
//			return false
//		}
//		let m = matrix.count
//		let n = matrix[0].count
//		for i in 0..<m {
//			let list = matrix[i]
//			var l = 0, r = n - 1
//			while l < r {
//				let mid = (l + r)/2
//				if list[mid] == target {
//					return true
//				}
//				else if list[mid] > target {
//					r = mid
//				}
//				else {
//					l = mid + 1
//				}
//			}
//			if list[l] == target {
//				return true
//			}
//		}
//		return false
//	}
	
	func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
		if matrix.count == 0 || matrix[0].count == 0 {
			return false
		}
		let m = matrix.count
		let n = matrix[0].count
		var i = 0, j = n - 1
		while j >= 0 && i <= m - 1 {
			if matrix[i][j] == target {
				return true
			}
			else if matrix[i][j] > target {
				j-=1
			}
			else {
				i+=1
			}
		}
		return false
	}
	
	// 438 超时 cbaebabacd abc
//	func findAnagrams(_ s: String, _ p: String) -> [Int] {
//		if p.count > s.count {
//			return []
//		}
//		var res = [Int]()
//		let n = s.count - p.count + 1
//		for i in 0..<s.count - p.count + 1 {
//			if isYiWei(s, start: i, end: i+p.count, p) {
//				res.append(i)
//			}
//		}
//		return res
//	}
//
//	func isYiWei(_ a: String, start: Int, end: Int,  _ b: String) -> Bool {
//		var map = [Character:Int]()
//		for c in b {
//			if map[c] == nil {
//				map[c] = 1
//			}
//			else {
//				map[c] = map[c]! + 1
//			}
//		}
//		for i in start..<end + 1 {
//			let c = a[i]!
//			if map[c] == nil || map[c]! == 0 {
//				return false
//			}
//			else {
//				map[c] = map[c]! - 1
//			}
//		}
//		return true
//	}
	func findAnagrams(_ s: String, _ p: String) -> [Int] {
		let arrs: [Character] = Array(s)
		let arrp: [Character] = Array(p)
		let base = Character("a").asciiValue!
		var window = Array(repeating: 0, count: 26)
		var needs = Array(repeating: 0, count: 26)
		var res = [Int]()
		for c in arrp {
			needs[Int(c.asciiValue!-base)]+=1
		}
		var left = 0, right = 0
		while right < arrs.count {
			let curR = Int(arrs[right].asciiValue! - base)
			right+=1
			window[curR]+=1
			while window[curR] > needs[curR] {
				let curL = Int(arrs[left].asciiValue!-base)
				left+=1
				window[curL]-=1
			}
			if right - left == arrp.count {
				res.append(left)
			}
		}
		return res
	}
	
	func treeToDoublyList(_ root: TreeNode?) -> TreeNode? {
		if root == nil {
			return nil
		}
		var stack = [TreeNode]()
		var p = root
		while !stack.isEmpty || p != nil {
			while p != nil {
				stack.append(p!)
				p = p?.left
			}
			let pre = stack.removeLast()
			let next = stack.last
			pre.right = next
			next?.left = pre
			p = pre.right
		}
	}
	
	//FIXME:-解决
	func mergeList(m: ListNode?, n: ListNode?) -> ListNode? {
		if m?.next == nil && n?.next == nil {
			return ListNode(m!.val + n!.val)
		}
		else if m?.next == nil {
			let next = mergeList(m: m, n: n?.next)
			let node = ListNode(m!.val + n!.val)
			node.next = next
			return node
		}
		else if n?.next == nil {
			let next = mergeList(m: m?.next, n: n)
			let node = ListNode(m!.val + n!.val)
			node.next = next
			return node
		}
		else {
			return mergeList(m: m?.next, n: n?.next)
		}
	}

}

// 剑指Offer
class CQueue {
	var stack = [Int]()
	var tmp = [Int]()
	init() {}
	
	func appendTail(_ value: Int) {
		stack.push(value)
	}
	
	func deleteHead() -> Int {
		if !tmp.isEmpty {
			let v = tmp.pop()
			return v ?? -1
		}
		while !stack.isEmpty {
			tmp.push(stack.pop()!)
		}
		let v = tmp.pop()
		return v ?? -1
	}
	
	
}

//MARK:- Stack
extension Array {
	mutating func pop() -> Element? {
		if isEmpty {
			return nil
		}
		return removeLast()
	}
	func peek() -> Element? {
		return last
	}
	mutating func push(_ element: Element) {
		append(element)
	}
}

class LFUCache {
	
	class LFUListNode {
		var key: Int
		var val: Int
		var frequent: Int = 0
		var left: LFUListNode?
		var right: LFUListNode?
		init(_ key: Int, val: Int) {
			self.key = key
			self.val = val
		}
	}
	
	var keyValueMap = [Int: Int]()
	var keyFreMap = [Int: Int]()
	var list = [Int]()
	var capacity: Int
	var frequentList: LFUListNode?
	var lruList: LFUListNode?
	
	init(_ capacity: Int) {
		self.capacity = capacity
	}
	
	func get(_ key: Int) -> Int {
		var node = frequentList
		while node != nil {
			if node!.key == key {
				node!.frequent+=1
				return node!.val
			}
		}
		return -1
	}
	
//	private resortFrequentList() {
//		var node = frequentList
//
//	}
//
//	func get(_ key: Int) -> Int {
//		let v = keyValueMap[key]
//		if v != nil {
//			let fre = keyFreMap[key]! + 1
//			keyFreMap[key] = fre
//			return v!
//		}
//		return -1
//	}
//
//	func put(_ key: Int, _ value: Int) {
//		if keyValueMap.contains(where: { (akey, _) -> Bool in
//			return akey == key
//		}) {
//			keyValueMap[key] = value
//			let fre = keyFreMap[value]! + 1
//			keyFreMap[value] = fre
//		} else {
//			if keyValueMap.count < capacity {
//				keyValueMap[key] = value
//				let fre = keyFreMap[value]! + 1
//				keyFreMap[value] = fre
//			}
//			else {
//				// 寻找频率最少的数组
//				var tmp = [Int]()
//				var minfrequent = Int.max
//				keyFreMap.forEach { (value, frequent) in
//					minfrequent = min(minfrequent, frequent)
//				}
//				keyFreMap.forEach { (value, frequent) in
//					if frequent == minfrequent {
//						tmp.append(value)
//					}
//				}
//				//数组中只有一个数字，直接移除这个
//				if tmp.count == 0 {
//					keyValueMap[]
//				}
//			}
//		}
//	}
}
