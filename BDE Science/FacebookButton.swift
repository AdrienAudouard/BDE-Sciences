//
//  FacebookButton.swift
//  BDE Science
//
//  Created by Adrien Audouard on 01/02/2017.
//  Copyright © 2017 Adrien Audouard. All rights reserved.
//

import UIKit

class FacebookButton: UIButton {

    private var urls = ["fb://profile/794579427253342", "https://www.facebook.com/bde.sciences.nice"]
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addTarget(self, action: #selector(openFacebookAction), for: .touchUpInside)
    }
    
    func openFacebookAction(sender: UIButton){
        UIApplication.tryURL(urls)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
