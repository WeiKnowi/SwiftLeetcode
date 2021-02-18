//
//  HeapSort.swift
//  Leetcode
//
//  Created by 未可知 on 2019/12/30.
//  Copyright © 2019 com.septnet.business. All rights reserved.
//

import Foundation

class HeapSort: Sort {
	override init() {
		super.init()
	}
	
	override func sort(_ a: inout Array<Int>) {
		buildMaxHeap(arr: &a)
		heapSort(&a)
	}
	
	private func heapSort(_ arr: inout [Int]) {
		for i in (1...(arr.count - 1)).reversed() {
			// 最开始的时候它就是一个最大堆，所以可以先交换
			arr.swapAt(0, i)
			maxHeapify(arr: &arr, index: 0, size: i)
		}
	}
	
	private func buildMaxHeap(arr: inout [Int]) {
		for i in (0...(arr.count/2 - 1)).reversed() {
			maxHeapify(arr: &arr, index: i, size: arr.count)
//			print(arr)
		}
	}
	
	private func maxHeapify(arr: inout [Int], index: Int, size: Int) {
		let temp = arr[index]
		var cur = index
		var left = 2*cur+1
		while left < size {
			if left + 1 < size && arr[left] < arr[left+1] {
				left+=1
			}
			if temp > arr[left] {
				break
			}
			else {
				arr[cur] = arr[left]
				cur = left
				left = left*2+1
			}
		}
		arr[cur] = temp
	}
	
	
	private func heapSort1(_ a: inout [Int]) {
		for i in (1..<a.count).reversed() {
			a.swapAt(0, i)
			maxHeapify1(&a, index: 0, size: i)
		}
	}
	
	private func buildMaxHeap1(_ a: inout [Int]) {
		for i in (0..<(a.count/2-1)).reversed() {
			maxHeapify1(&a, index: i, size: a.count)
		}
	}
	
	private func maxHeapify1(_ a: inout [Int], index: Int, size: Int) {
		let temp = a[index]
		var cur = index
		var left = 2*cur+1
		while left < size {
			if left + 1 < size && a[left+1] > a[left] {
				left+=1
			}
			if temp > a[left] {
				break
			}
			else {
				a[cur] = a[left]
				cur = left
				left = left*2+1
			}
		}
		a[cur] = temp
	}
	
	func buildMaxHeap2(_ a: inout [Int]) {
		for i in (0...(a.count/2 - 1)).reversed() {
			sink(&a, start: i, size: a.count)
		}
	}
	
	func heapSort2(_ a: inout [Int]) {
		for i in (1..<a.count).reversed() {
			a.swapAt(0, i)
			sink(&a, start: 0, size: i)
		}
	}
	
	func sink(_ a: inout [Int], start: Int, size: Int) {
		var i = start*2 + 1
		var j = start
		let temp = a[start]
		while i < size {
			if i + 1 < size && a[i+1] > a[i] {
				i+=1
			}
			if temp > a[i] {
				break
			}
			a[j] = a[i]
			j = i
			i = i*2+1
		}
		a[j] = temp
	}
}
