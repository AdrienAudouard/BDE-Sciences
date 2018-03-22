//
//  BDECell.swift
//  BDE Science
//
//  Created by Adrien Audouard on 05/02/2017.
//  Copyright © 2017 Adrien Audouard. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class BDECell: UITableViewCell {

    @IBOutlet weak var nomLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var profilImgeView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(membre: MembreBDE){
        profilImgeView.clipsToBounds = true
        profilImgeView.layer.cornerRadius = profilImgeView.frame.size.width / 2
        nomLabel.text = membre.nom
        descLabel.text = membre.desc
        descLabel.adjustsFontSizeToFitWidth = true
        
        if membre.image == nil {
            Alamofire.request(membre.profilImage).responseImage{ response in
                if let image = response.result.value {
                    self.profilImgeView.image = image
                    membre.image = image
                }
                
            }
        } else {
            self.profilImgeView.image = membre.image
        }
        
        
    }

}
