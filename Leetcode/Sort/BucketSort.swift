//
//  BucketSort.swift
//  Leetcode
//
//  Created by 未可知 on 2019/12/26.
//  Copyright © 2019 com.septnet.business. All rights reserved.
//

import Foundation

class BucketSort: Sort {
	override init() {
		super.init()
	}
	
	/*
	1. 找到最大值
	2. 填充桶
	3. 对桶中数据排序
	4. 把桶中数据扔到原来的数组中
	*/
	
	/// 很巧妙的一种排序算法 也是最快的一种排序算法，需要额外的空间
	override func sort(_ a: inout Array<Int>) {
		
		/// 寻找最大值
		var max = 0
		for i in a {
			max = max > i ? max : i
		}
		
		/// 创建桶
		var bucket = Array<Int>()
		for _ in 0...max {
			bucket.append(0)
		}
		
		/// 对数组中数字排序
		for i in 0..<a.count {
			bucket[a[i]]+=1
		}
		
		/// 整理数据
		var k = 0
		for i in 0..<bucket.count {
			if bucket[i] != 0 {
				for _ in 0..<bucket[i] {
					a[k] = i
					k+=1
				}
			}
		}
	}
	
	func sort1(_ a: inout [Int]) {
		if a.isEmpty {
			return
		}
		// 1. 最大值
		var max = a[0]
		for i in a {
			max = i > max ? i : max
		}
		
		// 2. 填充桶
		var bucket = [Int]()
		for _ in a {
			bucket.append(0)
		}
		
		// 3. 为桶中数据排序
		for i in 0..<a.count {
			bucket[a[i]]+=1
		}
		
		// 4. 重新填充数据
		var i = 0
		for j in 0..<bucket.count {
			if bucket[j] == 0 {
				continue
			}
			while bucket[j] != 0 {
				a[i] = j
				bucket[j]-=1
				i+=1
			}
		}
	}
	
	
	func sort2(_ a: inout [Int]) {
		
		// 寻找最大值
		var max = Int.min
		for i in a {
			max = i > max ? i : max
		}
		
		// 创建桶
		var bucket = [Int]()
		for _ in 0..<max {
			bucket.append(0)
		}
		
		//装桶
		for i in a {
			bucket[i]+=1
		}
		
		//排序
		var j = 0
		for i in 0..<bucket.count {
			if bucket[i] == 0 {
				continue
			}
			while bucket[i] != 0 {
				a[j] = i
				bucket[i]-=1
				j+=1
			}
		}
	}
	
	
}
