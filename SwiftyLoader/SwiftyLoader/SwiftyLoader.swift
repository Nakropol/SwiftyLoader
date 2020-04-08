//
//  SwiftyLoader.swift
//  SwiftyLoader
//
//  Created by Orkan Çep on 8.04.2020.
//  Copyright © 2020 Orkan Çep. All rights reserved.
//

import Foundation
import UIKit

class SwiftyLoader: UIView {
    
    private let progressLayer = CAShapeLayer()
    
    private let lightBoxView = UIView()
    private let firstView = UIView()
    private let secondView = UIView()
    private let loadingView = UIView()
    
    private var xPosition:CGFloat!
    private var yPosition:CGFloat!
    private var animationWidth:CGFloat!
    private var animationHeight:CGFloat!
    
    private var mainWidth = UIScreen.main.bounds.width
    private var mainHeight = UIScreen.main.bounds.height
    
    public typealias LoaderCompletion = (() -> Void)
    private var completion: LoaderCompletion?
    
    typealias AnimationCompletion = () -> Void
    
    // Opener Style
    private var _openerStyle: SwiftyLoaderStyle = .toTop
    
    open var openerStyle: SwiftyLoaderStyle {
        get { return _openerStyle }
        set { _openerStyle = newValue }
    }
    
    // Closing Style
    private var _closingStyle: SwiftyLoaderStyle = .toBottom
    
    open var closingStyle: SwiftyLoaderStyle {
        get { return _closingStyle }
        set { _closingStyle = newValue }
    }
    
    // Background Color
    private var _bgColor: UIColor = .blue
    
    open var bgColor: UIColor {
        get { return _bgColor }
        set { _bgColor = newValue }
    }
    
    // Closing Delay
    private var _closingDelay: TimeInterval = 2.0
    
    open var closingDelay: TimeInterval {
        get { return _closingDelay }
        set { _closingDelay = newValue }
    }
    
    // Indicator Color
    private var _indicatorColor: CGColor = UIColor.white.cgColor
    
    open var indicatorColor:CGColor {
        get { return _indicatorColor }
        set { _indicatorColor = newValue }
    }
    
    //Indicator Size
    private var _indicatorRadius: CGFloat = 60.0
    
    open var indicatorRadius: CGFloat {
        get { return _indicatorRadius }
        set { _indicatorRadius = newValue }
    }
    
    // Indicator Line Height
    private var _indicatorLineSize: CGFloat = 4
    
    open var indicatorLineSize: CGFloat {
        get { return _indicatorLineSize }
        set { _indicatorLineSize = newValue }
    }
    
