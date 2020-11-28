//
//  ConverterDataModel.swift
//  Converter
//
//  Created by Famil Mustafayev on 28.11.2020.
//  Copyright © 2020 Famil Mustafayev. All rights reserved.
//

import Foundation
// MARK: - ConverterDataModelElement
struct ConverterDataModelElement: Codable {
    let from: String
    let to: To
    let result: Double
    let date: String
    //let menbe: Menbe
    
}

enum Menbe: String, Codable {
    case cbar = "cbar"
    case ecb = "ecb_"
    case same = "same"
}

enum To: String, Codable {
    case azn = "AZN"
}

typealias ConverterDataModel = [ConverterDataModelElement]
