//
//  ViewController.swift
//  DutyPharmacy
//
//  Created by iremt on 14.04.2023.
//

import UIKit

class ViewController: UIViewController {
   
   
    @IBOutlet weak var cityTextField: UITextField!
    
    @IBOutlet weak var districtTextField: UITextField!
    
    var cityPickerView = UIPickerView()
    var districtPickerView = UIPickerView()
    
    private var pharmacyViewModel = PharmacyViewModel()
    
    
    
    let cities = ["Adana", "Adiyaman", "Afyonkarahisar", "Agri", "Amasya", "Ankara", "Antalya", "Artvin", "Aydin", "Balikesir", "Bilecik", "Bingol", "Bitlis", "Bolu", "Burdur", "Bursa", "Canakkale", "Cankiri", "Corum", "Denizli", "Diyarbakir", "Edirne", "Elazig", "Erzincan", "Erzurum", "Eskisehir", "Gaziantep", "Giresun", "Gumushane", "Hakkari", "Hatay", "Isparta", "Mersin", "İstanbul", "İzmir", "Kars", "Kastamonu", "Kayseri", "Kirklareli", "Kirsehir", "Kocaeli", "Konya", "Kutahya", "Malatya", "Manisa", "Kahramanmaras", "Mardin", "Mugla", "Mus", "Nevsehir", "Nigde", "Ordu", "Rize", "Sakarya", "Samsun", "Siirt", "Sinop", "Sivas", "Tekirdag", "Tokat", "Trabzon", "Tunceli", "Sanliurfa", "Usak", "Van", "Yozgat", "Zonguldak", "Aksaray", "Bayburt", "Karaman", "Kirikkale", "Batman", "Sirnak", "Bartin", "Ardahan", "Iğdir", "Yalova", "Karabük", "Kilis", "Osmaniye", "Duzce"]


    var districts = [District]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityTextField.inputView = cityPickerView
        districtTextField.inputView = districtPickerView
        
        cityPickerView.delegate = self
        cityPickerView.dataSource = self
        
        districtPickerView.delegate = self
        districtPickerView.dataSource = self
        
        cityPickerView.tag = 1
        districtPickerView.tag = 2
        
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

extension ViewController: UIPickerViewDelegate , UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return cities.count
        case 2:
            return districts.count
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return cities[row]
        case 2:
            return districts[row].text
        default:
            return "no data"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            let selectedCity = cities[row]
            cityTextField.text = selectedCity
            cityTextField.resignFirstResponder()
            
            pharmacyViewModel.fetchDistrictData(forCity: selectedCity) { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let data):
                        self?.districts = data
                        self?.districtPickerView.reloadAllComponents()
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
        case 2:
            districtTextField.text = districts[row].text
            districtTextField.resignFirstResponder()
        default:
            return
        }
    }
    
}
