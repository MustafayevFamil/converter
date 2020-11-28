//
//  ConverterLanguageModel.swift
//  Converter
//
//  Created by Famil Mustafayev on 28.11.2020.
//  Copyright © 2020 Famil Mustafayev. All rights reserved.
//

import Foundation
// MARK: - ConverterLanguageModelElement
struct ConverterLanguageModelElement: Codable {
    let code, az, en, tr: String
    let ru: String
}

typealias ConverterLanguageModel = [ConverterLanguageModelElement]
