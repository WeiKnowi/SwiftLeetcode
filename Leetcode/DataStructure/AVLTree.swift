//
//  AVLTree.swift
//  Leetcode
//
//  Created by 未可知 on 2019/12/31.
//  Copyright © 2019 com.septnet.business. All rights reserved.
//

import Foundation

class AVLTreeNode {
	var val: Int
	var left: AVLTreeNode?
	var right: AVLTreeNode?
	var height: Int
	init(_ val: Int) {
		self.val = val
		self.left = nil
		self.right = nil
		self.height = 0
	}
	
	func creatNode(_ val: Int, left: AVLTreeNode?, right: AVLTreeNode?, height: Int) -> AVLTreeNode {
		let tree = AVLTreeNode.init(val)
		tree.left = left
		tree.right = right
		tree.height = height
		return tree
	}
	
	func height(_ node: AVLTreeNode?) -> Int {
		return node == nil ? 0 : node!.height
	}
	
	func leftLeftRotation(k2: AVLTreeNode?) -> AVLTreeNode? {
		if k2 == nil {
			return nil
		}
		let k1: AVLTreeNode = k2!.left!
		k2!.left = k1.right
		k1.right = k2
		k2!.height = max(height(k2!.left), height(k2!.right)) + 1
		k1.height = max(height(k1.left), k2!.height) + 1
		return k1
	}
	
	func rightRightRotation(k2: AVLTreeNode?) -> AVLTreeNode? {
		if k2 == nil {
			return nil
		}
		let k1: AVLTreeNode = k2!.right!
		k1.right = k2!.left
		k2!.left = k1
		k1.height = max(height(k1.left), height(k1.right)) + 1
		k2!.height = max(height(k2!.right), k1.height) + 1
		return k1
	}
	
	func leftRightRotation(k3: AVLTreeNode?) -> AVLTreeNode? {
		if k3 == nil {
			return nil
		}
		k3!.left = rightRightRotation(k2: k3!.left!)
		return leftLeftRotation(k2: k3)
	}
	
	func rightLeftRotation(k3: AVLTreeNode?) -> AVLTreeNode? {
		if k3 == nil {
			return nil
		}
		k3!.right = leftLeftRotation(k2: k3!.right!)
		return rightRightRotation(k2: k3)
	}
	
	func treeInsert(tree: AVLTreeNode?, val: Int) -> AVLTreeNode {
		var root = tree
		if root == nil {
			root = creatNode(val, left: nil, right: nil, height: 1)
		}
		else if val < root!.val {
			root?.left = treeInsert(tree: root?.left, val: val)
			// 因为向root添加了左节点，所以左节点的高度一定大于等于0，且当差值为2的时候，失去平衡，且失去平衡的情况必为LL或者LR
			if height(root?.left) - height(root?.right) == 2 {
				if val < root!.left!.val {
					root = leftLeftRotation(k2: root)
				}
				else {
					root = leftRightRotation(k3: root)
				}
			}
		}
		else if val > root!.val {
			root?.right = treeInsert(tree: root?.right, val: val)
			// 因为向root添加了右节点，所以右节点的高度一定大于等于0，且当差值为2的时候，失去平衡，且失去平衡的情况必为RR或者RL
			if height(root?.right) - height(root?.left) == 2 {
				if val > root!.right!.val {
					root = rightRightRotation(k2: root)
				}
				else {
					root = rightLeftRotation(k3: root)
				}
			}
		}
		else {
			print("添加失败: 不允许添加相同的节点")
		}
		root?.height = max(height(root?.left), height(root?.right)) + 1
		return root!
	}
	
	func delete(tree: AVLTreeNode?, node: AVLTreeNode?) -> AVLTreeNode? {
		if tree == nil || node == nil {
			return nil
		}
		var root = tree
		if node!.val < root!.val {
			root?.left = delete(tree: root?.left, node: node)
			if height(root?.right) - height(root?.left) == 2 {
				if height(root?.right?.left) > height(root?.right?.right) {
					root = rightLeftRotation(k3: root)
				}
				else {
					root = rightRightRotation(k2: root)
				}
			}
		}
		else if node!.val > root!.val {
			root?.right = delete(tree: root?.right, node: node)
			if height(root?.left) - height(root?.right) == 2 {
				if height(root?.left?.left) > height(root?.left?.right) {
					root = leftLeftRotation(k2: root)
				}
				else {
					root = leftRightRotation(k3: root)
				}
			}
		}
		else {
			// 相等
			if root?.left != nil && root?.right != nil {
				if height(root?.left) > height(root?.right) {
					let treeNode = avltreeMax(tree: root!)
					root!.val = treeNode.val
					root?.left = delete(tree: root?.left, node: treeNode)
				}
				else {
					let treeNode = avltreeMini(tree: root!)
					root?.val = treeNode.val
					root?.right = delete(tree: root?.right, node: treeNode)
				}
			}
			else {
				var treeNode = root
				root = root?.left != nil ? root?.left : root?.right
				treeNode = nil
			}
		}
		root?.height = max(height(root?.left), height(root?.right)) + 1
		return root
	}
	
	private func avltreeMax(tree: AVLTreeNode) -> AVLTreeNode {
		var node = tree
		while node.right != nil {
			node = node.right!
		}
		return node
	}
	
