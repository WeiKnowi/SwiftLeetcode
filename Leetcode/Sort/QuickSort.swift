//
//  QuickSort.swift
//  Leetcode
//
//  Created by 未可知 on 2019/1/17.
//  Copyright © 2019 com.septnet.business. All rights reserved.
//

import UIKit

protocol sortAdaptor {
	
}

class QuickSort: NSObject {
	
	override init() {
		super.init()
		var a = [7,3,4,6,1,2,5]
		print("sort before \(a) \n");
		sort(&a, l: 0, r: 5)
		print("sort after \(a)")
	}
	
	// 从右往左找到小于x的值，找到之后交换x与当前值的位置，把当前值赋给x
	// 从左往右找到大于x的值，找到之后交换x与当前值的位置，把当前值赋给x
	// 是赋值 不是交换
	func sort(_ a : inout Array<Int>, l:Int, r:Int) -> Void {
		if l < r {
			var i = l
			var j = r
			let x = a[i]
			while i < j {
				while i < j && a[j] > x {
					j-=1
				}
				if i < j {
					a[i] = a[j]
				}
				while i < j && a[i] < x {
					i+=1
				}
				if i < j {
					a[j] = a[i]
				}
			}
			// 此时i=j
			a[i] = x;
			sort(&a, l: l, r: i-1)
			sort(&a, l: i+1, r: r)
		}
	}
	
	func sort1(_ a: inout [Int], L: Int, R: Int) {
		if L < R {
			var i = L
			var j = R
			let x = a[i]
			while i < j {
				// 先从右往左找小于
				while i < j && a[j] > x {
					j-=1
				}
				if i < j {
					a[j] = a[i]
				}
				while i < j && a[i] < x {
					i+=1
				}
				if i < j {
					a[i] = a[j]
				}
			}
			a[i] = x
			sort1(&a, L: L, R: i-1)
			sort1(&a, L: i+1, R: R)
		}
	}
	
	
	
	
	
	
	
	func sort2(_ a: inout [Int], L: Int, R: Int) {
		var i = L
		var j = R
		let temp = a[i]
		while i < j {
			while a[j] > temp && i < j {
				j-=1
			}
			if i < j {
				a[i] = a[j]
			}
			
			while a[i] < temp && i < j  {
				i+=1
			}
			if i < j {
				a[j] = a[i]
			}
		}
		a[i] = temp
		sort2(&a, L: L, R: i-1)
		sort2(&a, L: i+1, R: R)
	}
}
