//
//  MenuView.swift
//  Eye Watch
//
//  Created by Dean Louizos on 2018-08-13.
//  Copyright © 2018 Dean Louizos. All rights reserved.
//

import Foundation
import UIKit

class MenuView: UIView {
    var screenW: CGFloat = 0
    var screenH: CGFloat = 0
    let resume = UIButton(frame: CGRect(x: 20, y: 80, width: 0, height: 60))
    let howTo = UIButton(frame: CGRect(x: 20, y: 155, width: 0, height: 60))
    let reCal = UIButton(frame: CGRect(x: 20, y: 230, width: 0, height: 60))
    let exit = UIButton(frame: CGRect(x: 20, y: 305, width: 0, height: 60))
    var game = ""
    var ratioW: CGFloat = 0
    var ratioH: CGFloat = 0
    
    func create(screenW: CGFloat, screenH: CGFloat) {
        self.screenW = screenW
        self.screenH = screenH
        ratioW = screenW/414
        ratioH = screenH/736
        
        frame = CGRect(x: 50*ratioW, y: screenH+10, width: screenW-100*ratioW, height: 380)
        backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.3019607843, blue: 0.4862745098, alpha: 1)
        self.layer.cornerRadius = 10
        
        let title = UILabel(frame: CGRect(x: 0, y: 0, width: screenW-100*ratioW, height: 80))
        title.text = "Menu"
        title.textAlignment = .center
        title.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        title.font = UIFont(name: "Avenir-Heavy", size: 50*ratioW)
        self.addSubview(title)
        
        resume.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        resume.frame.size.width = self.frame.size.width-40
        resume.setTitle("Resume", for: .normal)
        resume.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 30)
        resume.setTitleColor(#colorLiteral(red: 0.4, green: 0.7294117647, blue: 0.9607843137, alpha: 1), for: .normal)
        resume.layer.cornerRadius = 25
        self.addSubview(resume)
        
        
        howTo.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        howTo.frame.size.width = self.frame.size.width-40
        howTo.setTitle("How to Play", for: .normal)
        howTo.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 30)
        howTo.setTitleColor(#colorLiteral(red: 0.4, green: 0.7294117647, blue: 0.9607843137, alpha: 1), for: .normal)
        howTo.layer.cornerRadius = 25
        self.addSubview(howTo)
        
        
        reCal.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        reCal.frame.size.width = self.frame.size.width-40
        reCal.setTitle("Recalibrate", for: .normal)
        reCal.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 30)
        reCal.setTitleColor(#colorLiteral(red: 0.4, green: 0.7294117647, blue: 0.9607843137, alpha: 1), for: .normal)
        reCal.layer.cornerRadius = 25
        self.addSubview(reCal)
        
        
        exit.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        exit.frame.size.width = self.frame.size.width-40
        exit.setTitle("Exit", for: .normal)
        exit.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 30)
        exit.setTitleColor(#colorLiteral(red: 0.4, green: 0.7294117647, blue: 0.9607843137, alpha: 1), for: .normal)
        exit.layer.cornerRadius = 25
        self.addSubview(exit)
        
        
    }
    func open() {
        self.frame.origin = CGPoint(x: 50*ratioW, y: 50*ratioH)
    }
    func close() {
        self.frame.origin = CGPoint(x: 50, y: screenH+50)
    }
}
