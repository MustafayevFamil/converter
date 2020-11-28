//
//  NetworkConverterManager.swift
//  Converter
//
//  Created by Famil Mustafayev on 28.11.2020.
//  Copyright © 2020 Famil Mustafayev. All rights reserved.
//

import Foundation
struct NetworkConverterManager {
    func fetchData(_ url: String, countrName: String, yearMounthDay: String){
        guard let url = URL(string: url) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data{
                let converted = self.parseJSON(withData: data)
                print(converted)
            }
        }
        task.resume()
    }


    fileprivate func parseJSON(withData data: Data) {
        let decoder = JSONDecoder()
        do {
            let currentConverterData = try decoder.decode(ConverterDataModel.self, from: data)
            print(currentConverterData)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}
