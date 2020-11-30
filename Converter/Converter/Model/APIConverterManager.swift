//
//  APIConverterManager.swift
//  Converter
//
//  Created by Famil Mustafayev on 29.11.2020.
//  Copyright © 2020 Famil Mustafayev. All rights reserved.
//

import Foundation
// https://valyuta.com/api/get_currency_rate_for_app/AZN/2020-11-27

//enum ForecastType: FinalURLPoint{
//    case Current(money: String, yearDay: String)
//
//    var request: URLRequest{
//        let url = URL(string: path, relativeTo: baseURL)
//        return URLRequest(url: url!)
//    }
//    var baseURL: URL{
//        return URL(string: "https://valyuta.com/api/get_currency_rate_for_app")!
//    }
//    
//    var path: String{
//        switch self {
//        case .Current(let money, let yearDay):
//            return "/\(money)/\(yearDay)"
//        }
//        
//        
//    }
//    final class APIConverterManager: APIManager{
//        let sessionConfiguration: URLSessionConfiguration
//        
//        lazy var session: URLSession = {
//            return URLSession(configuration: self.sessionConfiguration)
//        }()
//        let money: String
//        let yearDay: String
//        init(sessionConfiguration: URLSessionConfiguration, money: String, yearDay: String){
//            self.sessionConfiguration = sessionConfiguration
//            self.money = money
//            self.yearDay = yearDay
//        }
//        convenience init(money: String, yearDay: String){
//            self.init(sessionConfiguration: URLSessionConfiguration.default, money: money, yearDay: yearDay)
//        }
//        
//        func fetchCurrentConverterWith(money: String,yearData: String, completionHandler: (APIResult<CurrentConverter>) -> Void){
//            let request = ForecastType.Current(money: money, yearDay: yearDay).request
//            fetch(request: request, parse: { (json) -> CurrentConverter? in
//                if let dictionary = json["from"]
//            }, comppletionHandler: <#T##(APIResult<T>) -> Void#>)
//        }
//    }
//}
