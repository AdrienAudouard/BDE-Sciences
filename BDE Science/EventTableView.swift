//
//  EventTableView.swift
//  BDE Science
//
//  Created by Adrien Audouard on 01/02/2017.
//  Copyright © 2017 Adrien Audouard. All rights reserved.
//

import UIKit

class EventTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    private var _datas = [Evenement]()
    
    var datas: [Evenement]{
        get {
            return self._datas
        } set {
            self._datas = newValue
            self.reloadData()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.delegate = self
        self.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as? EventCell {
            cell.updateUI(event: datas[indexPath.row])
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
