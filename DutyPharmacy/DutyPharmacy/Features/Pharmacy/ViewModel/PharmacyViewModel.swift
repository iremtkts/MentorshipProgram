//
//  PharmacyViewModel.swift
//  DutyPharmacy
//
//  Created by iremt on 16.04.2023.
//

import Foundation

class PharmacyViewModel {
    private let webService = WebService()
    
    func fetchPharmacyData(city: String, district: String? = nil, completion: @escaping (Result<PharmacyResponse, Error>) -> Void) {
        webService.fetchData(city: city, district: district, completion: completion)
    }
}

    
    

