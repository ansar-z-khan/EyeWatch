//
//  GameSelectVC.swift
//  Eye Watch
//
//  Created by Dean Louizos on 2018-08-09.
//  Copyright © 2018 Dean Louizos. All rights reserved.
//

import Foundation
import UIKit

class GameSelectVC: UIViewController {
    
    let back = UIButton()
    let follow = UIButton()
    let focus = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modalTransitionStyle = .flipHorizontal
        
        //useful variables
        let screenW = self.view.frame.size.width
        let screenH = self.view.frame.size.height
        let ratioW = self.view.frame.size.width/414
        let ratioH = self.view.frame.size.height/736
        print(ratioH)
        
        //gradient
        let gradient = CAGradientLayer()
        gradient.frame = self.view.frame
        gradient.colors = [UIColor(cgColor: #colorLiteral(red: 0.1137254902, green: 0.3019607843, blue: 0.4862745098, alpha: 1)).cgColor, UIColor(cgColor: #colorLiteral(red: 0.4, green: 0.7294117647, blue: 0.9607843137, alpha: 1)).cgColor]
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
        back.addTarget(self, action: #selector(GameSelectVC.backDown), for: .touchDown)
        back.addTarget(self, action: #selector(GameSelectVC.backUp), for: .touchUpInside)
        back.addTarget(self, action: #selector(GameSelectVC.backCorrect), for: .touchUpOutside)
        view.addSubview(back)
        
        //white back
        let wBack = UIView()
        if screenH == 812 {
            wBack.frame = CGRect(x: 30, y: 60, width: screenW-60, height: screenH-180)
        } else {
            wBack.frame.size = CGSize(width: screenW-60, height: screenH-150)
            wBack.center = CGPoint(x: screenW/2, y: (screenH-90)/2)
        }
        wBack.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.addSubview(wBack)
        
        //gradient header
        let gBack = UIView()
        gBack.frame.size = CGSize(width: wBack.frame.size.width, height: wBack.frame.size.height/3)
        if screenH == 812 {
            gBack.center = CGPoint(x: screenW/2, y: 90+gBack.frame.size.height/2)
        } else {
            gBack.center = CGPoint(x: screenW/2, y: 60+gBack.frame.size.height/2)
        }
        
        
        let grad = CAGradientLayer()
        grad.frame = CGRect(x: 0, y: 0, width: gBack.frame.size.width, height: gBack.frame.size.height)
        grad.colors = [UIColor(cgColor: #colorLiteral(red: 0.4, green: 0.7294117647, blue: 0.9607843137, alpha: 1)).cgColor, UIColor(cgColor: #colorLiteral(red: 0.1882352941, green: 0.462745098, blue: 0.7058823529, alpha: 1)).cgColor]
        grad.startPoint = CGPoint(x: 0, y: 0)
        gBack.layer.insertSublayer(grad, at: 0)
        view.addSubview(gBack)
        
        let title = UILabel()
        title.frame = gBack.frame
        title.text = "Game Select:"
        title.font = UIFont(name: "Avenir-Heavy", size: 35*ratioW)
        title.textAlignment = .center
        title.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.addSubview(title)
        
        //follow button
        if screenH == 812 {
            follow.frame = CGRect(x: 50, y: 120+gBack.frame.size.height, width: wBack.frame.size.width-40, height: (wBack.frame.size.height-120-gBack.frame.size.height)/2)
        } else {
            follow.frame = CGRect(x: 50, y: 90+gBack.frame.size.height, width: wBack.frame.size.width-40, height: (wBack.frame.size.height-120-gBack.frame.size.height)/2)
        }
        follow.backgroundColor = #colorLiteral(red: 0.1882352941, green: 0.462745098, blue: 0.7058823529, alpha: 1)
        follow.layer.cornerRadius = 10
        follow.addTarget(self, action: #selector(GameSelectVC.followDown), for: .touchDown)
        follow.addTarget(self, action: #selector(GameSelectVC.followUp), for: .touchUpInside)
        follow.addTarget(self, action: #selector(GameSelectVC.followCorrect), for: .touchUpOutside)
        view.addSubview(follow)
        
        let followCirc = UIButton(frame: CGRect(x: follow.frame.minX+15, y: follow.frame.minY+15, width: follow.frame.size.height-30, height: follow.frame.size.height-30))
        followCirc.layer.cornerRadius = followCirc.frame.size.width/2
        followCirc.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.3019607843, blue: 0.4862745098, alpha: 1)
        followCirc.addTarget(self, action: #selector(GameSelectVC.followDown), for: .touchDown)
        followCirc.addTarget(self, action: #selector(GameSelectVC.followUp), for: .touchUpInside)
        followCirc.addTarget(self, action: #selector(GameSelectVC.followCorrect), for: .touchUpOutside)
        view.addSubview(followCirc)
        
        //focus button
        if screenH == 812 {
            focus.frame = CGRect(x: 50, y: 150+gBack.frame.size.height+follow.frame.size.height, width: wBack.frame.size.width-40, height: (wBack.frame.size.height-120-gBack.frame.size.height)/2)
            
        } else {
            focus.frame = CGRect(x: 50, y: 120+gBack.frame.size.height+follow.frame.size.height, width: wBack.frame.size.width-40, height: (wBack.frame.size.height-120-gBack.frame.size.height)/2)
            
        }
        focus.backgroundColor = #colorLiteral(red: 0.1882352941, green: 0.462745098, blue: 0.7058823529, alpha: 1)
        focus.layer.cornerRadius = 10
        focus.addTarget(self, action: #selector(GameSelectVC.focusDown), for: .touchDown)
        focus.addTarget(self, action: #selector(GameSelectVC.focusUp), for: .touchUpInside)
        focus.addTarget(self, action: #selector(GameSelectVC.focusCorrect), for: .touchUpOutside)
        view.addSubview(focus)
        
        let focusCirc = UIButton(frame: CGRect(x: focus.frame.minX+15, y: focus.frame.minY+15, width: focus.frame.size.height-30, height: focus.frame.size.height-30))
        focusCirc.layer.cornerRadius = focusCirc.frame.size.width/2
        focusCirc.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.3019607843, blue: 0.4862745098, alpha: 1)
        focusCirc.addTarget(self, action: #selector(GameSelectVC.focusDown), for: .touchDown)
        focusCirc.addTarget(self, action: #selector(GameSelectVC.focusUp), for: .touchUpInside)
        focusCirc.addTarget(self, action: #selector(GameSelectVC.focusCorrect), for: .touchUpOutside)
        view.addSubview(focusCirc)
        
        //fix eye class bottom circle visible on flip
        //make arrows
        //make buttons work
        //add labels to buttons
        //start animations
        
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
    
    @objc func followDown() {
        follow.backgroundColor =  #colorLiteral(red: 0.1561952829, green: 0.3909984231, blue: 0.6056959629, alpha: 1)
    }
    
    @objc func followUp() {
        follow.backgroundColor = #colorLiteral(red: 0.1882352941, green: 0.462745098, blue: 0.7058823529, alpha: 1)
        present(FollowInstructionsVC(), animated: true)
    }
    
    @objc func followCorrect() {
        follow.backgroundColor = #colorLiteral(red: 0.1882352941, green: 0.462745098, blue: 0.7058823529, alpha: 1)
    }
    
    @objc func focusDown() {
        focus.backgroundColor = #colorLiteral(red: 0.161209166, green: 0.4042278528, blue: 0.6261845231, alpha: 1)
    }
    
    @objc func focusUp() {
        focus.backgroundColor = #colorLiteral(red: 0.1882352941, green: 0.462745098, blue: 0.7058823529, alpha: 1)
        //present(
    }
    
    @objc func focusCorrect() {
        focus.backgroundColor = #colorLiteral(red: 0.1882352941, green: 0.462745098, blue: 0.7058823529, alpha: 1)
    }
}

