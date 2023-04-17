//
//  Pharmacy.swift
//  DutyPharmacy
//
//  Created by iremt on 14.04.2023.
//

import Foundation

struct Pharmacy : Decodable {
    /*
     "name": "Sevinç Eczanesi",
     "dist": "Çankaya",
     "address": "Maltepe Mah. Güzaltan Sk. No:1/C Maltepe",
     "phone": "0312 231 71 75",
     "loc": "39.92887565500589,32.84444332122803"
     },
     
     */
    
    let name : String
    let dist : String
    let address : String
    let loc : String
    let city : String
    
}

struct PharmacyResponse: Decodable {
    let success: Bool
    let result: [Pharmacy]
}
