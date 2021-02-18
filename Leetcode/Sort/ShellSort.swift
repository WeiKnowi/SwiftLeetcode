//
//  ShellSort.swift
//  Leetcode
//
//  Created by 未可知 on 2019/1/28.
//  Copyright © 2019 com.septnet.business. All rights reserved.
//

import UIKit

class ShellSort: Sort {
	override init() {
		super.init()
	}
	/// 缩小增量排序
	/// 并不是规规矩矩的排序规定的那几个数组，而是直接排序gap后面的相邻gap之间的两个数字
	override func sort(_ a : inout Array<Int>) -> Void {
		var gap = a.count/2
		while gap >= 1 {
			for i in gap..<a.count {
				var j = i
				while j - gap >= 0 && a[j] < a[j-gap] {
					a.swapAt(j, j-gap)
					j-=gap
				}
			}
			gap/=2
		}
	}
	
	func shellSort1(_ a: inout Array<Int>) {
		var gap = a.count/2
		while gap >= 1 {
			for i in gap..<a.count {
				var j = i
				while j - gap >= 0 && a[j] < a[j-gap] {
					a.swapAt(j, j-gap)
					j-=gap
				}
			}
			gap/=2
		}
	}
	
	func shellSort2(_ a: inout Array<Int>) {
		var gap = a.count/2
		while gap >= 1 {
			for i in gap..<a.count {
				var j = i
				while j - gap >= 0 && a[j] < a[j - gap] {
					a.swapAt(j, j-gap)
					j-=gap
				}
			}
			gap/=2
		}
	}
	
	func shellSort3(_ a: inout Array<Int>) {
		var gap = a.count/2
		while gap >= 1 {
			for i in gap..<a.count {
				var j = i
				while j - gap >= 0 && a[j] < a[j - gap] {
					a.swapAt(j, j-gap)
					j-=gap
				}
			}
			gap/=2
		}
	}
	
	func shellSort4(_ a: inout [Int]) {
		var gap = a.count/2
		while gap >= 1 {
			for i in gap..<a.count {
				var j = i
				while j - gap >= 0 && a[j] < a[j-gap] {
					a.swapAt(j, j-gap)
					j-=gap
				}
			}
			gap/=2
		}
	}
}
