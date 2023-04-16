//
//  ViewController.swift
//  DutyPharmacy
//
//  Created by iremt on 14.04.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private var pharmacyViewModel = PharmacyViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pharmacyViewModel.fetchPharmacyData { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data) :
                    print("veri alındı \(data)")
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
        
        
    }
    
 
    
   
   
    @IBAction func tıkl(_ sender: Any) {
        
        performSegue(withIdentifier: "toPharmacyPage", sender: nil)
    }
    
}

