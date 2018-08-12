//
//  Arrows.swift
//  Eye Watch
//
//  Created by Dean Louizos on 2018-08-11.
//  Copyright © 2018 Dean Louizos. All rights reserved.
//

import Foundation
import UIKit

class Arrow {
    let path = UIBezierPath()
    let layer = CAShapeLayer()
    init(start: CGPoint, end: CGPoint, thickness: CGFloat) {
        let t = thickness
        
        path.move(to: CGPoint(x: start.x-t, y: start.y-t))
        path.addLine(to: CGPoint(x: end.x, y: end.y-t))
        path.addLine(to: CGPoint(x: end.x, y: end.y-3*t))
        path.addLine(to: CGPoint(x: end.x+3*t, y: end.y))
        path.addLine(to: CGPoint(x: end.x, y: end.y+3*t))
        path.addLine(to: CGPoint(x: end.x, y: end.y+t))
        path.addLine(to: CGPoint(x: start.x-t, y: start.y+t))
        path.close()
        
        layer.path = path.cgPath
        layer.fillColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
    }
}
