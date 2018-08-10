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
        back.frame.size = CGSize(width: screenW-60, height: 60)
        back.layer.cornerRadius = 25
        back.center = CGPoint(x: screenW/2, y: screenH-60)
        back.setTitle("Back", for: .normal)
        back.setTitleColor(#colorLiteral(red: 0.4, green: 0.7294117647, blue: 0.9607843137, alpha: 1), for: .normal)
        back.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 40)
        back.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        back.addTarget(self, action: #selector(FollowInstructionsVC.backDown), for: .touchDown)
        back.addTarget(self, action: #selector(FollowInstructionsVC.backUp), for: .touchUpInside)
        back.addTarget(self, action: #selector(FollowInstructionsVC.backCorrect), for: .touchUpOutside)
        view.addSubview(back)
    }
    
    @objc func backDown() {
        back.backgroundColor = #colorLiteral(red: 0.9473403096, green: 0.9403244853, blue: 0.9527093768, alpha: 1)
    }
    
    @objc func backUp() {
        back.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        dismiss(animated: true)
    }
    
    @objc func backCorrect() {
        back.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
}
