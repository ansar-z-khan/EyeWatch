//
//  ViewController.swift
//  Eye Watch
//
//  Created by Dean Louizos on 2018-08-09.
//  Copyright © 2018 Dean Louizos. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    let start = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modalTransitionStyle = .crossDissolve
        //useful variables
        let screenW = self.view.frame.size.width
        let screenH = self.view.frame.size.height
        let ratioW = self.view.frame.size.width/414
        let ratioH = self.view.frame.size.height/736
        
        //gradient
        let gradient = CAGradientLayer()
        gradient.frame = self.view.frame
        gradient.colors = [UIColor(cgColor: #colorLiteral(red: 0.1882352941, green: 0.462745098, blue: 0.7058823529, alpha: 1)).cgColor, UIColor(cgColor: #colorLiteral(red: 0.937254902, green: 0.9764705882, blue: 0.9960784314, alpha: 1)).cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        
        //background
        let background = UIView(frame: self.view.frame)
        background.layer.insertSublayer(gradient, at: 0)
        view.addSubview(background)
        
        //eye
        let eye = EyeGraphic(radius: screenW/2, center: CGPoint(x: screenW/2, y: screenH))
        view.layer.addSublayer(eye.irisLayer)
        view.layer.addSublayer(eye.circleLayer)
        view.layer.addSublayer(eye.starLayer)
        view.layer.addSublayer(eye.pupilLayer)
        let block = UIView(frame: CGRect(x: 0, y: screenH, width: screenW, height: screenW/2))
        block.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        view.addSubview(block)
        
        //title
        let title = UILabel()
        title.frame.size = CGSize(width: 300*ratioW, height: 400*ratioH)
        title.center = CGPoint(x: screenW/2, y: 200*ratioH)
        title.text = "Eye Watch"
        title.numberOfLines = 2
        title.textAlignment = .center
        title.font = UIFont(name: "Avenir-Heavy", size: 85*ratioW)
        title.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.addSubview(title)
        
        //start button
        start.frame.size = CGSize(width: screenW-60, height: 60)
        start.layer.cornerRadius = 25
        start.center = CGPoint(x: screenW/2, y: title.center.y+2*(screenH-(screenW/2)-title.center.y)/3)
        start.setTitle("Start", for: .normal)
        start.setTitleColor(#colorLiteral(red: 0.4, green: 0.7294117647, blue: 0.9607843137, alpha: 1), for: .normal)
        start.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 40)
        start.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        start.addTarget(self, action: #selector(MainVC.startDown), for: .touchDown)
        start.addTarget(self, action: #selector(MainVC.startUp), for: .touchUpInside)
        start.addTarget(self, action: #selector(MainVC.startCorrect), for: .touchUpOutside)
        view.addSubview(start)
        
    }
    
    @objc func startDown() {
        start.backgroundColor = #colorLiteral(red: 0.9473403096, green: 0.9403244853, blue: 0.9527093768, alpha: 1)
    }
    
    @objc func startUp() {
        start.backgroundColor = #colorLiteral(red: 0.9952836633, green: 0.9879123569, blue: 1, alpha: 1)
        
        present(GameSelectVC(), animated: true)
        
    }
    
    @objc func startCorrect() {
        start.backgroundColor = #colorLiteral(red: 0.9952836633, green: 0.9879123569, blue: 1, alpha: 1)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

