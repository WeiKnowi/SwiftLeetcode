//
//  AppDelegate.swift
//  Leetcode
//
//  Created by 未可知 on 2019/1/8.
//  Copyright © 2019 com.septnet.business. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		let vc = ViewController()
		window = UIWindow.init(frame: UIScreen.main.bounds)
		window?.rootViewController = vc
		window?.makeKeyAndVisible()
		
		runByteDance()
		
//		var url = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).last!
//		url = url + "123.png"
//			DispatchQueue.global().async {
//				do {
//					let imagedata = UIImage(named: "album")?.pngData()
//					try imagedata?.write(to: URL(fileURLWithPath: url))
//					print("success")
//				} catch {
//					print(error)
//				}
//			}
		
		
		//		_ = QuickSort.init()
		//		_ = ShellSort.init();
		let leet = Leetcode()
		//		leet.isValid("()")
//		NSBundleResourceRequest
		// 21
		//		let node1 = ListNode(1)
		//		var node2 = ListNode(3)
		//		let node3 = ListNode(5)
		//		let node4 = ListNode(2)
		//		let node5 = ListNode(4)
		//		let node6 = ListNode(6)
		//		node1.next = node2
		//		node2.next = node3
		//		node4.next = node5
		//		node5.next = node6
		//		print("\(node1.val) -- \(node1.next?.val)")
		//		let new = leet.mergeTwoLists(node1, node4)
		//		print("\(new?.val) - \(new!.next!.val) - \(new!.next!.next!.val)")
		
		//14
		//		let string = leet.longestCommonPrefix(["asdcvwd","","asd"])
		//		print("string = \(string)")
		//26
		//		var ar = [1,1,2,3,4,5,5,5,5,5,5,6]
		//		let count = leet.removeDuplicates(&ar)
		//		print("count = \(count)")
		
		//		var ar = [3,2,2,3]
		//		leet.removeElement(&ar, 3)
		
		//53
		
		//		leet.maxSubArray([-2,1,-3,4,-1,2,1,-5,4])
		// 58
		//		let arr = [" ","", " h", "h ", " h ","h j"," h j"," h j "]
		//		for i in 0..<arr.count {
		//			let re = leet.lengthOfLastWord(arr[i]);
		//			print("re = \(re)")
		//		}
		
		//		let sord = SwordOffer()
		//		let arr = [3,4,5,1,2]
		//		let re = sord.mins(nums:arr)
		//		print("re = \(re)")
		//		leet.addBinary("11", "1")
		
		//		let node1 = ListNode(1)
		//		let node2 = ListNode(1)
		//		let node3 = ListNode(2)
		//		let node4 = ListNode(3)
		//		let node5 = ListNode(3)
		//		node1.next = node2
		//		node2.next = node3
		//		node3.next = node4
		//		node4.next = node5
		//		var n = leet.deleteDuplicates(node1)
		//		while n?.next != nil {
		//			print(n?.val)
		//			n = n?.next
		//		}
		
		//		var a = [1,2,3,0,0,0]
		//		var b = [2,5,6]
		//
		//		leet.merge(&a, 3, b, 3)
		
		//		let stack = MinStack()
		//		stack.push(2)
		//		stack.push(0)
		//		stack.push(3)
		//		stack.push(0)
		//		stack.pop()
		//		stack.pop()
		//		stack.pop()
		//		print(stack.getMin());
		
		//		print(leet.singleNumber([2,2,1]))
		//		print(leet.singleNumber([4,1,2,1,2]))
		
		//		print(leet.twoSums([2, 7, 11, 15], 9))
		
		//		print(leet.majorityElement([3,2,3]))
		
		let l1 = ListNode(1)
		let l2 = ListNode(2)
		let l3 = ListNode(3)
		let l4 = ListNode(4)
		let l5 = ListNode(5)
		l1.next = l2
		l2.next = l3
		l3.next = l4
		l4.next = l5
		
		//		print(leet.reverseList(l1))
		//		var ar = [4,2,4,0,0,3,0,5,1,0]
		//		leet.moveZeroes(&ar)
		
		//		leet.threeSum([-1, 0, 1, 2, -1, -4])
		//		leet.threeSumClosest([1,2,4,8,16,32,64,128], 82)
		//		print(leet.convert("A", 1))
		//		let ch: Character = "A"
		//		var a = UnicodeScalar(65)
		//		print(ch.asciiValue)
		//		print(leet.fourSum([1,-2,-5,-4,-3,3,3,5], -11))
		//		print(leet.removeNthFromEnd(l1, 2))
		//		print(leet.generateParenthesis(3))
		
		//		let selectSort = SelectSort()
		
		//		MergeSort()
		
		//		BucketSort()
		
		//		BaseSort()
		//		ShellSort()
		
		//		let heap = Heap()
		//		heap.insertVal(1)
		//		heap.insertVal(4)
		//		heap.insertVal(2)
		//		heap.insertVal(0)
		//		heap.insertVal(7)
		//		heap.insertVal(3)
		//		heap.insertVal(6)
		//		heap.insertVal(5)
		//		heap.insertVal(8)
		//		heap.insertVal(9)
		//		heap.removeVal(2)
		
		//		HeapSort()
		//		let re = leet.searchRange([5,7,7,8,8,10], 8)
		//		print(re)
		//		let sudo: Array<[Character]> = [
		//		  ["5","3",".",".","7",".",".",".","."],
		//		  ["6",".",".","1","9","5",".",".","."],
		//		  [".","9","8",".",".",".",".","6","."],
		//		  ["8",".",".",".","6",".",".",".","3"],
		//		  ["4",".",".","8",".","3",".",".","1"],
		//		  ["7",".",".",".","2",".",".",".","6"],
		//		  [".","6",".",".",".",".","2","8","."],
		//		  [".",".",".","4","1","9",".",".","5"],
		//		  [".",".",".",".","8",".",".","7","9"]
		//		]
		//		print(leet.isValidSudoku1(sudo))
		
		//		print(leet.combinationSum([2,3,5], 8))
		//		print(leet.multiply("9133", "0"))
		//		print(leet.permute([1,2,3]))
		
		var a = [
			[126,96,126,0,42,128,3,0,111,-1,66,37],
			[123,57,130,22,-1,12,53,40,106,57,51,20],
			[112,104,80,12,137,116,88,136,85,71,137,129],
			[56,13,2,41,13,70,79,137,0,83,32,16],
			[96,103,74,75,17,142,112,2,104,49,15,98],
			[22,105,91,109,49,102,111,123,116,114,21,131],
			[57,117,141,59,57,31,92,26,135,23,102,25],
			[39,72,44,0,122,61,115,18,39,79,128,89],
			[38,112,69,12,83,91,16,14,82,14,90,140],
			[62,39,40,70,80,-1,112,120,88,14,137,84],
			[76,109,103,116,45,104,78,101,73,21,130,29],
			[129,3,44,68,18,135,66,98,32,107,25,129]
		]
		var b = [
			[129,76,62,38,39,57,22,96,56,112,123,126],
			[3,57,39,112,72,117,105,103,13,104,51,96],
			[44,103,40,69,44,141,91,74,2,80,130,126],
			[68,116,70,12,0,59,109,75,41,12,22,0],
			[18,45,80,83,122,57,49,17,13,137,-1,42],
			[135,104,-1,91,61,31,102,142,70,116,12,128],
			[66,78,112,16,115,92,111,112,79,88,53,3],
			[98,101,120,14,18,26,123,2,137,136,40,0],
			[32,73,88,82,39,135,116,104,0,85,106,111],
			[107,21,14,14,79,23,114,49,83,71,57,-1],
			[25,109,137,90,128,102,21,15,32,137,130,66],
			[129,29,84,140,89,25,131,98,16,129,20,37]]
		//		print(leet.rotate1(&a))
		
		//		print(leet.longestPalindrome("cbbd"))
		//		print(leet.intToRoman(3))
		//		print(leet.intToRoman(4))
		//		print(leet.intToRoman(5))
		//		print(leet.intToRoman(6))
		//		print(leet.intToRoman(9))
		//		print(leet.intToRoman(10))
		//		print(leet.intToRoman(11))
		//		print(leet.intToRoman(58))
		//		print(leet.letterCombinations("23"))
		
		let n1 = ListNode.init(1)
		let n2 = ListNode.init(2)
		let n3 = ListNode.init(3)
		
		let n4 = ListNode.init(4)
		let n5 = ListNode.init(5)
		let n6 = ListNode.init(4)
		
		let n7 = ListNode.init(2)
		let n8 = ListNode.init(6)
		n1.next = n2
		n2.next = n3
		n3.next = n4
		//		n4.next = n5;
		//		n5.next = n6
		
		n7.next = n8
		
		var lists = [ListNode?]()
		lists.append(contentsOf: [n1,n4,n7])
		//		print(leet.mergeKLists(lists))
		//		var n = leet.mergeKLists(lists)
		//		while n != nil {
		//			print(n?.val)
		//			n = n?.next
		//		}
		
		//		MergeSort()
		//		let n = leet.reverseKGroupRes(n1, count: 1, k: 3)
		//		print(leet.reverseKGroupRes(n1, count: 1, k: 3))
		//		let m = leet.reverseKGroup(n1, 2)
		//		print(leet.search([4,5,6,7,8,9,1,2,3], 1))
		//		print(leet.myPow(0.00001, 10))
		//		print(leet.canJump([3,2,1,0,4]))
		//		print(leet.lengthOfLastWord("a "))
		//		print(leet.uniquePaths(3, 2))
		var matrix = [
			[1,   3,  5,  7],
			[10, 11, 16, 20],
			[23, 30, 34, 50]
		]
		//		print(leet.searchMatrix(matrix, 3))
		var word: [[Character]] = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]]
		//		print(leet.exist(word, "SEE"))
		//		print(leet.grayCode(2))
		//		print(leet.numTrees(19))
		
		//		t1.left = t2
		//		t1.right = t3
		//		t2.left = t4
		//		t2.right = t5
		//		t3.left = t6
		//		t3.right = t7
		//		print(leet.isSymmetric(t1))
		//		print(leet.buildTree([3,9,20,15,7], [9,3,15,20,7]))
		//		t1.left = t2
		//		t1.right = nil
		//		print(leet.hasPathSum(t1, 1))
