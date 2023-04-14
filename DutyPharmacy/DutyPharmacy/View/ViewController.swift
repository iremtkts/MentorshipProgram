//
//  ViewController.swift
//  DutyPharmacy
//
//  Created by iremt on 14.04.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tıkl(_ sender: Any) {
        
        performSegue(withIdentifier: "toPharmacyPage", sender: nil)
    }
    
}

