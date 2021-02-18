//
//  StraightInsertSort.swift
//  Leetcode
//
//  Created by 未可知 on 2019/1/23.
//  Copyright © 2019 com.septnet.business. All rights reserved.
//

import UIKit

class StraightInsertSort: Sort {
	override init() {
		super.init()
		var a = [3,2,5,7,4,1,6]
		print("before sort \(a)")
		sort(&a)
		print("after sort \(a)")
	}
	
	/// 1. j+1永远不会数组越界，因为i是从1开始，且j的最大值为i-1
	/// 2. 从排序好的数组的后面开始比较，而不是前面
	/// 3. 时间复杂度 n²
	/// 4. 第一个for循环是从1开始，第二个for循环是从i-1开始，交换的是j和j+1
	/// https://juejin.im/post/5b4ef681f265da0f4b7a8d44
	override func sort(_ a: inout Array<Int>) {
		for i in 1..<a.count {
			for j in (0..<(i-1)).reversed() {
				if a[j+1] > a[j] {
					a.swapAt(j, j+1)
				}
			}
		}
	}
	
	func sort1(_ a: inout [Int]) {
		for i in 1..<a.count {
			for j in (0..<(i-1)).reversed() {
				if a[j+1] < a[j] {
					a.swapAt(j, j+1)
				}
			}
		}
	}
	
	
	
	
	func sort2(_ a: inout [Int]) {
		for i in 1..<a.count {
			for j in (0..<(i-1)).reversed() {
				if a[j] > a[j+1] {
					a.swapAt(j, j+1)
				}
			}
		}
	}
}
