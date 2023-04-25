//
//  District.swift
//  DutyPharmacy
//
//  Created by iremt on 17.04.2023.
//

import Foundation

struct District : Decodable {
    
    let text : String
   
}

struct DistrictResponse: Decodable {
    let success: Bool
    let result: [District]
}
