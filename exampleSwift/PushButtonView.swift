//
//  PushButtonView.swift
//  coreGraphic
//
//  Created by Developer on 12/29/16.
//  Copyright © 2016 Developer. All rights reserved.
//

import UIKit
@IBDesignable
class PushButtonView: UIButton {
    @IBInspectable var fillColor: UIColor = UIColor.green
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        fillColor.setFill()
        path.fill()
        
        let plusHeight = 3.0
//        let plusWidth = min(bounds.width, bounds.height) * 0.6
        
        let plusPath = UIBezierPath()
        plusPath.lineWidth = CGFloat(plusHeight)
        
        // the start point
        plusPath.move(to: CGPoint(x:bounds.width/2-30, y:bounds.height/2))
        plusPath.addLine(to: CGPoint(x: bounds.width/2+30, y: bounds.height/2))
        
        // the end point
        plusPath.move(to: CGPoint(x: 50.0, y: 20))
        plusPath.addLine(to: CGPoint(x:50, y: 80))
        
        #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).setStroke()
        plusPath.stroke()
    }
    
    
    

}
