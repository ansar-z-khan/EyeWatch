//
//  FadingCircle.swift
//  Eye Watch
//
//  Created by Dean Louizos on 2018-08-10.
//  Copyright © 2018 Dean Louizos. All rights reserved.
//

import Foundation
import UIKit

class FadingCircle {
    let TLPath = UIBezierPath()
    let TRPath = UIBezierPath()
    let BRPath = UIBezierPath()
    let BLPath = UIBezierPath()
    
    init(radius: CGFloat, screenW: CGFloat, screenH: CGFloat) {
        
        TLPath.move(to: CGPoint(x: screenW/20, y: screenW/20-radius))
        TLPath.addArc(withCenter: CGPoint(x: screenW/20, y: screenW/20), radius: radius, startAngle: 3*CGFloat.pi/2, endAngle: CGFloat.pi/2, clockwise: false)
        TLPath.addArc(withCenter: CGPoint(x: screenW/20, y: screenW/20), radius: radius, startAngle: CGFloat.pi/2, endAngle: 3*CGFloat.pi/2, clockwise: false)
        TLPath.close()
        
        TRPath.move(to: CGPoint(x: screenW-screenW/20, y: screenW/20-radius))
        TRPath.addArc(withCenter: CGPoint(x: screenW-screenW/20, y: screenW/20), radius: radius, startAngle: 3*CGFloat.pi/2, endAngle: CGFloat.pi/2, clockwise: false)
        TRPath.addArc(withCenter: CGPoint(x: screenW-screenW/20, y: screenW/20), radius: radius, startAngle: CGFloat.pi/2, endAngle: 3*CGFloat.pi/2, clockwise: false)
        TRPath.close()
        
        BRPath.move(to: CGPoint(x: screenW-screenW/20, y: screenH-screenW/20-radius))
        BRPath.addArc(withCenter: CGPoint(x: screenW-screenW/20, y: screenH-screenW/20), radius: radius, startAngle: 3*CGFloat.pi/2, endAngle: CGFloat.pi/2, clockwise: false)
        BRPath.addArc(withCenter: CGPoint(x: screenW-screenW/20, y: screenH-screenW/20), radius: radius, startAngle: CGFloat.pi/2, endAngle: 3*CGFloat.pi/2, clockwise: false)
        BRPath.close()
        
        BLPath.move(to: CGPoint(x: screenW/20, y: screenH-screenW/20-radius))
        BLPath.addArc(withCenter: CGPoint(x: screenW/20, y: screenH-screenW/20), radius: radius, startAngle: 3*CGFloat.pi/2, endAngle: CGFloat.pi/2, clockwise: false)
        BLPath.addArc(withCenter: CGPoint(x: screenW/20, y: screenH-screenW/20), radius: radius, startAngle: CGFloat.pi/2, endAngle: 3*CGFloat.pi/2, clockwise: false)
        BLPath.close()
    }
    func animate() {
        
    }
}
