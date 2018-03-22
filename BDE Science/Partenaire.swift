//
//  Partenaire.swift
//  BDE Science
//
//  Created by Adrien Audouard on 18/02/2017.
//  Copyright © 2017 Adrien Audouard. All rights reserved.
//

import Foundation

class Partenaire{
    private var _nom: String!
    private var _descrition: String!
    private var _urlImage: String!
    
    var nom: String {
        return self._nom
    }
    
    var description: String{
        return self._descrition
    }
    
    var urlImage: String{
        return self._urlImage
    }
    
    init(nom: String, description: String, urlImage: String) {
        self._nom = nom
        self._descrition = description
        self._urlImage = "http://julienattard.fr/projects/BDESciences/images/partenaires/\(urlImage)"
    }
}
