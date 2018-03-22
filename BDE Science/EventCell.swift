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

    @IBOutlet weak var eventButton: UIButton!

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var deskLabel: UILabel!
    @IBOutlet weak var lieuLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var event: Evenement!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func imageClicked(_ sender: Any) {
        UIApplication.tryURL([event.url])
    }
    
    func updateUI(event: Evenement){
        self.event = event
        nameLabel.text = event.nom
        deskLabel.text = event.description
        lieuLabel.text = event.lieu
        dateLabel.text = event.date
        deskLabel.adjustsFontSizeToFitWidth = true
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
                self.eventButton.setBackgroundImage(image, for: .normal)
                //self.eventButton.setImage(image, for: .normal)
            }
            
        }
    }

}
