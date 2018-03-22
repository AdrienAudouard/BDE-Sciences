//
//  MembreBDE.swift
//  BDE Science
//
//  Created by Adrien Audouard on 05/02/2017.
//  Copyright © 2017 Adrien Audouard. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import AlamofireImage

class MembreBDE {
    private var _nom: String!
    private var _desc: String!
    private var _profilImage: String!
    private var _image: UIImage!
    
    var image: UIImage!{
        get {
            return self._image
        } set {
            self._image = newValue
        }
    }
    
    var nom: String {
        return self._nom
    }
    
    var desc: String {
        return self._desc
    }
    
    var profilImage: String {
        return self._profilImage
    }
    
    init(nom: String, desc: String, profilImage: String) {
        self._nom = nom
        self._desc = desc
        self._profilImage = "http://julienattard.fr/projects/BDESciences/images/membres/\(profilImage)"
    }
    
}