	private func avltreeMini(tree: AVLTreeNode) -> AVLTreeNode {
		var node = tree
		while node.left != nil {
			node = node.left!
		}
		return node
	}
	
	func treeInsert1(tree: AVLTreeNode?, val: Int) -> AVLTreeNode {
		var root = tree
		if root == nil {
			root = creatNode(val, left: nil, right: nil, height: 10)
		}
		else if val < root!.val {
			root?.left = treeInsert1(tree: root, val: val)
			if height(root?.left) - height(root?.right) == 2 {
				if val < root!.left!.val {
					root = leftLeftRotation(k2: root)
				}
				else {
					root = leftRightRotation(k3: root)
				}
			}
		}
		else if val > root!.val {
			root?.right = treeInsert1(tree: root, val: val)
			if height(root?.right) - height(root?.left) == 2 {
				if val > root!.right!.val {
					root = rightRightRotation(k2: root)
				}
				else {
					root = leftLeftRotation(k2: root)
				}
			}
		}
		else {
			print("添加失败：不能添加值相同的节点")
		}
		root?.height = max(height(root?.left), height(root?.right)) + 1
		return root!
	}
	
	
	func llRotate(node: AVLTreeNode?) -> AVLTreeNode? {
		if node == nil {
			return nil
		}
		let k: AVLTreeNode! = node?.left!
		k.right = node
		node!.left = k.right
		k.height = max(height(k.left), height(k!.right)) + 1
		node!.height = max(height(node!.left), height(node!.right)) + 1
		return k
	}
	
	func rrRotate(node: AVLTreeNode?) -> AVLTreeNode? {
		if node == nil {
			return nil
		}
		let k: AVLTreeNode! = node?.right
		node?.right = k.left
		k.left = node
		k.height = max(height(k.left), height(k.right)) + 1
		node?.height = max(height(node?.left), height(node?.right)) + 1
		return k
	}
	
	func lrRotate(node: AVLTreeNode?) -> AVLTreeNode? {
		if node == nil {
			return nil
		}
		node?.left = rrRotate(node: node?.left)
		return llRotate(node: node)
	}

	func rlRotate(node: AVLTreeNode?) -> AVLTreeNode? {
		if node == nil {
			return nil
		}
		node?.right = llRotate(node: node?.right)
		return rrRotate(node: node)
	}
	
	func treeInsert2(tree: AVLTreeNode?, val: Int) -> AVLTreeNode {
		var root = tree
		if root == nil {
			root = creatNode(val, left: nil, right: nil, height: 0)
		}
		else {
			if root!.val > val {
				root?.right = treeInsert2(tree: root?.right, val: val)
				if height(root?.right) - height(root?.left) == 2 {
					if height(root?.right?.right) > height(root?.right?.left) {
						root = rrRotate(node: root)
					}
					else {
						root = rlRotate(node: root)
					}
				}
			}
			else if root!.val < val {
				root?.left = treeInsert2(tree: root?.left, val: val)
				if height(root?.left) - height(root?.left) == 2 {
					if height(root?.left?.left) > height(root?.left?.right) {
						root = llRotate(node: root)
					}
					else {
						root = llRotate(node: root)
					}
				}
			}
			else {
				print("do not allow insert same val!")
			}
		}
		root?.height = max(height(root?.left), height(root?.right)) + 1
		return root!
	}
	
	func treeDelete1(tree: AVLTreeNode?, val: Int) -> AVLTreeNode? {
		if tree == nil {
			return nil
		}
		var root: AVLTreeNode! = tree
		if root.val > val {
			root.right = treeDelete1(tree: root.right, val: val)
			if height(root.left) - height(root.right) == 2 {
				if height(root.left?.left) > height(root.left?.right) {
					root = llRotate(node: root)
				}
				else {
					root = lrRotate(node: root)
				}
			}
		}
		else if root.val < val {
			root.left = treeDelete1(tree: root.left, val: val)
			if height(root.right) - height(root.left) == 2 {
				if height(root.right?.right) > height(root.right?.left) {
					root = rrRotate(node: root)
				}
				else {
					root = rlRotate(node: root)
				}
			}
		}
		else {
			// ==
			if root.left == nil && root.right == nil {
				root = nil
			}
			else if root.left == nil && root.right != nil {
				root = root.right
			}
			else if root.left != nil && root.right == nil {
				root = root.left
			}
			else {
				if height(root.left) > height(root.right) {
					let mininode = avltreeMini(tree: root.left!)
					root.val = mininode.val
					root.left = treeDelete1(tree: root.left, val: root.val)
				}
				else {
					let maxnode = avltreeMax(tree: root.right!)
					root.val = maxnode.val
					root.right = treeDelete1(tree: root.right, val: root.val)
				}
			}
		}
		root.height = max(height(root.left), height(root.right))
		return root
	}
}



class Person {
	var age: Int
	var name: String
	init(age: Int, name: String) {
		self.age = age
		self.name = name
	}
}

class Teacher: Person {

	var subject: String
	
	init(age: Int, name: String, subject: String) {
		self.subject = subject
		super.init(age:age,name:name)
	}

	func gotoSchool(){
		print("shangke")
		
	}
	
}
