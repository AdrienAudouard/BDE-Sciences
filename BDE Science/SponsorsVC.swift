//
//  SponsorsVC.swift
//  BDE Science
//
//  Created by Adrien Audouard on 18/02/2017.
//  Copyright © 2017 Adrien Audouard. All rights reserved.
//

import UIKit
import SpriteKit

class SponsorsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var _type: String!
    private var _loadingView: LoadingView!
    
    var listePartenaire = [Partenaire]()
    
    @IBOutlet weak var tableView: UITableView!
    var type: String {
        get {
            return self._type
        } set {
            self._type = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false , animated: true)
        
        self._loadingView = LoadingView.loadFromNib(vc: self)
        showLoadingView()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let connectDB = ConnectDB()
        connectDB.getPartenaire(sponsorsVC: self)
        self.navigationItem.title = getTitle()
    }
    
    func getTitle() -> String{
        if _type == "festival" {
            return "Festivals"
        } else if _type == "nourritures" {
            return "Nourriture"
        } else if _type == "sportdivertissement" {
            return "Sports & Divertissements"
        } else if _type == "locomotion" {
            return "Transports"
        } else if _type == "barcaferestaurant" {
            return "Bars, Cafés, Restaurants"
        } else {
            return "Vie Etudiante"
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func hideLoadingView(){
        self._loadingView.hide()
    }
    
    func showLoadingView(){
        self._loadingView.show()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: PartenaireCell!
        
        if indexPath.row % 2 == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "PartenaireLeftCell", for: indexPath) as! PartenaireCell
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "PartenaireRightCell", for: indexPath) as! PartenaireCell
        }
        
        cell.updateUI(partenaire: listePartenaire[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listePartenaire.count
    }

}
