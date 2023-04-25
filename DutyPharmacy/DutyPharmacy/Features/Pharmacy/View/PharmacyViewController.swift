//
//  PharmacyViewController.swift
//  DutyPharmacy
//
//  Created by iremt on 14.04.2023.
//

import UIKit

class PharmacyViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
    
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PharmacyTableViewCell
        
        cell.pharmacyNameTextLabel?.text = "Eczane Adı"
        cell.districtNameTextLabel?.text = "İlçe Adı"
        cell.addressTextLabel?.text = "Adres : Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus."
        
        return cell
    }


}
