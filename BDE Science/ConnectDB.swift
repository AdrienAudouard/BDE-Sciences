//
//  ConnectDB.swift
//  BDE Science
//
//  Created by Adrien Audouard on 01/02/2017.
//  Copyright © 2017 Adrien Audouard. All rights reserved.
//

import Foundation
import Alamofire

class ConnectDB{
    let url = "http://julienattard.fr/projects/BDESciences/webservices.php"
    
    func getEvents(eventVC: EventVC){
        let parameter = ["type": "events"]
        Alamofire.request(url, method: .post, parameters: parameter).responseJSON { response in
            if let JSON = response.result.value as? [String: Any] {
                let events = JSON["events"] as? [NSDictionary]
                var eventList = [Evenement]()
                
                for event in events! {
                    let nom = event["nom"] as! String
                    let lieu = event["lieu"] as! String
                    let date = event["date"] as! String
                    let description = event["description"] as! String
                    let image = event["image"] as! String
                    let url = event["lienfb"] as! String
                                        
                    let evenement = Evenement(nom: nom, lieu: lieu, date: date, description: description, image: image, url: url)
                    eventList.append(evenement)
                }
                
                eventVC.updateVC(listeEvent: eventList)
                eventVC.hideLoadingView()
            }
        }
    }
    
    func getPartenaire(sponsorsVC: SponsorsVC){
        let parameter = ["type": "partenaires"]
        
        Alamofire.request(url, method: .post, parameters: parameter).responseJSON { response in
            if let JSON = response.result.value as? NSDictionary {
                if let partenaires = JSON["partenaires"] as? [NSDictionary] {
                    var listePartenaires = [Partenaire]()
                    for part in partenaires {
                        if let categorie = part["categorie"] as? String {
                            if categorie == sponsorsVC.type {
                                let nom = part["nom"] as! String
                                let description = part["description"] as! String
                                let url = part["image"] as! String
                                
                                let partenaire = Partenaire(nom: nom, description: description, urlImage: url)
                                listePartenaires.append(partenaire)
                            }
                        }
                    }
                    sponsorsVC.listePartenaire = listePartenaires
                    sponsorsVC.tableView.reloadData()
                    sponsorsVC.hideLoadingView()
                }
            }
        }
    }
    
    func sendEmail(contactVC: ContactVC){
        let parameter = ["type": "contact", "nom" : "\(contactVC.nomLabel.text ?? "")", "email" : "\(contactVC.emailLabel.text ?? "")", "message" : "\(contactVC.messageLabel.text ?? "")"]
        
        Alamofire.request(url, method: .post, parameters: parameter).response { response in
            contactVC.tuer()
        }
        
    }
    
    func getMembreBDE(votreBDEVC: VotreBDEVC){
        let parameter = ["type" : "membres"]
        
        Alamofire.request(url,method: .post, parameters: parameter).responseJSON{ response in
            if let JSON = response.result.value as? [String: Any] {
                let membres = JSON["membres"] as? [NSDictionary]
                var membreListe = [MembreBDE]()
                
                for membre in membres! {
                    let nom = membre["nom"] as! String
                    let desc = membre["description"] as! String
                    let image = membre["image"] as! String
                    
                    let m = MembreBDE(nom: nom, desc: desc, profilImage: image)
                    membreListe.append(m)
                }
                
                votreBDEVC.updateVC(listeMembre: membreListe)
                votreBDEVC.hideLoadingView()
            }
        }
    }
    
}
