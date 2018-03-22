//
//  MenuButton.swift
//  BDE Science
//
//  Created by Adrien Audouard on 05/02/2017.
//  Copyright © 2017 Adrien Audouard. All rights reserved.
//

import UIKit

@IBDesignable class MenuButton: ShadowButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private var textLabel: String = ""
    private var buttonImage: UIImage!
    
    @IBInspectable var text: String{
        get {
            return self.textLabel
        } set {
            self.textLabel = newValue
        }
    }
    
    @IBInspectable var image: UIImage{
        get {
            return self.buttonImage
        } set {
            self.buttonImage = newValue
        }
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        super.draw(rect)
        
        let imageWidth: CGFloat = 36.0
        let imageHeight:CGFloat = 36.0
        
        let imageX = rect.size.width / 2 - imageWidth / 2
        let imageY = rect.size.height / 2 - imageHeight / 2 - 10
        
        let labelWidth:CGFloat = self.frame.width - 20
        let labelHeight: CGFloat = 21
        
        let labelX = rect.size.width / 2 - labelWidth / 2
        let labelY = imageY + labelHeight + 15
        
        let view = UIView()
        view.frame = rect
        view.backgroundColor = UIColor.white
        view.isUserInteractionEnabled = false
        self.addSubview(view)
        
        
        let imageView = UIImageView(image: buttonImage)
        imageView.frame = CGRect(x: imageX, y: imageY, width: imageWidth, height: imageHeight)
        
        let label = UILabel()
        label.text = textLabel
        label.frame = CGRect(x: labelX, y: labelY, width: labelWidth, height: labelHeight)
        label.textAlignment = .center
        label.font = self.titleLabel?.font
        label.adjustsFontSizeToFitWidth = true
        
        if self.frame.width == 568 || self.frame.width == 480 {
            label.font = label.font.withSize(12.0)
        }
        
        view.addSubview(imageView)
        view.addSubview(label)
    }
 

}
