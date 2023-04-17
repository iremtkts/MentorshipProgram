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
    
    
    
    let cities = ["Adana", "Adıyaman", "Afyonkarahisar", "Ağrı", "Amasya", "Ankara", "Antalya", "Artvin", "Aydın", "Balıkesir", "Bilecik", "Bingöl", "Bitlis", "Bolu", "Burdur", "Bursa", "Çanakkale", "Çankırı", "Çorum", "Denizli", "Diyarbakır", "Edirne", "Elazığ", "Erzincan", "Erzurum", "Eskişehir", "Gaziantep", "Giresun", "Gümüşhane", "Hakkari", "Hatay", "Isparta", "Mersin", "İstanbul", "İzmir", "Kars", "Kastamonu", "Kayseri", "Kırklareli", "Kırşehir", "Kocaeli", "Konya", "Kütahya", "Malatya", "Manisa", "Kahramanmaraş", "Mardin", "Muğla", "Muş", "Nevşehir", "Niğde", "Ordu", "Rize", "Sakarya", "Samsun", "Siirt", "Sinop", "Sivas", "Tekirdağ", "Tokat", "Trabzon", "Tunceli", "Şanlıurfa", "Uşak", "Van", "Yozgat", "Zonguldak", "Aksaray", "Bayburt", "Karaman", "Kırıkkale", "Batman", "Şırnak", "Bartın", "Ardahan", "Iğdır", "Yalova", "Karabük", "Kilis", "Osmaniye", "Düzce"]


    var  districts = ["test1","test2"]
    
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
            return districts[row]
        default:
            return "no data"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            cityTextField.text = cities[row]
            cityTextField.resignFirstResponder()
        case 2:
            districtTextField.text = districts[row]
            districtTextField.resignFirstResponder()
        default:
            return
        }
    }
    
}
