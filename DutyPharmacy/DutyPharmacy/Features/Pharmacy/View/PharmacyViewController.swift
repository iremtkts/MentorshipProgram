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
    var selectedPharmacy : Pharmacy?
    
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMapDetail",
           let mapVC = segue.destination as? MapViewController {
            mapVC.selectedPharmacy = selectedPharmacy
            print(selectedPharmacy?.loc)
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
                cell.delegate = self
                cell.configure(with: pharmacy)
            
            /*cell.pharmacyNameTextLabel?.text = pharmacy.name
            cell.districtNameTextLabel?.text = pharmacy.dist
            cell.addressTextLabel?.text = pharmacy.address
            
            **/
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            selectedPharmacy = pharmacies[indexPath.row]
        }
        
    }
    
extension PharmacyViewController: PharmacyTableViewCellDelegate {
    func didSelectPharmacy(_ pharmacy: Pharmacy) {
        selectedPharmacy = pharmacy
        print("pharmacyvcdelegatecell\(selectedPharmacy?.loc)")
        performSegue(withIdentifier: "toMapDetail", sender: self)
    }
}

