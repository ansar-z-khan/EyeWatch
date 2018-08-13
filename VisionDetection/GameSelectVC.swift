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
            wBack.frame.size = CGSize(width: screenW-60*ratioW, height: screenH-150)
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
            gBack.center = CGPoint(x: screenW/2, y: 60*ratioH+gBack.frame.size.height/2)
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
            follow.frame = CGRect(x: 50*ratioW, y: 90*ratioH+gBack.frame.size.height, width: wBack.frame.size.width-40*ratioW, height: (wBack.frame.size.height-120*ratioH-gBack.frame.size.height)/2)
        }
        follow.backgroundColor = #colorLiteral(red: 0.1882352941, green: 0.462745098, blue: 0.7058823529, alpha: 1)
        follow.layer.cornerRadius = 10
        follow.addTarget(self, action: #selector(GameSelectVC.followDown), for: .touchDown)
        follow.addTarget(self, action: #selector(GameSelectVC.followUp), for: .touchUpInside)
        follow.addTarget(self, action: #selector(GameSelectVC.followCorrect), for: .touchUpOutside)
        view.addSubview(follow)
        
        let followCirc = UIButton(frame: CGRect(x: follow.frame.minX+15*ratioW, y: follow.frame.minY+15*ratioW, width: follow.frame.size.height-30*ratioW, height: follow.frame.size.height-30*ratioW))
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
            focus.frame = CGRect(x: 50*ratioW, y: 120*ratioH+gBack.frame.size.height+follow.frame.size.height, width: wBack.frame.size.width-40*ratioW, height: (wBack.frame.size.height-120*ratioH-gBack.frame.size.height)/2)
            
        }
        focus.backgroundColor = #colorLiteral(red: 0.1882352941, green: 0.462745098, blue: 0.7058823529, alpha: 1)
        focus.layer.cornerRadius = 10
        focus.addTarget(self, action: #selector(GameSelectVC.focusDown), for: .touchDown)
        focus.addTarget(self, action: #selector(GameSelectVC.focusUp), for: .touchUpInside)
        focus.addTarget(self, action: #selector(GameSelectVC.focusCorrect), for: .touchUpOutside)
        view.addSubview(focus)
        
        let focusCirc = UIButton(frame: CGRect(x: focus.frame.minX+15*ratioW, y: focus.frame.minY+15*ratioW, width: focus.frame.size.height-30*ratioW, height: focus.frame.size.height-30*ratioW))
        focusCirc.layer.cornerRadius = focusCirc.frame.size.width/2
        focusCirc.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.3019607843, blue: 0.4862745098, alpha: 1)
        focusCirc.addTarget(self, action: #selector(GameSelectVC.focusDown), for: .touchDown)
        focusCirc.addTarget(self, action: #selector(GameSelectVC.focusUp), for: .touchUpInside)
        focusCirc.addTarget(self, action: #selector(GameSelectVC.focusCorrect), for: .touchUpOutside)
        view.addSubview(focusCirc)
        
        let width = focusCirc.frame.size.width
        let phone = UIBezierPath()
        let phoneLayer = CAShapeLayer()
        let ratioCirc: CGFloat = followCirc.frame.size.width/(316/3)
        
        phone.move(to: CGPoint(x: 7*width/18, y: 8*ratioCirc))
        phone.addArc(withCenter: CGPoint(x: 7*width/18+2*ratioCirc, y: 8*ratioCirc), radius: 2*ratioCirc, startAngle: CGFloat.pi, endAngle: 3*CGFloat.pi/2, clockwise: true)
        phone.addLine(to: CGPoint(x: 11*width/18-2*ratioCirc, y: 6*ratioCirc))
        phone.addArc(withCenter: CGPoint(x: 11*width/18-2*ratioCirc, y: 8*ratioCirc), radius: 2*ratioCirc, startAngle: 3*CGFloat.pi/2, endAngle: 0, clockwise: true)
        phone.addLine(to: CGPoint(x: 11*width/18, y: 44*ratioCirc))
        phone.addArc(withCenter: CGPoint(x: 11*width/18-2*ratioCirc, y: 44*ratioCirc), radius: 2*ratioCirc, startAngle: 0, endAngle: CGFloat.pi/2, clockwise: true)
        phone.addLine(to: CGPoint(x: width/2, y: 46*ratioCirc))
        phone.addLine(to: CGPoint(x: width/2, y: 44*ratioCirc))
        phone.addArc(withCenter: CGPoint(x: width/2, y: 43*ratioCirc), radius: 1*ratioCirc, startAngle: CGFloat.pi/2, endAngle: 3*CGFloat.pi/2, clockwise: false)
        phone.addLine(to: CGPoint(x: width/2, y: 40*ratioCirc))
        phone.addLine(to: CGPoint(x: 11*width/18-2*ratioCirc, y: 40*ratioCirc))
        phone.addLine(to: CGPoint(x: 11*width/18-2*ratioCirc, y: 12*ratioCirc))
        phone.addLine(to: CGPoint(x: 7*width/18+2*ratioCirc, y: 12*ratioCirc))
        phone.addLine(to: CGPoint(x: 7*width/18+2*ratioCirc, y: 40*ratioCirc))
        phone.addLine(to: CGPoint(x: width/2, y: 40*ratioCirc))
        phone.addLine(to: CGPoint(x: width/2, y: 42*ratioCirc))
        phone.addArc(withCenter: CGPoint(x: width/2, y: 43*ratioCirc), radius: 1*ratioCirc, startAngle: 3*CGFloat.pi/2, endAngle: CGFloat.pi/2, clockwise: false)
        phone.addLine(to: CGPoint(x: width/2, y: 46*ratioCirc))
        phone.addLine(to: CGPoint(x: 7*width/18+2*ratioCirc, y: 46*ratioCirc))
        phone.addArc(withCenter: CGPoint(x: 7*width/18+2*ratioCirc, y: 44*ratioCirc), radius: 2*ratioCirc, startAngle: CGFloat.pi/2, endAngle: CGFloat.pi, clockwise: true)
        phone.close()
        
        let bigArrow = UIBezierPath()
        let bigArrowLayer = CAShapeLayer()
        
        phoneLayer.fillColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        phoneLayer.path = phone.cgPath
        //316/3
        bigArrow.move(to: CGPoint(x: 3*width/8, y: 52*ratioCirc))
        bigArrow.addLine(to: CGPoint(x: 5*width/8, y: 52*ratioCirc))
        bigArrow.addLine(to: CGPoint(x: 19*width/32, y: 82*ratioCirc))
        bigArrow.addLine(to: CGPoint(x: 11*width/16, y: 82*ratioCirc))
        bigArrow.addLine(to: CGPoint(x: width/2, y: 100*ratioCirc))
        bigArrow.addLine(to: CGPoint(x: 5*width/16, y: 82*ratioCirc))
        bigArrow.addLine(to: CGPoint(x: 13*width/32, y: 82*ratioCirc))
        bigArrow.close()
        
        bigArrowLayer.fillColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        bigArrowLayer.path = bigArrow.cgPath
        
        focusCirc.layer.addSublayer(bigArrowLayer)
        focusCirc.layer.addSublayer(phoneLayer)
        
        let shift: CGFloat = 8/3
        let a1 = Arrow(start: CGPoint(x: 14*ratioCirc, y: (36+shift)*ratioCirc), end: CGPoint(x: 50*ratioCirc, y: (36+shift)*ratioCirc), thickness: 2*ratioCirc)
        let a2 = Arrow(start: CGPoint(x: 14*ratioCirc, y: (64+shift)*ratioCirc), end: CGPoint(x: 50*ratioCirc, y: (64+shift)*ratioCirc), thickness: 2*ratioCirc)
        let a3 = Arrow(start: CGPoint(x: 7*ratioCirc, y: (50+shift)*ratioCirc), end: CGPoint(x: 37*ratioCirc, y: (50+shift)*ratioCirc), thickness: 2*ratioCirc)
        let a4 = Arrow(start: CGPoint(x: 50*ratioCirc, y: (50+shift)*ratioCirc), end: CGPoint(x: 90*ratioCirc, y: (50+shift)*ratioCirc), thickness: 2*ratioCirc)
        let a5 = Arrow(start: CGPoint(x: 20*ratioCirc, y: (22+shift)*ratioCirc), end: CGPoint(x: 35*ratioCirc, y: (22+shift)*ratioCirc), thickness: 2*ratioCirc)
        let a6 = Arrow(start: CGPoint(x: 20*ratioCirc, y: (78+shift)*ratioCirc), end: CGPoint(x: 35*ratioCirc, y: (78+shift)*ratioCirc), thickness: 2*ratioCirc)
        let a7 = Arrow(start: CGPoint(x: 63*ratioCirc, y: (36+shift)*ratioCirc), end: CGPoint(x: 85*ratioCirc, y: (36+shift)*ratioCirc), thickness: 2*ratioCirc)
        let a8 = Arrow(start: CGPoint(x: 63*ratioCirc, y: (64+shift)*ratioCirc), end: CGPoint(x: 85*ratioCirc, y: (64+shift)*ratioCirc), thickness: 2*ratioCirc)
        let a9 = Arrow(start: CGPoint(x: 48*ratioCirc, y: (22+shift)*ratioCirc), end: CGPoint(x: 78*ratioCirc, y: (22+shift)*ratioCirc), thickness: 2*ratioCirc)
        let a10 = Arrow(start: CGPoint(x: 48*ratioCirc, y: (78+shift)*ratioCirc), end: CGPoint(x: 78*ratioCirc, y: (78+shift)*ratioCirc), thickness: 2*ratioCirc)
        
        followCirc.layer.addSublayer(a1.layer)
        followCirc.layer.addSublayer(a2.layer)
        followCirc.layer.addSublayer(a3.layer)
        followCirc.layer.addSublayer(a4.layer)
        followCirc.layer.addSublayer(a5.layer)
        followCirc.layer.addSublayer(a6.layer)
        followCirc.layer.addSublayer(a7.layer)
        followCirc.layer.addSublayer(a8.layer)
        followCirc.layer.addSublayer(a9.layer)
        followCirc.layer.addSublayer(a10.layer)
        
        let followTitle = UILabel(frame: CGRect(x: width+30*ratioW, y: 15*ratioH, width: follow.frame.size.width-width-45*ratioW, height: follow.frame.size.height-30*ratioH))
        followTitle.text = "Follow the Dot"
        followTitle.numberOfLines = 2
        followTitle.font = UIFont(name: "Avenir-Heavy", size: 20*ratioW)
        followTitle.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        follow.addSubview(followTitle)
        
        let focusTitle = UILabel(frame: CGRect(x: width+30*ratioW, y: 15*ratioH, width: follow.frame.size.width-width-45*ratioW, height: follow.frame.size.height-30*ratioH))
        focusTitle.text = "Focus on the Dot"
        //focusTitle.textAlignment = .center
        focusTitle.numberOfLines = 2
        focusTitle.font = UIFont(name: "Avenir-Heavy", size: 20*ratioW)
        focusTitle.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        focusTitle.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        focus.addSubview(focusTitle)
        
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
        let vc = FollowInstructionsVC()
        vc.inGame = false
        present(vc, animated: true)
    }
    
    @objc func followCorrect() {
        follow.backgroundColor = #colorLiteral(red: 0.1882352941, green: 0.462745098, blue: 0.7058823529, alpha: 1)
    }
    
    @objc func focusDown() {
        focus.backgroundColor = #colorLiteral(red: 0.161209166, green: 0.4042278528, blue: 0.6261845231, alpha: 1)
    }
    
    @objc func focusUp() {
        focus.backgroundColor = #colorLiteral(red: 0.1882352941, green: 0.462745098, blue: 0.7058823529, alpha: 1)
        let vc = FocusInstructionsVC()
        vc.inGame = false
        present(vc, animated: true)
    }
    
    @objc func focusCorrect() {
        focus.backgroundColor = #colorLiteral(red: 0.1882352941, green: 0.462745098, blue: 0.7058823529, alpha: 1)
    }
}
