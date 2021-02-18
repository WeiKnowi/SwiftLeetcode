//
//  BaseSort.swift
//  Leetcode
//
//  Created by 未可知 on 2019/12/26.
//  Copyright © 2019 com.septnet.business. All rights reserved.
//

import Foundation

class BaseSort: Sort {
	override init() {
		super.init()
	}
	
	/*
	1. 最大值
	2. 创建桶
	3. 装桶
	4. 出桶
	*/
	/// 二维数组
	/// 数组根据基数（个、十、百、千、万）进行循环的桶操作
	override func sort(_ a: inout Array<Int>) {
		/// 创建桶
		var bucket = creatBucket()
		/// 获取最大值
		let maxV = getMax(fromList: a)
		/// 获取最大值的长度
		let maxL = numberLength(num: maxV)
		for i in 1...maxL {
			for num in a {
				let baseNum = fetchBaseNumber(num: num, digit: i)
				/// 装桶
				bucket[baseNum].append(num)
			}
			var index = 0
			for i in 0..<bucket.count {
				while !bucket[i].isEmpty {
					/// 出桶
					let num = bucket[i].remove(at: 0)
					a[index] = num
					index+=1
				}
			}
		}
	}
	
	func sort1(_ a: inout Array<Int>) {
		var bucket = creatBucket()
		let maxNum = getMax(fromList: a)
		let maxL = numberLength(num: maxNum)
		
		for digit in 1...maxL {
			for item in a {
				let baseNum = fetchBase(num: item, exp: digit)
				/// 装桶
				bucket[baseNum].append(item)
			}
			print("第\(digit)轮入桶结果")
			print("\(bucket)")
			var index = 0
			for i in 0..<bucket.count {
				while !bucket[i].isEmpty {
					/// 出桶、向原数组中添加数据
					a[index] = bucket[i].remove(at: 0)
					index+=1
				}
			}
			print("第\(digit)轮入桶结果")
			print("\(a)")
		}
	}
	
	func sort2(_ a: inout [Int]) {
		var bucket = creatBucket()
		let maxNum = getMax(fromList: a)
		let L = numberLength(num: maxNum)
		for i in 1...L {
			for num in a {
				let baseNum = fetchBase(num: num, exp: i)
				bucket[baseNum].append(num)
			}
			var index = 0
			for i in 0..<bucket.count {
				while !bucket[i].isEmpty {
					a[index] = bucket[i].remove(at: 0)
					index+=1
				}
			}
		}
	}
	
	func fetchBase(num: Int, exp: Int) -> Int {
		var val = num
		var remind = 0
		for _ in 0..<exp {
			remind = val%10
			val = val/10
		}
		return remind
	}
	
	func creatBucket() -> Array<Array<Int>>{
		var list = Array<Array<Int>>()
		for _ in 0..<10 {
			list.append(Array<Int>())
		}
		return list
	}
	
	func getMax(fromList: Array<Int>) -> Int {
		if fromList.isEmpty {
			return 0
		}
		var max = fromList[0]
		for e in fromList {
			max = max > e ? max : e
		}
		return max
	}
	
	func numberLength(num: Int) -> Int {
		if num < 10 {
			return 1
		}
		return numberLength(num: num/10) + 1
	}
	
	func fetchBaseNumber(num: Int, digit: Int) -> Int {
		if digit > 0 && digit <= numberLength(num: num) {
			var numList = Array<Int>()
			for char in "\(num)".characters {
				numList.append(Int("\(char)")!)
			}
			return numList[numList.count - digit]
		}
		return 0
	}
	
	
	func getMaxL(a: [Int]) -> Int {
		var max = Int.min
		for i in a {
			max = i > max ? i : max
		}
		var L = 0
		while max != 0 {
			max/=10
			L+=1
		}
		return L
	}
	
	func getBaseNum(index: Int, num: Int) -> Int {
		var digit = num
		for _ in 1..<index {
			digit/=10
		}
		return digit%10
	}
	
	func creatBucket1() -> [[Int]] {
		var bucket = [[Int]]()
		for i in 0..<10 {
			bucket.append([Int]())
		}
		return bucket
	}
	
	
	func sort3(_ a: inout [Int]) {
		
		// 1. 最大值
		let L = getMaxL(a: a)
		
		// 2. 创建桶
		var bucket = creatBucket1()
		
		for i in 1...L {
			for item in a {
				let baseNum = getBaseNum(index: i, num: item)
				bucket[baseNum].append(item)
			}
			var index = 0
			for j in 0..<bucket.count {
				while bucket[j].count != 0 {
					let item = bucket[j].removeLast()
					a[index] = item
					index+=1
				}
			}
		}
		
	}
	
}
