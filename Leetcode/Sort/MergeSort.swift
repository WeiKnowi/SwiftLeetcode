//
//  MergeSort.swift
//  Leetcode
//
//  Created by 未可知 on 2019/12/26.
//  Copyright © 2019 com.septnet.business. All rights reserved.
//

import Foundation

class MergeSort: Sort {
	override init() {
		super.init()
	}
	
	override func sort(_ a: inout Array<Int>) {
		mergeSort(&a, L: 0, R: a.count - 1)
	}
	
	/// 1. 递归+merge方法
	/// 2. 注意merge方法里的左右数组分隔的临界点 Note: R - M + 1
	/// 3. 创建了额外空间
	/// https://juejin.im/post/5ab4c7566fb9a028cb2d9126
	func mergeSort(_ a: inout Array<Int>, L:Int, R: Int) {
		if L == R {
			return
		}
		else {
			let m = (L + R)/2
			mergeSort(&a, L: L, R: m)
			mergeSort(&a, L: m + 1, R: R)
			merge(&a, L: L, R: R, M: m + 1)
		}
	}
	
	func merge(_ a: inout Array<Int>, L: Int, R: Int, M: Int) {
		var leftArr = Array<Int>()
		var rightArr = Array<Int>()
		for i in 0..<(M - L){
			leftArr.append(a[L+i])
		}
		for i in 0..<(R - M + 1) {
			rightArr.append(a[M+i])
		}
		
		var i = 0
		var j = 0
		var k = L
		while i < leftArr.count && j < rightArr.count {
			if leftArr[i] < rightArr[j] {
				a[k] = leftArr[i]
				i+=1
				k+=1
			}
			else {
				a[k] = rightArr[j]
				j+=1
				k+=1
			}
		}
		
		while i < leftArr.count {
			a[k] = leftArr[i]
			i+=1
			k+=1
		}
		
		while j < rightArr.count {
			a[k] = rightArr[j]
			j+=1
			k+=1
		}
	}
	
	
	
	func mergeSort1(_ a: inout [Int], L: Int, R: Int) {
		if L == R {
			return
		}
		let M = (L + R)/2
		mergeSort1(&a, L: L, R: M)
		mergeSort1(&a, L: M+1, R: R)
		merge1(&a, L: L, R: R, M: M+1)
	}
	
	func merge1(_ a: inout [Int], L: Int, R: Int, M: Int) {
		var leftArr = [Int]()
		var rightArr = [Int]()
		for i in 0..<(R - L) {
			leftArr[i] = a[L+i]
		}
		for i in 0..<(R - M + 1) {
			rightArr[i] = a[M+i]
		}
		var i = 0
		var j = 0
		var k = L
		while i < leftArr.count && j < rightArr.count {
			if leftArr[i] < rightArr[j] {
				a[k] = leftArr[i]
				i+=1
				k+=1
			}
			else {
				a[k] = rightArr[j]
				j+=1
				k+=1
			}
		}
		while i < leftArr.count {
			a[k] = leftArr[i]
			i+=1
			k+=1
		}
		while j < rightArr.count {
			a[k] = rightArr[j]
			j+=1
			k+=1
		}
	}
	
	
	
	
	
	func mergeSort2(_ a: inout [Int], L: Int, R: Int) {
		if L == R {
			return
		}
		let M = (L + R)/2
		mergeSort2(&a, L: L, R: M)
		mergeSort2(&a, L: M+1, R: R)
		merge2(&a, L: L, R: R, M: M+1)
	}
	
	func merge2(_ a: inout [Int], L: Int, R: Int, M: Int) {
		var leftarr = [Int]()
		var rightarr = [Int]()
		for i in 0..<(M - L) {
			leftarr.append(a[L+i])
		}
		for j in 0..<(R - M + 1) {
			rightarr.append(a[M+j])
		}
		var i = 0
		var j = 0
		var k = L
		while i < leftarr.count && j < rightarr.count {
			if leftarr[i] < rightarr[j] {
				a[k] = leftarr[i]
				i+=1
				k+=1
			}
			else {
				a[k] = rightarr[j]
				j+=1
				k+=1
			}
		}
		while i < leftarr.count {
			a[k] = leftarr[i]
			i+=1
			k+=1
		}
		while j < rightarr.count {
			a[k] = rightarr[j]
			j+=1
			k+=1
		}
	}
}
