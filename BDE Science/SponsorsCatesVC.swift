//
//  SponsorsCatesVC.swift
//  BDE Science
//
//  Created by Adrien Audouard on 18/02/2017.
//  Copyright © 2017 Adrien Audouard. All rights reserved.
//

import UIKit

class SponsorsCatesVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setNavigationBarHidden(false , animated: true)
        
        let r = Reachability()
        
        if !r.isInternetAvailable(){
            let alert = UIAlertController(title: "Tu n'as pas de connexion internet ?", message: "Alors fais pas le gamin et active ta 4G stp 😘", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: {
                (action: UIAlertAction!) -> Void in
                self.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func festivalButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "SponsorsVC", sender: "festival")
    }

    @IBAction func nourritureButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "SponsorsVC", sender: "nourriture")
    }
    
    @IBAction func sportButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "SponsorsVC", sender: "sportdivertissement")
    }
    
    @IBAction func transportButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "SponsorsVC", sender: "locomotion")
    }
    
    @IBAction func barButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "SponsorsVC", sender: "barcaferestaurant")
    }
    
    @IBAction func studentButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "SponsorsVC", sender: "vieetudiante")
    }
    
    
    @IBAction func bonPlansButtonPressed(_ sender: Any) {
        let urls = ["fb://profile/371218803227144", "https://www.facebook.com/bonsplansdubdesciences"]
        UIApplication.tryURL(urls)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if let destination = segue.destination as? SponsorsVC {
            if let type = sender as? String {
                destination.type = type
                
            }
        }
    }
 

}
