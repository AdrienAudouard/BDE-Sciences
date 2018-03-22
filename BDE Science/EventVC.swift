//
//  EventVC.swift
//  BDE Science
//
//  Created by Adrien Audouard on 01/02/2017.
//  Copyright © 2017 Adrien Audouard. All rights reserved.
//

import UIKit
import SpriteKit

class EventVC: UIViewController {

    @IBOutlet weak var eventTV: EventTableView!
    private var _loadingView: LoadingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self._loadingView = LoadingView.loadFromNib(vc: self)
        showLoadingView()
        
        let connectDB = ConnectDB()
        connectDB.getEvents(eventVC: self)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setNavigationBarHidden(false , animated: true)
    }
    
    func updateVC(listeEvent: [Evenement]){
        eventTV.datas = listeEvent
    }
    
    func hideLoadingView(){
        self._loadingView.hide()
    }
    
    func showLoadingView(){
        self._loadingView.show()
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
