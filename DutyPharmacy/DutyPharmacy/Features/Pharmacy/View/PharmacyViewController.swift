//
//  PharmacyViewController.swift
//  DutyPharmacy
//
//  Created by iremt on 14.04.2023.
//

import UIKit

class PharmacyViewController: UIViewController {
    
    var choosenCity : String?
    var choosenDistrict : String?
    var pharmacies : [Pharmacy] = []
    var pharmacyViewModel = PharmacyViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        if let city = choosenCity {
            pharmacyViewModel.fetchPharmacyData(city: city, district: choosenDistrict ?? "") { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let data) :
                        print(data)
                        self?.pharmacies = data.result
                        self?.tableView.reloadData()
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
        }
        
    }
}
    
    extension PharmacyViewController : UITableViewDelegate , UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return pharmacies.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PharmacyTableViewCell
            
            let pharmacy = pharmacies[indexPath.row]
            
            cell.pharmacyNameTextLabel?.text = pharmacy.name
            cell.districtNameTextLabel?.text = pharmacy.dist
            cell.addressTextLabel?.text = pharmacy.address
            
            return cell
        }
        
    }
    