//		let m = [
//			[2],
//			[3,4],
//			[6,5,7],
//			[4,1,8,3]
//		]
		//		print(leet.minimumTotal(m))
		//		print(leet.ladderLength("hit", "cog", ["hot","dot","dog","lot","log","cog"]))
		//		let n = [
		//		["X", "X", "X", "X"],
		//		["X", "O", "O", "X"],
		//		["X", "X", "O", "X"],
		//		["X", "O", "X", "X"]
		//		]
//		let n = [["O","O","O"],["O","O","O"],["O","O","O"]]
//		var ns = [[Character]]()
//		for i in n {
//			var tmp = [Character]()
//			for j in i {
//				tmp.append(Character(j))
//			}
//			ns.append(tmp)
//		}
		//		print(leet.solve(&ns))
		//		print(leet.singleNumber137([-2,-2,1,1,-3,1,-3,-3,-2,-2147483648]))
		//		print(leet.wordBreak("leetcode", ["leet", "code"]))
		//		print(leet.reorderList(n1))
		
		//		var cache = LRUCache(2)
		//		cache.put(2, 1)
		//		cache.put(2, 2)
		//		var c = cache.get(2)       // 返回  1
		//		cache.put(1, 1)    // 该操作会使得密钥 2 作废
		//		c = cache.get(2)       // 返回 -1 (未找到)
		//		cache.put(4, 1)    // 该操作会使得密钥 1 作废
		//		c = cache.get(2)       // 返回 -1 (未找到)
		//		c = cache.get(3)       // 返回  3
		//		c = cache.get(4)       // 返回  4
		/**
		["LRUCache","put","put","get","put","put","get"]
		[[2],[2,1],[2,2],[2],[1,1],[4,1],[2]]
		*/
