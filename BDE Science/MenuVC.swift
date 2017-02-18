//
//  ViewController.swift
//  BDE Science
//
//  Created by Adrien Audouard on 31/01/2017.
//  Copyright © 2017 Adrien Audouard. All rights reserved.
//

import UIKit

class MenuVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func eventButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "EventVC", sender: nil)
    }

    @IBAction func membreBDEButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "VotreBDEVC", sender: nil)
    }
    @IBAction func contactButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "ContactVC", sender: nil)
    }
}

