//
//  Evenement.swift
//  BDE Science
//
//  Created by Adrien Audouard on 01/02/2017.
//  Copyright © 2017 Adrien Audouard. All rights reserved.
//

import Foundation

class Evenement{
    private var _nom:String
    private var _lieu: String
    private var _date: String
    private var _description: String
    private var _image: String
    
    var nom: String {
        return self._nom
    }
    
    var lieu: String {
        return self._lieu
    }
    
    var date: String {
        return self._date
    }
    
    var description: String {
        return self._description
    }
    
    var image: String {
        return self._image
    }
    
    init(nom: String, lieu: String, date: String, description: String, image: String) {
        self._nom = nom
        self._lieu = lieu
        self._date = date
        self._description = description
        self._image = "http://julienattard.fr/projects/BDESciences/images/events/\(image)"
    }

}
