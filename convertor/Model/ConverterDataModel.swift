//
//  ConverterDataModel.swift
//  convertor
//
//  Created by Famil Mustafayev on 6.12.2020.
//  Copyright © 2020 Famil Mustafayev. All rights reserved.
//

import Foundation
// MARK: - ConverterModelElement
//https://valyuta.com/api/get_currency_rate_for_app/AZN/2020-12-6
struct ConverterDataModelElement: Codable {
        let from: String
        let to: To
        let result: Double
        var resultString: String{
            return "\(result)"
            
        }
        let date: String
        let menbe: Menbe
    }
typealias ConverterDataModel = [ConverterDataModelElement]

    // MARK: ConverterDataModelElement convenience initializers and mutators
    
    extension ConverterDataModelElement {
        init(data: Data) throws {
            self = try newJSONDecoder().decode(ConverterDataModelElement.self, from: data)
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
            from: String? = nil,
            to: To? = nil,
            result: Double? = nil,
            date: String? = nil,
            menbe: Menbe? = nil
            ) -> ConverterDataModelElement {
            return ConverterDataModelElement(
                from: from ?? self.from,
                to: to ?? self.to,
                result: result ?? self.result,
                date: date ?? self.date,
                menbe: menbe ?? self.menbe
            )
        }
        
        func jsonData() throws -> Data {
            return try newJSONEncoder().encode(self)
        }
        
        func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
            return String(data: try self.jsonData(), encoding: encoding)
        }
    }
    
    enum Menbe: String, Codable {
        case cbar = "cbar"
        case ecb = "ecb_"
        case same = "same"
    }
    
    enum To: String, Codable {
        case azn = "AZN"
    }
    

    extension Array where Element == ConverterDataModel.Element {
        init(data: Data) throws {
            self = try newJSONDecoder().decode(ConverterDataModel.self, from: data)
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
    
    // MARK: - Helper functions for creating encoders and decoders
    
    func newJSONDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
            decoder.dateDecodingStrategy = .iso8601
        }
        return decoder
    }
    
    func newJSONEncoder() -> JSONEncoder {
        let encoder = JSONEncoder()
        if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
            encoder.dateEncodingStrategy = .iso8601
        }
        return encoder
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
        
        func converterDataModelTask(with url: URL, completionHandler: @escaping (ConverterDataModel?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
            return self.codableTask(with: url, completionHandler: completionHandler)
        }
}
