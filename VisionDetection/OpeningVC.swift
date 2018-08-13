//
//  OpeningVC.swift
//  Eye Watch
//
//  Created by Dean Louizos on 2018-08-13.
//  Copyright © 2018 Dean Louizos. All rights reserved.
//

import Foundation
import UIKit

class OpeningVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let background = UIView(frame: self.view.frame)
        background.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.9764705882, blue: 0.9960784314, alpha: 1)
        view.addSubview(background)
        
        let image = UIImageView(image: #imageLiteral(resourceName: "PDFtoJPG.me-1-2 2"))
        image.contentMode = .scaleAspectFit
        image.frame.size = CGSize(width: self.view.frame.size.width-36, height: self.view.frame.height-136-157)
        image.center = CGPoint(x: self.view.center.x, y: self.view.center.y)
        view.addSubview(image)
        
        let timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(OpeningVC.fade), userInfo: nil, repeats: false)
        print(timer)
    }
    @objc func fade() {
        present(MainVC(), animated: true)
    }
}
