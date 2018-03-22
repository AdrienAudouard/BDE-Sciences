//
//  PartenaireCell.swift
//  BDE Science
//
//  Created by Adrien Audouard on 18/02/2017.
//  Copyright © 2017 Adrien Audouard. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire

class PartenaireCell: UITableViewCell {

    @IBOutlet weak var nomLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var partenaireImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(partenaire: Partenaire){
        nomLabel.text = partenaire.nom
        descriptionLabel.text = partenaire.description
        
        descriptionLabel.adjustsFontSizeToFitWidth = true
        nomLabel.adjustsFontSizeToFitWidth = true
        
        Alamofire.request(partenaire.urlImage).responseImage{ response in
            if let image = response.result.value {
                self.partenaireImage.image = image
            }
            
        }
    }

}
