//
//  NetworkConverterManager.swift
//  Converter
//
//  Created by Famil Mustafayev on 28.11.2020.
//  Copyright © 2020 Famil Mustafayev. All rights reserved.
//

import Foundation
struct NetworkConverterManager {
    
    
    func fetchData(url: String, completionHandler: @escaping (CurrentConverter) -> Void){
        guard let url = URL(string: url) else { return}
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                do{
                    if let currentConverter = self.parseJSON(withData: data){
                        completionHandler(currentConverter)
                    }
                }catch {
                    print("error ------1")
                }
            }else {
                print("error \(error?.localizedDescription ?? "ERROR")")
            }
            
        }
        task.resume()
    }
    func parseJSON(withData data: Data) -> CurrentConverter?{
        let decoder = JSONDecoder()
        do {
            let currentDataModel = try decoder.decode(ConverterDataModelElement.self, from: data)
            print("\(currentDataModel.from)")
            guard let currentConverter = CurrentConverter(converterDataModelElement: currentDataModel) else { return nil}
            
            return currentConverter
        } catch {
            print("error--------2")
        }
        return nil
    }
}