//		let t1 = ListNode.init(-1)
//		let t2 = ListNode.init(5)
//		let t3 = ListNode.init(3)
//		let t4 = ListNode.init(4)
//		let t5 = ListNode.init(0)
//		let t6 = ListNode.init(1)
//		let t7 = ListNode.init(8)
//		let t8 = ListNode.init(5)
//		let t9 = ListNode.init(11)
//		let t10 = ListNode.init(15)
//		t9.next = t10
//		t8.next = t9
//		t7.next = t8
//		t6.next = t7
//		//		t5.next = t6
//		t4.next = t5
//		t3.next = t4
//		t2.next = t3
//		t1.next = t2
		//		[-1,5,3,4,0]
		//		print(leet.sortList(t1))
//		var a1 = [[40,-23],[9,138],[429,115],[50,-17],[-3,80],[-10,33],[5,-21],[-3,80],[-6,-65],[-18,26],[-6,-65],[5,72],[0,77],[-9,86],[10,-2],[-8,85],[21,130],[18,-6],[-18,26],[-1,-15],[10,-2],[8,69],[-4,63],[0,3],[-4,40],[-7,84],[-8,7],[30,154],[16,-5],[6,90],[18,-6],[5,77],[-4,77],[7,-13],[-1,-45],[16,-5],[-9,86],[-16,11],[-7,84],[1,76],[3,77],[10,67],[1,-37],[-10,-81],[4,-11],[-20,13],[-10,77],[6,-17],[-27,2],[-10,-81],[10,-1],[-9,1],[-8,43],[2,2],[2,-21],[3,82],[8,-1],[10,-1],[-9,1],[-12,42],[16,-5],[-5,-61],[20,-7],[9,-35],[10,6],[12,106],[5,-21],[-5,82],[6,71],[-15,34],[-10,87],[-14,-12],[12,106],[-5,82],[-46,-45],[-4,63],[16,-5],[4,1],[-3,-53],[0,-17],[9,98],[-18,26],[-9,86],[2,77],[-2,-49],[1,76],[-3,-38],[-8,7],[-17,-37],[5,72],[10,-37],[-4,-57],[-3,-53],[3,74],[-3,-11],[-8,7],[1,88],[-12,42],[1,-37],[2,77],[-6,77],[5,72],[-4,-57],[-18,-33],[-12,42],[-9,86],[2,77],[-8,77],[-3,77],[9,-42],[16,41],[-29,-37],[0,-41],[-21,18],[-27,-34],[0,77],[3,74],[-7,-69],[-21,18],[27,146],[-20,13],[21,130],[-6,-65],[14,-4],[0,3],[9,-5],[6,-29],[-2,73],[-1,-15],[1,76],[-4,77],[6,-29]]
		//		print(leet.isSameArray(a:a1))
		//		print(leet.insertionSortList(t1))
		
