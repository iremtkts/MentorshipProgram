//
//  PharmacyTableViewCell.swift
//  DutyPharmacy
//
//  Created by iremt on 14.04.2023.
//

import UIKit

class PharmacyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pharmacyNameTextLabel: UILabel!
    @IBOutlet weak var districtNameTextLabel: UILabel!
    @IBOutlet weak var addressTextLabel: UILabel!
    
    
    var pharmacy : Pharmacy?
    var onShowOnMapClicked: ((Pharmacy) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    /* func configure(with pharmacy: Pharmacy) {
     self.pharmacy = pharmacy
     pharmacyNameTextLabel?.text = pharmacy.name
     districtNameTextLabel?.text = pharmacy.dist
     addressTextLabel?.text = pharmacy.address
     }*/
    
    @IBAction func showOnMapClicked(_ sender: Any) {
        if let pharmacy {
            onShowOnMapClicked?(pharmacy)
            print(pharmacy)
        }
        
    }
    
}
