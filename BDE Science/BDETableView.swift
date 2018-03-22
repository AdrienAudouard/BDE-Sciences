//
//  BDETableView.swift
//  BDE Science
//
//  Created by Adrien Audouard on 05/02/2017.
//  Copyright © 2017 Adrien Audouard. All rights reserved.
//

import UIKit

class BDETableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    private var _datas = [MembreBDE]()
    
    var datas: [MembreBDE]{
        get {
            return self._datas
        } set {
            self._datas = newValue
            self.reloadData()
        }
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.dataSource = self
        self.delegate = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MembreBDECell", for: indexPath) as? BDECell {
            cell.updateUI(membre: _datas[indexPath.row])
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
