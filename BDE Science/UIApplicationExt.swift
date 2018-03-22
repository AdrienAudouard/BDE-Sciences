//
//  UIApplicationExt.swift
//  BDE Science
//
//  Created by Adrien Audouard on 01/02/2017.
//  Copyright © 2017 Adrien Audouard. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    class func tryURL(_ urls: [String]){
        let application = UIApplication.shared
        for url in urls{
            if application.canOpenURL(URL(string: url)!){
                if #available(iOS 10.0, *) {
                    application.open(URL(string: url)!)
                } else {
                    // Fallback on earlier versions
                    application.openURL(URL(string: url)!)
                }
                return
            }
        }
    }
}
