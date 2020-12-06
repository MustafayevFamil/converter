//
//  ConverterLanguageDataModelElement.swift
//  convertor
//
//  Created by Famil Mustafayev on 6.12.2020.
//  Copyright © 2020 Famil Mustafayev. All rights reserved.
//

import Foundation
// MARK: - ConverterLanguageDataModelElement
struct ConverterLanguageDataModelElement: Codable {
    let code, az, en, tr: String
    let ru: String
}

// MARK: ConverterLanguageDataModelElement convenience initializers and mutators

extension ConverterLanguageDataModelElement {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(ConverterLanguageDataModelElement.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        code: String? = nil,
        az: String? = nil,
        en: String? = nil,
        tr: String? = nil,
        ru: String? = nil
        ) -> ConverterLanguageDataModelElement {
        return ConverterLanguageDataModelElement(
            code: code ?? self.code,
            az: az ?? self.az,
            en: en ?? self.en,
            tr: tr ?? self.tr,
            ru: ru ?? self.ru
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

typealias ConverterLanguageDataModel = [ConverterLanguageDataModelElement]

extension Array where Element == ConverterLanguageDataModel.Element {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(ConverterLanguageDataModel.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}


// MARK: - URLSession response handlers

extension URLSession {
    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
        }
    }
    
    func converterLanguageDataModelTask(with url: URL, completionHandler: @escaping (ConverterLanguageDataModel?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}