//		var leet2 = Leetcode2()
//		var ll1 = ListNode(2)
//		var ll2 = ListNode(4)
//		var ll3 = ListNode(3)
//		ll1.next = ll2
//		ll2.next = ll3
//		var ll4 = ListNode(5)
//		var ll5 = ListNode(6)
//		var ll6 = ListNode(4)
//		ll4.next = ll5
//		ll5.next = ll6
		//		print(leet2.addTwoNumbers(ll1, ll4))
		//		print(leet2.lengthOfLongestSubstring("abcabcbb"))
		//		print(leet.strStr("hello", "ll"))
		//		print(leet.countAndSay(4))
		//		print(leet.trap([4,4,4,7,1,0]))
		//		print(leet.jump([1,2,3]))
		//		print(leet.permuteUnique([1,1,2]))
		//		print(leet.totalNQueens(4))
		//		print(leet.insert([[1,3],[6,9]],[2,5]))
		//		print(leet.isNumber("-1."))
		//		["Here","is","an","example","of","text","justification."]
		//		14
		//		print(leet.fullJustify(["Here","is","an","example","of","text","justification."], 14))
		//		print(leet.minDistance("horse", "ros"))
		//		"ADOBECODEBANC"
		//		"ABC"
		//		print(leet.minWindow("ADOBECODEBANC", "ABC"))
		// [4,2,0,3,2,4,3,4]
		//		print(leet.largestRectangleArea([4,4,4,4,4,4]))
		//		print(leet.isScramble("great", "rgeat"))
