//
//  ScaleViewController.swift
//  weixinSwift
//
//  Created by 张杰 on 2020/6/7.
//  Copyright © 2020 张杰. All rights reserved.
//

import UIKit

class ScaleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let rect = CGRect(x: 0, y: 80, width: 320, height: 320)
        
        let imageView = UIImageView(frame: rect)
        
        let image = UIImage(named: "md")
        imageView.image = image
        imageView.isUserInteractionEnabled = true
        
        self.view.addSubview(imageView)
        
        let guesture = UIPinchGestureRecognizer(target: self, action: #selector(self.pickImage(_:)))
        imageView.addGestureRecognizer(guesture)
        
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func pickImage(_ recognize: UIPinchGestureRecognizer) {
        print(recognize.scale)
        recognize.view?.transform = (recognize.view?.transform.scaledBy(x: recognize.scale, y: recognize.scale))!
        recognize.scale = 1
    }

}
