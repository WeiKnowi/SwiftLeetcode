//
//  BSTree.swift
//  Leetcode
//
//  Created by 未可知 on 2020/1/10.
//  Copyright © 2020 com.septnet.business. All rights reserved.
//

import Foundation

class BSTreeNode: Equatable {
	static func == (lhs: BSTreeNode, rhs: BSTreeNode) -> Bool {
		return lhs.key == rhs.key && lhs.left == rhs.right && lhs.right == rhs.right && lhs.parent == rhs.parent
	}
	
	var key: Int
	var left: BSTreeNode?
	var right: BSTreeNode?
	var parent: BSTreeNode?
	init(_ key: Int) {
		self.key = key
		self.left = nil
		self.right = nil
		self.parent = nil
	}
	
}

protocol Tree {
	associatedtype T
	func preOrder(node: T?)
	func inOrder(node: T?)
	func postOrder(node: T?)
	func search(tree: T?, val: Int) -> T?
	func treeMax(tree: T?) -> T?
	func treeMin(tree: T?) -> T?
}

class BST: Tree {
	typealias T = BSTreeNode
	
	static private(set) var treeRoot: BSTreeNode?
	
	func preOrder(node: T?) {
		if node != nil {
			print(node!.key)
			preOrder(node: node?.left)
			preOrder(node: node?.right)
		}
	}
	
	// 从小到大打印
	func inOrder(node: T?) {
		if node != nil {
			inOrder(node: node?.left)
			print(node!.key)
			inOrder(node: node?.right)
		}
	}
	
	func postOrder(node: T?) {
		if node != nil {
			postOrder(node: node?.left)
			postOrder(node: node?.right)
			print(node!.key)
		}
	}
	
	func search(tree: T?, val: Int) -> T? {
		if tree == nil || tree?.key == val {
			return tree
		}
		if val < tree!.key {
			return search(tree: tree?.left, val: val)
		}
		else {
			return search(tree: tree?.right, val: val)
		}
	}
	
	func treeMax(tree: BSTreeNode?) -> BSTreeNode? {
		if tree == nil {
			return nil
		}
		var node = tree
		while node?.right != nil {
			node = node?.right
		}
		return node
	}
	
	func treeMin(tree: BSTreeNode?) -> BSTreeNode? {
		if tree == nil {
			return nil
		}
		var node = tree
		while node?.left != nil {
			node = node?.left
		}
		return node
	}
	
	// 后继
	func successor(nodel: BSTreeNode) -> BSTreeNode? {
		var x = nodel
		if x.right != nil {
			return treeMax(tree: x.right)!
		}
		var y = nodel.parent
		while y != nil && x == y!.right {
			x = y!
			y = y?.parent
		}
		return y
	}
	
	//前驱 ,小于该节点的最大节点
	func preDecessor(node: BSTreeNode) -> BSTreeNode? {
		var x = node
		if x.left != nil {
			return treeMax(tree: x.left)
		}
		var y = x.parent
		while y != nil && x == y?.left {
			x = y!
			y = y?.parent
		}
		return y
	}
	
	func treeInsert(tree: T?, node: T)  {
		if tree == nil {
			BST.treeRoot = node
			return
		}
		var x = tree
		var y = x
		while x != nil {
			y = x
			if node.key < x!.key {
				x = node.left
			}
			else {
				x = node.right
			}
		}
		node.parent = y
		if node.key < y!.key {
			y!.left = node
		}
		else {
			y!.right = node
		}
	}
	
	// 小于node的最大值
	func preDecessor1(node: BSTreeNode) -> BSTreeNode? {
		var x = node
		if x.left != nil {
			return treeMax(tree: x.left)
		}
		var y = x.parent
		while x == y?.left && y != nil {
			x = y!
			y = y?.parent
		}
		return y
	}
	
	// 大于node的最小值
	func successor1(node: BSTreeNode) -> BSTreeNode? {
		var x = node
		if x.right != nil {
			return treeMin(tree: x.right)
		}
		var y = x.parent
		while x == y?.right && y != nil {
			x = y!
			y = y?.parent
		}
		return y
	}
	
	
	
}
