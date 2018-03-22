//
//  InstagramButton.swift
//  BDE Science
//
//  Created by Adrien Audouard on 01/02/2017.
//  Copyright © 2017 Adrien Audouard. All rights reserved.
//

import UIKit

class InstagramButton: UIButton {
    
    private var urls = ["instagram://user?username=bdesciences", "https://www.instagram.com/bdesciences"]
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addTarget(self, action: #selector(openInstaAction), for: .touchUpInside)
    }
    
    func openInstaAction(sender: UIButton){
        print("test")
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
