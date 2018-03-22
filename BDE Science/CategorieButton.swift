//
//  CategorieButton.swift
//  BDE Science
//
//  Created by Adrien Audouard on 18/02/2017.
//  Copyright © 2017 Adrien Audouard. All rights reserved.
//

import UIKit

@IBDesignable
class CategorieButton: UIButton {

    @IBInspectable var imageButton: UIImage!
    @IBInspectable var textButton: String!
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let imageView = UIImageView()
        imageView.image = imageButton
        imageView.frame = CGRect(x: 25, y: rect.size.height / 2 - 25, width: 50, height: 50)
        
        let label = UILabel()
        label.text = textButton
        
        label.frame = CGRect(x: 85, y: rect.size.height / 2 - 25, width: rect.size.width - 85, height: 50)
        label.font = self.titleLabel?.font
        label.adjustsFontSizeToFitWidth = true
        self.addSubview(imageView)
        self.addSubview(label)
    }
 

}
