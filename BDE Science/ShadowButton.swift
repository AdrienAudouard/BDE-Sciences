//
//  ShadowButton.swift
//  BDE Science
//
//  Created by Adrien Audouard on 31/01/2017.
//  Copyright © 2017 Adrien Audouard. All rights reserved.
//

import UIKit

@IBDesignable
class ShadowButton: UIButton {

    override func draw(_ rect: CGRect) {
        // Drawing code
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 1;
        self.layer.shadowRadius = 2;
        self.layer.shadowOffset = CGSize(width: 0, height: 3.0)
        //self.imageEdgeInsets = UIEdgeInsetsMake(20, 20, 0, 20)
        
        self.imageView?.contentMode = .scaleAspectFit
    }
 

}
