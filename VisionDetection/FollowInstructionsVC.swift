//
//  FollowInstructionsVC.swift
//  Eye Watch
//
//  Created by Dean Louizos on 2018-08-10.
//  Copyright © 2018 Dean Louizos. All rights reserved.
//

import Foundation
import UIKit

class FollowInstructionsVC: UIViewController {
    let back = UIButton()
    let go = UIButton()
    var inGame: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //useful variables
        let screenW = self.view.frame.size.width
        let screenH = self.view.frame.size.height
        let ratioW = self.view.frame.size.width/414
        let ratioH = self.view.frame.size.height/736
        print(ratioW+ratioH)
        
        //gradient
        let gradient = CAGradientLayer()
        gradient.frame = self.view.frame
        gradient.colors = [UIColor(cgColor: #colorLiteral(red: 0.937254902, green: 0.9764705882, blue: 0.9960784314, alpha: 1)).cgColor, UIColor(cgColor: #colorLiteral(red: 0.4, green: 0.7294117647, blue: 0.9607843137, alpha: 1)).cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        
        //background
        let background = UIView(frame: self.view.frame)
        background.layer.insertSublayer(gradient, at: 0)
        view.addSubview(background)
        
        //back button
        if screenH == 812 {
            back.frame = CGRect(x: screenW-60, y: 30, width: 50, height: 50)
        } else {
            back.frame = CGRect(x: screenW-60, y: 15, width: 50, height: 50)
        }
        back.layer.cornerRadius = 25
        back.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        back.addTarget(self, action: #selector(FollowInstructionsVC.backDown), for: .touchDown)
        back.addTarget(self, action: #selector(FollowInstructionsVC.backUp), for: .touchUpInside)
        back.addTarget(self, action: #selector(FollowInstructionsVC.backCorrect), for: .touchUpOutside)
        
        let x = UIBezierPath()
        x.move(to: CGPoint(x: 12, y: 6))
        x.addLine(to: CGPoint(x: 25, y: 19))
        x.addLine(to: CGPoint(x: 38, y: 6))
        x.addLine(to: CGPoint(x: 44, y: 12))
        x.addLine(to: CGPoint(x: 31, y: 25))
        x.addLine(to: CGPoint(x: 44, y: 38))
        x.addLine(to: CGPoint(x: 38, y: 44))
        x.addLine(to: CGPoint(x: 25, y: 31))
        x.addLine(to: CGPoint(x: 12, y: 44))
        x.addLine(to: CGPoint(x: 6, y: 38))
        x.addLine(to: CGPoint(x: 19, y: 25))
        x.addLine(to: CGPoint(x: 6, y: 12))
        x.close()
        
        let xLayer = CAShapeLayer()
        xLayer.path = x.cgPath
        xLayer.fillColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        back.layer.addSublayer(xLayer)
        
        view.addSubview(back)
        if inGame {
        } else {
            go.setTitle("Go", for: .normal)
            go.frame.size = CGSize(width: screenW-60, height: 60)
            go.layer.cornerRadius = 25
            go.center = CGPoint(x: screenW/2, y: screenH-60)
            go.setTitle("Go", for: .normal)
            go.setTitleColor(#colorLiteral(red: 0.4, green: 0.7294117647, blue: 0.9607843137, alpha: 1), for: .normal)
            go.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 40)
            go.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            go.addTarget(self, action: #selector(FollowInstructionsVC.goDown), for: .touchDown)
            go.addTarget(self, action: #selector(FollowInstructionsVC.goUp), for: .touchUpInside)
            go.addTarget(self, action: #selector(FollowInstructionsVC.goCorrect), for: .touchUpOutside)
            view.addSubview(go)
        }
    }
    
    @objc func backDown() {
        back.backgroundColor = #colorLiteral(red: 0.9473403096, green: 0.9403244853, blue: 0.9527093768, alpha: 0.5)
    }
    
    @objc func backUp() {
        back.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        dismiss(animated: true)
        
    }
    
    @objc func backCorrect() {
        back.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
    }
    
    @objc func goDown() {
        go.backgroundColor = #colorLiteral(red: 0.9473403096, green: 0.9403244853, blue: 0.9527093768, alpha: 1)
    }
    
    @objc func goUp() {
        go.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        if go.titleLabel?.text == "Go" {
            let vc = CalibrationVC()
            vc.inGame = false
            vc.game = "follow"
            present(vc, animated: true)
        } else {
            dismiss(animated: true)
        }
        
    }
    
    @objc func goCorrect() {
        go.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
}
