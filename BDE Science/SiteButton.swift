//
//  SiteButton.swift
//  BDE Science
//
//  Created by Adrien Audouard on 01/02/2017.
//  Copyright © 2017 Adrien Audouard. All rights reserved.
//

import UIKit

class SiteButton: UIButton {

    private var urls = ["https://www.bdesciences.com"]
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addTarget(self, action: #selector(openSiteAction), for: .touchUpInside)
    }
    
    func openSiteAction(sender: UIButton){
        UIApplication.tryURL(urls: urls)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
