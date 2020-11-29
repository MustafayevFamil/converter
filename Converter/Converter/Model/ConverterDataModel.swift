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
    let from:    String //2
    let to:      To
    let result:  Double //2
    let date:    String //1
    let menbe:   Menbe
    let code:    String
    let az:      String
    let en:      String
    let tr:      String
    let ru:      String
}

enum Menbe: String, Codable {
    case afor   = "afor"
    case cbar   = "cbar"
    case ecb    = "ecb_"
    case same   = "same"
}

enum To: String, Codable {
    case usd = "USD"
}

typealias ConverterDataModel = [ConverterDataModelElement]
