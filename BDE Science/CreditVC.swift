//
//  CreditVC.swift
//  BDE Science
//
//  Created by Adrien Audouard on 20/02/2017.
//  Copyright © 2017 Adrien Audouard. All rights reserved.
//

import UIKit

class CreditVC: UIViewController {

    @IBOutlet weak var imageViewJulien: UIImageView!
    @IBOutlet weak var imageViewAdrien: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageViewAdrien.clipsToBounds = true
        imageViewAdrien.layer.cornerRadius = imageViewAdrien.frame.size.width / 2
        
        imageViewJulien.clipsToBounds = true
        imageViewJulien.layer.cornerRadius = imageViewJulien.frame.size.width / 2
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func linkedInAdrienPressed(_ sender: Any) {
        let urls = ["linkedin://profile/7a1780133", "https://www.linkedin.com/in/adrien-audouard-7a1780133/"]
        UIApplication.tryURL( urls)
    }
    
    @IBAction func siteWebAdrienPressed(_ sender: Any) {
        let urls = ["http://www.adrienaudouard.fr"]
        UIApplication.tryURL( urls)
    }
    
    @IBAction func facebookAdrienPressed(_ sender: Any) {
        let urls = ["fb://profile/100006179713575", "https://www.facebook.com/adrien.audouard06"]
        UIApplication.tryURL( urls)
    }
    
    @IBAction func facebookJulienPressed(_ sender: Any) {
        let urls = ["fb://profile/549332232", "https://www.facebook.com/JuulienAttard"]
        UIApplication.tryURL( urls)
    }
    
    @IBAction func siteWebJulienPressed(_ sender: Any) {
        let urls = ["https://www.julienattard.fr"]
        UIApplication.tryURL(urls)
    }
    
    
    @IBAction func linkedInJulienPressed(_ sender: Any) {
        
        let urls = ["linkedin://profile/70003a107", "https://www.linkedin.com/in/julien-attard-70003a107/"]
        UIApplication.tryURL(urls)
    }
    
}
