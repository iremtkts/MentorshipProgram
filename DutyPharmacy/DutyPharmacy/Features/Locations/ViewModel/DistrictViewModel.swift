//
//  DistrictViewModel.swift
//  DutyPharmacy
//
//  Created by iremt on 25.04.2023.
//

import Foundation

class DistrictViewModel {
    private let webService = WebService()
    
    func fetchDistrictData(forCity city: String, completion: @escaping (Result<[District], Error>) -> Void) {
        webService.fetchDistrictData(forCity: city, completion: completion)
    }
    
}
