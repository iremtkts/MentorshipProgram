//
//  MapViewModel.swift
//  DutyPharmacy
//
//  Created by iremt on 28.04.2023.
//

import Foundation

class MapViewModel {
   
    func getSelectedPharmacyLocation (from pharmacy : Pharmacy) -> Location?{
        let coordinates = pharmacy.loc.components(separatedBy: ",")
        if let latitude = Double(coordinates[0]) , let longitude = Double(coordinates[1]) {
                return Location(latitude: latitude, longitude: longitude)
        } else {
           
            return nil
        }
    }
}
