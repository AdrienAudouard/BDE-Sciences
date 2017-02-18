//
//  EventCell.swift
//  BDE Science
//
//  Created by Adrien Audouard on 02/02/2017.
//  Copyright © 2017 Adrien Audouard. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire

class EventCell: UITableViewCell {

    @IBOutlet weak var eventIMG: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var deskLabel: UILabel!
    @IBOutlet weak var lieuLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(event: Evenement){
        nameLabel.text = event.nom
        deskLabel.text = event.description
        lieuLabel.text = event.lieu
        dateLabel.text = event.date
        
        let dateTimeFormatter = DateFormatter()
        dateTimeFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let date = dateTimeFormatter.date(from: event.date)
        
        dateTimeFormatter.dateFormat = "dd MMMM"
        let jour = dateTimeFormatter.string(from: date!)
        
        dateTimeFormatter.dateFormat = "HH:mm"
        let heure = dateTimeFormatter.string(from: date!)
        
        dateLabel.text = "\(jour) à \(heure)"
        
        Alamofire.request(event.image).responseImage{ response in
            if let image = response.result.value {
                self.eventIMG.image = image
            }
            
        }
    }

}
