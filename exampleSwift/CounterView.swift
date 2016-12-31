//
//  CounterView.swift
//  coreGraphic
//
//  Created by Developer on 12/31/16.
//  Copyright © 2016 Developer. All rights reserved.
//

import UIKit

let NoOfGlasses = 8
let π:CGFloat = CGFloat(M_PI)

@IBDesignable
class CounterView: UIView {
    
    @IBInspectable var outlineColor: UIColor = UIColor.blue
    @IBInspectable var counterColor: UIColor = UIColor.orange
    
    @IBInspectable var counter: Int = 5 {
        didSet {
            if counter <=  NoOfGlasses {
                //the view needs to be refreshed
                setNeedsDisplay()
            }
        }
    }
    
    override func draw(_ rect: CGRect) {
        // 1.
        let center = CGPoint(x: bounds.width/2, y: bounds.height/2)
        // 2.
        let radius = bounds.height
        // 3. 
        let arcWidth:CGFloat = 76
        
        // 4.
        let startAngle: CGFloat = 3*π / 4
        let endAngle: CGFloat = π/4
        
        // 5.
        let path = UIBezierPath(arcCenter: center,
                                radius: radius/2 - arcWidth/2,
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: true)
        
        // 6.
        path.lineWidth = arcWidth
        counterColor.setStroke()
        path.stroke()
        
        // 7.
        let angleDifference: CGFloat = 2*π - startAngle + endAngle // the part from start to end point (3*π)/2
        let arcLengthPerGlass = angleDifference / CGFloat(NoOfGlasses) // chieu dai duong cong moi~ phan trong duong tron (3*π)/2 / 8
        
        //
        //then multiply out by the actual glasses drunk 
        // arcLengthPerGlass: (3*π)/16
        // outlineEndAngle: (27*π)/16
        let outlineEndAngle = arcLengthPerGlass * CGFloat(counter) + (startAngle)
        
        //2 - draw the outer arc
   
        
        UIView.animate(withDuration: 2.0, animations: {
            let outlinePath = UIBezierPath(arcCenter: center,
                                           radius: self.bounds.width/2 - 2.5,
                                           startAngle: startAngle,
                                           endAngle: outlineEndAngle,
                                           clockwise: true)
            
            //3 - draw the inner arc
            outlinePath.addArc(withCenter: center,
                               radius: self.bounds.width/2 - arcWidth + 2.5,
                               startAngle: outlineEndAngle,
                               endAngle: startAngle,
                               clockwise: false)
            
            //4 - close the path
            outlinePath.close()
            
            self.outlineColor.setStroke()
            outlinePath.lineWidth = 5.0
            outlinePath.stroke()
        })
    }
}
