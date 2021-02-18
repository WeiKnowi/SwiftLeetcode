//
//  ViewController.swift
//  Leetcode
//
//  Created by 未可知 on 2019/1/8.
//  Copyright © 2019 com.septnet.business. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	var shapeLayer = CAShapeLayer()
	
	var link: CADisplayLink?
	
	var total = 24.0
	var times = 0.0
	let length = 20.0
	let height = 20.0
	let centerX = 100.0
	let centerY = 100.0

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = UIColor.white
 		let path = UIBezierPath.init()
		path.move(to: CGPoint.init(x: centerX - length/2, y: 100))
		path.addLine(to: CGPoint.init(x: centerX + length/2, y: 101))
		shapeLayer.strokeColor = UIColor.black.cgColor
		shapeLayer.lineWidth = 4
		shapeLayer.lineCap = CAShapeLayerLineCap.round
		shapeLayer.lineJoin = CAShapeLayerLineJoin.round
		shapeLayer.path = path.cgPath
		shapeLayer.fillColor = UIColor.clear.cgColor
		view.layer.addSublayer(shapeLayer)
		
		let path2 = UIBezierPath.init()
		path2.move(to: CGPoint.init(x: centerX - length/2, y: 100))
		path2.addQuadCurve(to: CGPoint.init(x: centerX + length/2, y: 100), controlPoint: CGPoint.init(x: centerX, y: 100 - 20))
		
		shapeLayer.path = path2.cgPath
		let basicAnim = CABasicAnimation.init()
		basicAnim.keyPath = "path"
		basicAnim.fromValue = path.cgPath
		basicAnim.toValue = path2.cgPath
		basicAnim.duration = 1
		shapeLayer.add(basicAnim, forKey: nil)
		
//		shapeLayer.transform = CGAffineTransform(scaleX: <#T##CGFloat#>, y: <#T##CGFloat#>)
		
//		shapeLayer.strokeColor = UIColor.green.cgColor
//		let colorAnim = CABasicAnimation.init(keyPath: "strokeColor")
//		colorAnim.fromValue = UIColor.black.cgColor
//		colorAnim.toValue = UIColor.green.cgColor
//		colorAnim.duration = 1
//		shapeLayer.add(colorAnim, forKey: nil)
		
//		link = CADisplayLink.init(target: self, selector: #selector(linkRun(_:)))
//		link?.add(to: RunLoop.current, forMode: RunLoop.Mode.default)
//		linkRun()
//		anim()
//		DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
//			self.anim()
//		}
	}
	
	func anim() {
		let path = UIBezierPath.init()
		path.move(to: CGPoint.init(x: centerX - length/2, y: 100))
		path.addQuadCurve(to: CGPoint.init(x: centerX + length/2, y: 100), controlPoint: CGPoint.init(x: centerX, y: 100 - 20))
//		shapeLayer.duration = 1.0
		shapeLayer.path = path.cgPath
	}
	

	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		shapeLayer.removeFromSuperlayer()
		let path = UIBezierPath.init()
		path.move(to: CGPoint.init(x: centerX - length/2, y: 100))
		path.addLine(to: CGPoint.init(x: centerX + length/2, y: 101))
//		shapeLayer.strokeColor = UIColor.black.cgColor
//		shapeLayer.lineWidth = 5
//		shapeLayer.lineCap = CAShapeLayerLineCap.round
//		shapeLayer.lineJoin = CAShapeLayerLineJoin.round
		shapeLayer.path = path.cgPath
		view.layer.addSublayer(shapeLayer)
		times = 0.0
		link = CADisplayLink.init(target: self, selector: #selector(linkRun(_:)))
		link?.add(to: RunLoop.current, forMode: RunLoop.Mode.default)
	}
	
	@objc func linkRun(_ link: CADisplayLink){
		if times >= total {
			link.invalidate()
			link.remove(from: RunLoop.current, forMode: RunLoop.Mode.default)
		}
		times+=1
		let ratio = times/total
//		let l = ratio*length
//		let start = centerX - l/2
//		let end = centerX + l/2
		let path = UIBezierPath.init()
		let controlH = height*ratio
		path.move(to: CGPoint.init(x: centerX - length/2, y: 100))
//		path.addLine(to: CGPoint.init(x: centerX + length/2, y: 101))
//		path.move(to: CGPoint.init(x: start, y: 100))
//		path.addLine(to: CGPoint.init(x: end, y: 100))
		path.addQuadCurve(to: CGPoint.init(x: centerX + length/2, y: 100), controlPoint: CGPoint.init(x: centerX, y: 100 - controlH))
		CATransaction.begin()
		CATransaction.setValue(kCFBooleanTrue, forKey: kCATransactionDisableActions)
		shapeLayer.path = path.cgPath
		CATransaction.commit()
	}
}

class BSMAnimLayer: CAShapeLayer {
	
	var originSize = CGSize.zero
	
	var length = 5.0
	
	// 最高点的位置距离当前线的距离 = maxRatio * length
	var maxRatio = 0.5
	
	private var link: CADisplayLink = CADisplayLink.init(target: self, selector: #selector(linkRun))
	
	init(size: CGSize, length: Double, ratio: Double) {
		super.init()
		originSize = size
		self.length = length
		maxRatio = ratio
	}
	
	override init() {
		super.init()
		link.add(to: RunLoop.current, forMode: .default)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	@objc private func linkRun() {
		
	}
	
}