    // Initializers
    override init(frame:CGRect) {
        super.init(frame:frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Start Loader
    public func startLoader(completion: LoaderCompletion? = nil) {
        
        self.completion = completion
        
        openerAnimation(animationType: _openerStyle) {
            self.completion?()
        }
    }
    
    // Close Loader
    public func closeLoader(completion: LoaderCompletion? = nil) {
        self.completion = completion
        
        closingAnimation(animationType: _closingStyle) {
            self.completion?()
        }
    }
    
    // MARK: - Opener Animation
    
    private func openerAnimation(animationType: SwiftyLoaderStyle, completion: AnimationCompletion) {
        print(animationType)
        
        UIApplication.shared.keyWindow?.addSubview(lightBoxView)
        
        switch animationType {
        case .toBottom:
            xPosition = 0
            yPosition = -20
            animationWidth = mainWidth
            animationHeight = 0
            break
            
        case .toTop:
            xPosition = 0
            yPosition = mainHeight + 20
            animationWidth = mainWidth
            animationHeight = 0
            break
            
        case .toRight:
            xPosition = 0
            yPosition = 0
            animationWidth = 0
            animationHeight = mainHeight
            break
            
        case .toLeft:
            xPosition = mainWidth
            yPosition = 0
            animationWidth = 0
            animationHeight = mainHeight
            break
            
        case .toCenter:
            xPosition = 0
            yPosition = mainHeight/2
            animationWidth = mainWidth
            animationHeight = 0
        }
        
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        firstView.backgroundColor = bgColor
        firstView.alpha = 0.5
        firstView.frame = CGRect(x: xPosition, y: yPosition, width: animationWidth, height: animationHeight)
        lightBoxView.addSubview(firstView)
        
        secondView.backgroundColor = bgColor
        secondView.frame = CGRect(x: xPosition, y: yPosition, width: animationWidth, height: animationHeight)
        lightBoxView.addSubview(secondView)
        
        loadingView.frame = CGRect(x:0 , y:0, width: mainWidth, height: mainHeight )
        loadingView.backgroundColor = .clear
        lightBoxView.addSubview(loadingView)
        
        UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseOut, animations: {
            self.firstView.frame = CGRect(x: 0, y: 0, width: self.mainWidth, height: self.mainHeight)
        })
        
        UIView.animate(withDuration: 0.4, delay: 0.2, options: .curveEaseOut, animations: {
            self.secondView.frame = CGRect(x: 0, y: 0, width: self.mainWidth, height: self.mainHeight)
        }) { (finished) in
            self.completion?()
            self.loadingLayer(view: self.loadingView)
        }
        
    }
    
    private func loadingLayer(view: UIView) {
        let progressCenter = UIApplication.shared.keyWindow?.center
        let progressPath = UIBezierPath(arcCenter: progressCenter!, radius: _indicatorRadius, startAngle: -CGFloat.pi / 2, endAngle: 3 * CGFloat.pi / 2, clockwise: true)
        progressLayer.path = progressPath.cgPath
        
        progressLayer.strokeEnd = 0
        progressLayer.lineWidth = _indicatorLineSize
        progressLayer.lineCap = .round
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = _indicatorColor
        
        view.layer.addSublayer(progressLayer)
        
        let progressEndAnimation:CAAnimation = {
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.fromValue = 0
            animation.toValue = 1
            animation.duration = 1.2
            animation.fillMode = .forwards
            animation.isRemovedOnCompletion = false
            
            return animation
        }()
        
        let progressStartAnimation:CAAnimation = {
            let animation = CABasicAnimation(keyPath: "strokeStart")
            animation.fromValue = 0
            animation.toValue = 1
            animation.beginTime = 0.5
            animation.duration = 0.7
            animation.fillMode = .forwards
            animation.isRemovedOnCompletion = false

            return animation
        }()
        
        let group = CAAnimationGroup()
        group.animations = [progressEndAnimation, progressStartAnimation]
        group.duration = 1.22
        group.repeatCount = .infinity
        progressLayer.add(group, forKey: "grp")
        
    }
    
    
    
    // MARK: - Closing Animation
    
    private func closingAnimation(animationType: SwiftyLoaderStyle, completion: AnimationCompletion) {
        UIApplication.shared.keyWindow?.addSubview(lightBoxView)
        
        switch animationType {
        case .toBottom:
            xPosition = 0
            yPosition = mainHeight
            animationWidth = mainWidth
            animationHeight = 0
            break
            
        case .toTop:
            xPosition = 0
            yPosition = 0
            animationWidth = mainWidth
            animationHeight = 0
            break
            
        case .toRight:
            xPosition = mainWidth
            yPosition = 0
            animationWidth = 0
            animationHeight = mainHeight
            break
            
        case .toLeft:
            xPosition = 0
            yPosition = 0
            animationWidth = 0
            animationHeight = mainHeight
            break
            
        case .toCenter:
            xPosition = 0
            yPosition = mainHeight/2
            animationWidth = mainWidth
            animationHeight = 0
        }
        
        UIView.animate(withDuration: 0.4, delay: _closingDelay, options: .curveEaseOut, animations: {
            self.loadingView.alpha = 0.0
        })
        
        UIView.animate(withDuration: 0.4, delay: _closingDelay + 0.2, options: .curveEaseOut, animations: {
            self.secondView.frame = CGRect(x: self.xPosition, y: self.yPosition, width: self.animationWidth, height: self.animationHeight)
        })
        
        UIView.animate(withDuration: 0.4, delay: _closingDelay + 0.4, options: .curveEaseOut, animations: {
            self.firstView.frame = CGRect(x: self.xPosition, y: self.yPosition, width: self.animationWidth, height: self.animationHeight)
        }) { (finished) in
            UIApplication.shared.endIgnoringInteractionEvents()
            self.completion?()
            
            self.loadingView.alpha = 1.0
            self.progressLayer.removeFromSuperlayer()
            self.loadingView.removeFromSuperview()
            self.firstView.removeFromSuperview()
            self.secondView.removeFromSuperview()
            self.lightBoxView.removeFromSuperview()
            
        }
        
    }
    
}
