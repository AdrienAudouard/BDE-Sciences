//
//  VotreBDEVC.swift
//  BDE Science
//
//  Created by Adrien Audouard on 05/02/2017.
//  Copyright © 2017 Adrien Audouard. All rights reserved.
//

import UIKit
import SpriteKit

class VotreBDEVC: UIViewController {
    private var _loadingView: LoadingView!
    
    @IBOutlet weak var membreTableView: BDETableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self._loadingView = LoadingView.loadFromNib(vc: self)
        showLoadingView()
        
        let connectDB = ConnectDB()
        connectDB.getMembreBDE(votreBDEVC: self)
        // Do any additional setup after loading the view.
        
        
    }
    
    func updateVC(listeMembre: [MembreBDE]){
        membreTableView.datas = listeMembre
    }
    
    func hideLoadingView(){
        self._loadingView.hide()
    }
    
    func showLoadingView(){
        self._loadingView.show()
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
