//
//  PharmacyViewModel.swift
//  DutyPharmacy
//
//  Created by iremt on 16.04.2023.
//

import Foundation

class PharmacyViewModel {
    private let webService = WebService()
    
    func fetchPharmacyData (completion : @escaping (Result <String , Error>) -> Void) {
    
        webService.fetchData(completion: completion)
    }
    
    func fetchDistrictData(forCity city: String, completion: @escaping (Result<[District], Error>) -> Void) {
        webService.fetchDistrictData(forCity: city, completion: completion)
    }
}
