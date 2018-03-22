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

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func goToVC(identifier: String){
        let r = Reachability()
        
        if !r.isInternetAvailable(){
            let alert = UIAlertController(title: "Tu n'as pas de connexion internet ?", message: "Alors fais pas le gamin et active ta 4G stp 😘", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            performSegue(withIdentifier: identifier, sender: nil)
        }
    }
    
    @IBAction func pedagogieButtonPressed(_ sender: Any) {
        goToVC(identifier: "CalendarVC")
    }
    
    @IBAction func eventButtonPressed(_ sender: Any) {
        goToVC(identifier: "EventVC")
    }

    @IBAction func photosButtonPressed(_ sender: Any) {
        plusTard()
    }
    
    @IBAction func preventesButtonPressed(_ sender: Any) {
        plusTard()
    }
    
    @IBAction func creditButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "CreditVC", sender: nil)
    }
    
    @IBAction func membreBDEButtonPressed(_ sender: Any) {
        goToVC(identifier: "VotreBDEVC")
    }
    
    @IBAction func contactButtonPressed(_ sender: Any) {
        goToVC(identifier: "ContactVC")
    }
    
    @IBAction func partenaireButtonPressed(_ sender: Any) {
        goToVC(identifier: "SponsorsCatesVC")
    }
    
    func plusTard(){
        performSegue(withIdentifier: "SurpriseVC", sender: nil)
        /*
        let alert = UIAlertController(title: "Ca arrive bientôt frère ✋", message: "", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: {
            (action: UIAlertAction!) -> Void in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
         */
    }
}

