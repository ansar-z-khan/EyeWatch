//
//  Calibration.swift
//  Eye Watch
//
//  Created by Dean Louizos on 2018-08-10.
//  Copyright © 2018 Dean Louizos. All rights reserved.
//

import Foundation
import UIKit

class CalibrationVC: UIViewController {
    var circles: [FadingCircle] = []
    let outerLayer = CAShapeLayer()
    let middleLayer = CAShapeLayer()
    let innerLayer = CAShapeLayer()
    var n = 0
    var anis: [CABasicAnimation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modalTransitionStyle = .crossDissolve
        
        //useful variables
        let screenW = self.view.frame.size.width
        let screenH = self.view.frame.size.height
        //let ratioW = self.view.frame.size.width/414
        //let ratioH = self.view.frame.size.height/736
        
        //background
        let background = UIButton(frame: self.view.frame)
        background.backgroundColor = #colorLiteral(red: 0.1882352941, green: 0.462745098, blue: 0.7058823529, alpha: 1)
        background.setTitle("Look at the indicated corner and tap anywhere while maintaining your focus", for: .normal)
        background.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        background.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 20)
        background.titleLabel?.numberOfLines = 4
        background.titleEdgeInsets = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40)
        background.titleLabel?.textAlignment = .center
        
        background.addTarget(self, action: #selector(CalibrationVC.animate), for: .touchUpInside)
        view.addSubview(background)
        
        
        //circles
        let outer = FadingCircle(radius: screenW/4, screenW: screenW, screenH: screenH)
        let middle = FadingCircle(radius: screenW/6, screenW: screenW, screenH: screenH)
        let inner = FadingCircle(radius: screenW/12, screenW: screenW, screenH: screenH)
        
        circles.append(outer)
        circles.append(middle)
        circles.append(inner)
        
        outerLayer.path = outer.TLPath.cgPath
        outerLayer.fillColor = #colorLiteral(red: 0.4, green: 0.7294117647, blue: 0.9607843137, alpha: 0.33)
        view.layer.addSublayer(outerLayer)
        
        middleLayer.path = middle.TLPath.cgPath
        middleLayer.fillColor = #colorLiteral(red: 0.4, green: 0.7294117647, blue: 0.9607843137, alpha: 0.67)
        view.layer.addSublayer(middleLayer)
        
        innerLayer.path = inner.TLPath.cgPath
        innerLayer.fillColor = #colorLiteral(red: 0.4, green: 0.7294117647, blue: 0.9607843137, alpha: 1)
        view.layer.addSublayer(innerLayer)
        
    }
    @objc func animate() {
        
        switch n {
        case 0:
            for i in 0...2 {
                anis.append(CABasicAnimation(keyPath: "path"))
                anis[i].fromValue = circles[i].TLPath.cgPath
                anis[i].toValue = circles[i].TRPath.cgPath
                anis[i].duration = 0.5
                anis[i].fillMode = kCAFillModeForwards
                anis[i].isRemovedOnCompletion = false
            }
            outerLayer.add(anis[0], forKey: "path")
            middleLayer.add(anis[1], forKey: "path")
            innerLayer.add(anis[2], forKey: "path")
            
            n += 1
        case 1:
            for i in 0...2 {
                anis.append(CABasicAnimation(keyPath: "path"))
                anis[i+3].fromValue = circles[i].TRPath.cgPath
                anis[i+3].toValue = circles[i].BRPath.cgPath
                anis[i+3].duration = 0.75
                anis[i+3].fillMode = kCAFillModeForwards
                anis[i+3].isRemovedOnCompletion = false
            }
            outerLayer.add(anis[3], forKey: "path")
            middleLayer.add(anis[4], forKey: "path")
            innerLayer.add(anis[5], forKey: "path")
            
            n += 1
        case 2:
            for i in 0...2 {
                anis.append(CABasicAnimation(keyPath: "path"))
                anis[i+6].fromValue = circles[i].BRPath.cgPath
                anis[i+6].toValue = circles[i].BLPath.cgPath
                anis[i+6].duration = 0.5
                anis[i+6].fillMode = kCAFillModeForwards
                anis[i+6].isRemovedOnCompletion = false
            }
            outerLayer.add(anis[6], forKey: "path")
            middleLayer.add(anis[7], forKey: "path")
            innerLayer.add(anis[8], forKey: "path")
            
            n += 1
        default:
            present(FollowInstructionsVC(), animated: false)
        }
    }
}
