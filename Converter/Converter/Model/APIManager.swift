//
//  APIManager.swift
//  Converter
//
//  Created by Famil Mustafayev on 29.11.2020.
//  Copyright © 2020 Famil Mustafayev. All rights reserved.
//

import Foundation

typealias JSONTask = URLSessionDataTask
typealias JSONCompletionHandler = ([String: AnyObject]?, HTTPURLResponse?, Error?) -> Void

protocol JSONCodable {
    init?(JSON: [String: AnyObject])
}

protocol FinalURLPoint {
    var baseURL: URL { get }
    var path: String { get }
    var request: URLRequest { get }
}

enum APIResult<T>{
    case Success(T)
    case Failure(Error)
}
protocol APIManager {
    var sessionConfiguration: URLSessionConfiguration { get }
    var session: URLSession { get }
    func JSONtaskWith(request: URLRequest, completionHandler: JSONCompletionHandler) -> JSONTask
    func fetch<T: JSONCodable>(request: URLRequest, parse: @escaping ([String: AnyObject]) -> T?, comppletionHandler: (APIResult<T>) -> Void)
    
    //init(sessionConfiguration: URLSessionConfiguration)
}
extension APIManager{
    
    func JSONtaskWith(request: URLRequest, completionHandler: @escaping JSONCompletionHandler) -> JSONTask{
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            guard let HTTPResponse = response as? HTTPURLResponse else {
                let userInfo = [NSLocalizedDescriptionKey: NSLocalizedString("Missing HTTP Response", comment: "")]
                let error = NSError(domain: FAMNetworkingErrorDomain, code: MissingHTTPResponseError, userInfo: userInfo)
                completionHandler(nil, nil, error)
                return
            }
            if data == nil{
                if let error = error{
                    completionHandler(nil, HTTPResponse, error)
                }
            }else {
                switch HTTPResponse.statusCode{
                case 200:
                    do{
                        let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: AnyObject]
                        completionHandler(json, HTTPResponse, nil)
                    }catch let error as NSError{
                        completionHandler(nil, HTTPResponse, error)
                    }
                default:
                    print("We have got response status \(HTTPResponse.statusCode)")
                }
            }
        }
        return dataTask
    }
    func fetch<T>(request: URLRequest, parse: @escaping ([String: AnyObject]) -> T?, comppletionHandler: @escaping (APIResult<T>) -> Void){
        let dataTask = JSONtaskWith(request: request) { (json, response, error) in
            guard json != nil else {
                if let error = error{
                    comppletionHandler(APIResult<T>.Failure(error))
                }
                return
            }
            if let value = parse(json!){
                comppletionHandler(APIResult<T>.Success(value))
            }else{
                let error = NSError(domain: FAMNetworkingErrorDomain, code: UnexpectedResponseError, userInfo: nil)
                comppletionHandler(APIResult<T>.Failure(error))
            }
        }
        dataTask.resume()
    }
}
