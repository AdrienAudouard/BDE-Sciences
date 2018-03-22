//
//  ContactVC.swift
//  BDE Science
//
//  Created by Adrien Audouard on 06/02/2017.
//  Copyright © 2017 Adrien Audouard. All rights reserved.
//

import UIKit
import TextFieldEffects

class ContactVC: UIViewController {

    @IBOutlet weak var nomLabel: HoshiTextField!
    @IBOutlet weak var emailLabel: HoshiTextField!
    @IBOutlet weak var messageLabel: UITextView!
    
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
    
    
    @IBAction func envoyerButtonPressed(_ sender: Any) {
        if nomLabel.text?.characters.count == 0 || emailLabel.text?.characters.count == 0 || messageLabel.text.characters.count == 0 {
            let alert = UIAlertController(title: "Merci de remplir tous les champs !", message: "Remplis tous les champs petite feignasse.\nLa bise 😘", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Désolé Chef", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            let connectDB = ConnectDB()
            connectDB.sendEmail(contactVC: self)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func tuer(){
        let alert = UIAlertController(title: "Message envoyé", message: "Bien joué ça !", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: {
            (action: UIAlertAction!) -> Void in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
