//
//  FollowGameVC.swift
//  Eye Watch
//
//  Created by Dean Louizos on 2018-08-13.
//  Copyright © 2018 Dean Louizos. All rights reserved.
//

import Foundation
import UIKit

class FollowGameVC: UIViewController {
    let menu = MenuView()
    let pause = UIButton()
    var screenW: CGFloat = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //useful variables
        let screenW = self.view.frame.size.width
        let screenH = self.view.frame.size.height
        let ratioW = self.view.frame.size.width/414
        let ratioH = self.view.frame.size.height/736
        self.screenW = screenW
        print(ratioH+ratioW)
        
        //background
        let background = UIView(frame: self.view.frame)
        background.backgroundColor = #colorLiteral(red: 0.1882352941, green: 0.462745098, blue: 0.7058823529, alpha: 1)
        view.addSubview(background)
        
        //back button
        if screenH == 812 {
            pause.frame = CGRect(x: screenW-60, y: 30, width: 50, height: 50)
        } else {
            pause.frame = CGRect(x: screenW-60, y: 15, width: 50, height: 50)
        }
        pause.layer.cornerRadius = 25
        pause.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        pause.addTarget(self, action: #selector(FollowGameVC.pauseDown), for: .touchDown)
        pause.addTarget(self, action: #selector(FollowGameVC.pauseUp), for: .touchUpInside)
        pause.addTarget(self, action: #selector(FollowGameVC.pauseCorrect), for: .touchUpOutside)
        
        let pau = UIBezierPath()
        pau.move(to: CGPoint(x: 12, y: 10))
        pau.addLine(to: CGPoint(x: 20, y: 10))
        pau.addLine(to: CGPoint(x: 20, y: 25))
        pau.addLine(to: CGPoint(x: 30, y: 25))
        pau.addLine(to: CGPoint(x: 30, y: 10))
        pau.addLine(to: CGPoint(x: 38, y: 10))
        pau.addLine(to: CGPoint(x: 38, y: 40))
        pau.addLine(to: CGPoint(x: 30, y: 40))
        pau.addLine(to: CGPoint(x: 30, y: 25))
        pau.addLine(to: CGPoint(x: 20, y: 25))
        pau.addLine(to: CGPoint(x: 20, y: 40))
        pau.addLine(to: CGPoint(x: 12, y: 40))
        pau.close()
        
        let pauLayer = CAShapeLayer()
        pauLayer.path = pau.cgPath
        pauLayer.fillColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        pause.layer.addSublayer(pauLayer)
        
        view.addSubview(pause)
        
        menu.create(screenW: screenW, screenH: screenH)
        view.addSubview(menu)
        menu.game = "follow"
        
        menu.resume.addTarget(self, action: #selector(FollowGameVC.resumeUp), for: .touchUpInside)
        menu.resume.addTarget(self, action: #selector(FollowGameVC.resumeDown), for: .touchDown)
        menu.resume.addTarget(self, action: #selector(FollowGameVC.resumeCorrect), for: .touchUpOutside)
        
        menu.howTo.addTarget(self, action: #selector(FollowGameVC.howToUp), for: .touchUpInside)
        menu.howTo.addTarget(self, action: #selector(FollowGameVC.howToDown), for: .touchDown)
        menu.howTo.addTarget(self, action: #selector(FollowGameVC.howToCorrect), for: .touchUpOutside)
        
        menu.reCal.addTarget(self, action: #selector(FollowGameVC.reCalUp), for: .touchUpInside)
        menu.reCal.addTarget(self, action: #selector(FollowGameVC.reCalDown), for: .touchDown)
        menu.reCal.addTarget(self, action: #selector(FollowGameVC.reCalCorrect), for: .touchUpOutside)
        
        menu.exit.addTarget(self, action: #selector(FollowGameVC.exitUp), for: .touchUpInside)
        menu.exit.addTarget(self, action: #selector(FollowGameVC.exitDown), for: .touchDown)
        menu.exit.addTarget(self, action: #selector(FollowGameVC.exitCorrect), for: .touchUpOutside)
        
        
    }
    @objc func pauseUp() {
        pause.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        pause.center = CGPoint(x: 0, y: -100)
        menu.open()
    }
    @objc func pauseDown() {
        pause.backgroundColor = #colorLiteral(red: 0.9473403096, green: 0.9403244853, blue: 0.9527093768, alpha: 0.5)
    }
    @objc func pauseCorrect() {
        pause.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
    }
    @objc func resumeDown() {
        menu.resume.backgroundColor = #colorLiteral(red: 0.9473403096, green: 0.9403244853, blue: 0.9527093768, alpha: 1)
    }
    
    @objc func resumeUp() {
        menu.resume.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        pause.frame.origin = CGPoint(x: screenW-60, y: 15)
        menu.close()
    }
    
    @objc func resumeCorrect() {
        menu.resume.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    @objc func howToDown() {
        menu.howTo.backgroundColor = #colorLiteral(red: 0.9473403096, green: 0.9403244853, blue: 0.9527093768, alpha: 1)
    }
    
    @objc func howToUp() {
        menu.howTo.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        let vc = FollowInstructionsVC()
        vc.inGame = true
        present(vc, animated: true)
    }
    
    @objc func howToCorrect() {
        menu.howTo.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    @objc func reCalDown() {
        menu.reCal.backgroundColor = #colorLiteral(red: 0.9473403096, green: 0.9403244853, blue: 0.9527093768, alpha: 1)
    }
    
    @objc func reCalUp() {
        menu.reCal.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        let vc = CalibrationVC()
        vc.inGame = true
        present(vc, animated: true)
    }
    
    @objc func reCalCorrect() {
        menu.reCal.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    @objc func exitDown() {
        menu.exit.backgroundColor = #colorLiteral(red: 0.9473403096, green: 0.9403244853, blue: 0.9527093768, alpha: 1)
    }
    
    @objc func exitUp() {
        menu.exit.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true)
    }
    
    @objc func exitCorrect() {
        menu.exit.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
}
