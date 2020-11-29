//
//  APIConverterManager.swift
//  Converter
//
//  Created by Famil Mustafayev on 29.11.2020.
//  Copyright © 2020 Famil Mustafayev. All rights reserved.
//

import Foundation
final class APIConverterManager: APIManager{
    func fetch<T>(request: URLRequest, parse: @escaping ([String : AnyObject]) -> T?, comppletionHandler: (APIResult<T>) -> Void) {
        <#code#>
    }
    
    func JSONtaskWith(request: URLRequest, completionHandler: ([String : AnyObject]?, HTTPURLResponse?, Error?) -> Void) -> JSONTask {
        <#code#>
    }
    

    
    let sessionConfiguration: URLSessionConfiguration
    
    lazy var session: URLSession = {
        return URLSession(configuration: self.sessionConfiguration)
    }()
    init(sessionConfiguration: URLSessionConfiguration){
        self.sessionConfiguration = sessionConfiguration
    }
    
}
