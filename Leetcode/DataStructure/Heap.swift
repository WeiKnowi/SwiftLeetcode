//
//  Heap.swift
//  Leetcode
//
//  Created by 未可知 on 2019/12/27.
//  Copyright © 2019 com.septnet.business. All rights reserved.
//

import Foundation

//MARK: - 这个数组是从index = 0 开始的
class Heap {
	var heap = Array<Int>()
	init() {
	}
	
	func insertVal(_ val: Int) {
		heap.append(val)
		percolateUp()
//		printHeap(heap: heap)
	}
	
	func removeVal(_ val: Int) {
		let index = getValIndex(val)
		if index == -1 {
			print("Doesn't exist val -> \(val)")
			return
		}
		let end = heap.count - 1
		heap[index] = heap[end]
		heap.removeLast()
		percolateDown(start: index, end: end-1)
//		printHeap(heap: heap)
	}
	/// n = 2 * j + 1
	private func percolateUp() {
		var n = heap.count - 1
		var j = n/2
		while j >= 0 && heap[n] > heap[j] {
			heap.swapAt(n, j)
			n = j
			j = n/2
		}
	}
	
	private func percolateDown(start: Int, end: Int) {
		var i = start
		let tmp = heap[i]
		var j = 2*i+1
		while j <= end {
			if j < end && heap[j] < heap[j+1] {
				j+=1
			}
			if tmp > heap[j] {
				break
			}
			else {
				heap[i] = heap[j]
				i = j
				j = 2*j+1
			}
		}
		// 之前只是调整值，并没有把需要调换的最小值赋值
		heap[i] = tmp
	}
	
	private func getValIndex(_ val: Int) -> Int {
		if !heap.contains(val) {
			return -1
		}
		var index = 0
		for i in 0..<heap.count {
			if heap[i] == val {
				break
			}
			index+=1
		}
		return index
	}
	
	
	// 上浮
	private func swim() {
		var i = heap.count - 1
		var j = (i-1)/2
		while j >= 0 && heap[i] > heap[j] {
			heap.swapAt(i, j)
			i = j
			j = (i-1)/2
		}
	}
	
	// 下沉
	private func sink(start: Int, end: Int) {
		var i = start
		let temp = heap[i] // 注意点
		var j = start*2 + 1
		while j <= end {
			if j+1 <= end && heap[j+1] > heap[j] {
				j+=1
			}
			if heap[j] > temp { // 注意点，这里是temp去比较
				heap[i] = heap[j]
				i = j
				j = i*2+1
			}
			else {
				break
			}
		}
		heap[i] = temp // 这里是 i 去赋值
	}
	
//	func printHeap(heap: Array<Any>){
//		print("=========堆的结构=========")
//		print(heap)
//		var i = 0
//		repeat {
//			let left = (1<<i - 1)
//			let right = left + 1<<i
//			if right - heap.count >= 1 {
//				break
//			}
//			print(heap[left..<right])
//			i+=1
//		} while 1<<(i+1) < heap.count
//	}
	
	
	
}
