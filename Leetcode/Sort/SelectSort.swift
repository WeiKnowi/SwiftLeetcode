//
//  SelectSort.swift
//  Leetcode
//
//  Created by 未可知 on 2019/12/26.
//  Copyright © 2019 com.septnet.business. All rights reserved.
//

import Foundation

class SelectSort: Sort {
	
	override init() {
		super.init()
	}
	/// 这个排序比较简单
	/// 临界值注意一下i+1就行
	/// 和直接插入很像，区别是选择排序直接找到最小的值放在最前面,而直接插入是先排序前N个数字
	
	override func sort(_ a: inout Array<Int>) {
		for i in 0..<a.count {
			var min = i
			for j in (i+1)..<a.count {
				if a[j] < a[min] {
					min = j
				}
			}
			if min != i {
				a.swapAt(i, min)
			}
		}
	}
	
	
	
	
	
	
	
	func sort1(_ a: inout [Int]) {
		for i in 0..<a.count {
			var m = i
			for j in (i+1)..<a.count {
				if a[j] < a[i] {
					m = j
				}
			}
			if m != i {
				a.swapAt(m, i)
			}
		}
	}
	
	
	func sort2(_ a: inout [Int]) {
		for i in 0..<a.count {
			for j in (i+1)..<a.count {
				if a[i] > a[j] {
					a.swapAt(i, j)
				}
			}
		}
	}
	
	
}