//		let str1 = ["bbbbbabbbbabaababaaaabbababbaaabbabbaaabaaaaababbbababbbbbabbbbababbabaabababbbaabababababbbaaababaa",
//					"babaaaabbababbbabbbbaabaabbaabbbbaabaaabaababaaaabaaabbaaabaaaabaabaabbbbbbbbbbbabaaabbababbabbabaab",
//					"babbbabbbaaabbababbbbababaabbabaabaaabbbbabbbaaabbbaaaaabbbbaabbaaabababbaaaaaabababbababaababbababbbababbbbaaaabaabbabbaaaaabbabbaaaabbbaabaaabaababaababbaaabbbbbabbbbaabbabaabbbbabaaabbababbabbabbab"]
		//		print(leet.isInterleave(str1[0], str1[1], str1[2]))
		//		print(leet.numDistinct("rabbbit", "rabbit"))
//		leetcode2()
		runByteDance()
		return true
	}
	
	func applicationWillResignActive(_ application: UIApplication) {
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
		// Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
	}
	
	func applicationDidEnterBackground(_ application: UIApplication) {
		// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
		// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	}
	
	func applicationWillEnterForeground(_ application: UIApplication) {
		// Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
	}
	
	func applicationDidBecomeActive(_ application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	}
	
	func applicationWillTerminate(_ application: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
	}
	
	private func leetcode2() {
		let leet = Leetcode2()
		//		leet.longestPalindrome("babad")
		//		leet.isValid("()[]{}")
		//		leet.generateParenthesis(3)
		//		leet.divide(20, 1)
//		var a = [1,2,3]
		//		leet.nextPermutation(&a)
		//		leet.searchRange([5,7,7,8,8,10], 8)
//		let b = [
//			[1,2,3],
//			[1,2,3],
//			[1,2,3]
//		]
		//		print(b[0][1])
		//		print(leet.permuteUnique([1,1,1,2]))
		//		print(leet.groupAnagrams(["eat","tea","tan","ate","nat","bat"]))
		//		print(leet.groupAnagrams(["",""]))
		//		print(leet.myPow(8.84372, -5))
		//		let c = [
		//		  [0,0,0],
		//		  [0,1,0],
		//		  [0,0,0]
		//		]
		//		print(leet.uniquePathsWithObstacles(c))
//		let c = [
//			[1,3,1],
//			[1,5,1],
//			[4,2,1]
//		]
//		print(leet.minPathSum(c))
		
//		var c = [2,0,2,1,1,0]
//		print(leet.sortColors(&c))
		
//		print(leet.subsets([1,2,3]))
//		print(leet.restoreIpAddresses("0000"))
//		print(leet.buildTree([3,9,20,15,7], [9,3,15,20,7]))
//		print(leet.findLadders("hit", "cog", ["hot","dot","dog","lot","log","cog"]))
//		print(leet.longestConSecutive(nums: [100,4,200,1,3,2,5]))
//		let root = TreeNode(4)
//		let node1 = TreeNode(9)
//		let node2 = TreeNode(0)
//		let node3 = TreeNode(5)
//		let node4 = TreeNode(1)
//		root.left = node1
//		root.right = node2
//		node1.left = node3
//		node1.right = node4
//		print(leet.sumNumbers(root))
		
//		var n: [[Character]] = [
//		["X", "X", "X", "X"],
//		["X", "O", "O", "X"],
//		["X", "X", "O", "X"],
//		["X", "O", "X", "X"]
//		]
//		var n: [[Character]] = [["O","O","O"],["O","O","O"],["O","O","O"]]
//		var n: [[Character]] = [["X","O","O","X","X","X","O","X","X","O","O","O","O","O","O","O","O","O","O","O"],["X","O","O","X","X","O","O","X","O","O","O","X","O","X","O","X","O","O","X","O"],["O","O","O","X","X","X","X","O","X","O","X","X","O","O","O","O","X","O","X","O"],["O","O","O","X","X","O","O","X","O","O","O","X","X","X","O","O","X","O","O","X"],["O","O","O","O","O","O","O","X","X","X","O","O","O","O","O","O","O","O","O","O"],["X","O","O","O","O","X","O","X","O","X","X","O","O","O","O","O","O","X","O","X"],["O","O","O","X","O","O","O","X","O","X","O","X","O","X","O","X","O","X","O","X"],["O","O","O","X","O","X","O","O","X","X","O","X","O","X","X","O","X","X","X","O"],["O","O","O","O","X","O","O","X","X","O","O","O","O","X","O","O","O","X","O","X"],["O","O","X","O","O","X","O","O","O","O","O","X","O","O","X","O","O","O","X","O"],["X","O","O","X","O","O","O","O","O","O","O","X","O","O","X","O","X","O","X","O"],["O","X","O","O","O","X","O","X","O","X","X","O","X","X","X","O","X","X","O","O"],["X","X","O","X","O","O","O","O","X","O","O","O","O","O","O","X","O","O","O","X"],["O","X","O","O","X","X","X","O","O","O","X","X","X","X","X","O","X","O","O","O"],["O","O","X","X","X","O","O","O","X","X","O","O","O","X","O","X","O","O","O","O"],["X","O","O","X","O","X","O","O","O","O","X","O","O","O","X","O","X","O","X","X"],["X","O","X","O","O","O","O","O","O","X","O","O","O","X","O","X","O","O","O","O"],["O","X","X","O","O","O","X","X","X","O","X","O","X","O","X","X","X","X","O","O"],["O","X","O","O","O","O","X","X","O","O","X","O","X","O","O","X","O","O","X","X"],["O","O","O","O","O","O","X","X","X","X","O","X","O","O","O","X","X","O","O","O"]]
//		leet.solve(&n)
//		print(n)
//		let a = [4,5,2,6,5,3]
//		let b = [3,2,7,3,2,9]
//		leet.canCompleteCircuit(a, b)
//		leet.singleNumber([30000,500,100,30000,100,30000,100])
		
//		var p1 = ListNode(1)
//		var p2 = ListNode(2)
//		var p3 = ListNode(3)
//		var p4 = ListNode(4)
//		var p5 = ListNode(5)
//		p1.next = p2
//		p2.next = p3
//		p3.next = p4
//		p4.next = p5
//		leet.reorderList(p1)
		var p1 = TreeNode(1)
		var p2 = TreeNode(2)
		var p3 = TreeNode(3)
		p1.right = p2
		p2.left = p3
//		print(leet.postorderTraversal(p1))
		
	}
	
	func runByteDance() {
		var byteDance = ByteDance()
//		print(byteDance.findKthLargest([2,1], 2))
//		let s = byteDance.lengthOfLongestSubstring("abba")
//		print(s)
//		byteDance.threeSum([-1, 0, 1, 2, -1, -4])
//		let p1 = ListNode(1)
//		let p2 = ListNode(2)
//		let p3 = ListNode(4)
//		let p4 = ListNode(1)
//		let p5 = ListNode(3)
//		let p6 = ListNode(4)
//		p1.next = p2;p2.next = p3;
//		p4.next = p5;p5.next = p6;
//		print(byteDance.mergeTwoLists(p1, p4))
//		let p = byteDance.mergeTwoLists(p1, p4)
//		byteDance.twoSum([2,7,11,15], 9)
		
//		var queue = [TreeNode?]()
//		queue.append(nil)
//		let n: TreeNode? = nil
//		queue.append(n)
//		queue.append(n?.left)
	
//		var grid: [[Character]] = [["1","1","0","0","0"],["1","1","0","0","0"],["0","0","1","0","0"],["0","0","0","1","1"]]
//		byteDance.numIslands(grid)
//		print(byteDance.reverseWords("a good   example"))
		print(byteDance.findAnagrams("cbaebabacd", "abc"))
	}

}

