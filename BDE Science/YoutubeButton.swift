//
//  YoutubeButton.swift
//  BDE Science
//
//  Created by Adrien Audouard on 01/02/2017.
//  Copyright © 2017 Adrien Audouard. All rights reserved.
//

import UIKit

class YoutubeButton: UIButton {
    
    private var urls = ["youtube://www.youtube.com/channel/UCvJZoOg9pcxKp3CUl5yGAMw", "https://www.youtube.com/channel/UCvJZoOg9pcxKp3CUl5yGAMw"]
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addTarget(self, action: #selector(openYTAction), for: .touchUpInside)
    }
    
    func openYTAction(sender: UIButton){
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
