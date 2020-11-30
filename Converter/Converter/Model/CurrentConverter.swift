//
//  CurrentConverter.swift
//  Converter
//
//  Created by Famil Mustafayev on 29.11.2020.
//  Copyright © 2020 Famil Mustafayev. All rights reserved.
//

import Foundation
struct CurrentConverter {
    let smallWritingContryMoney: String
    let countryMoneyName: String
    let yearMountDayLabel: String //date

    let converterLabel: Double //result
    var converterLabelString: String {
        return "\(converterLabel)"
    }
    
    let replacementConverter: Double //result
    var replacementConverterString: String {
        return "\(replacementConverter)"
    }
    
    
    
    init?(converterDataModelElement: ConverterDataModelElement) {
        smallWritingContryMoney = converterDataModelElement.from
        countryMoneyName = converterDataModelElement.from
        yearMountDayLabel = converterDataModelElement.date
        converterLabel = converterDataModelElement.result
        replacementConverter = converterDataModelElement.result
    }
}
    
    

