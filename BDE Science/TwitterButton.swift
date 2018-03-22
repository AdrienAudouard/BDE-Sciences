//
//  TwitterButton.swift
//  BDE Science
//
//  Created by Adrien Audouard on 01/02/2017.
//  Copyright © 2017 Adrien Audouard. All rights reserved.
//

import UIKit

class TwitterButton: UIButton {

    private var urls = ["twitter://user?screen_name=bdesciences", "https://twitter.com/bdesciences?lang=fr"]
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addTarget(self, action: #selector(openTwitterAction), for: .touchUpInside)
    }
    
    func openTwitterAction(sender: UIButton){
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
