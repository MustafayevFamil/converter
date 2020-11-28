//
//  ViewController.swift
//  Converter
//
//  Created by Famil Mustafayev on 28.11.2020.
//  Copyright © 2020 Famil Mustafayev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var converters = ConverterDataModel()
    var convertersLanguages = ConverterLanguageModel()
    // https://valyuta.com/api/get_currency_rate_for_app/AZN/2020-11-27
    override func viewDidLoad() {
        super.viewDidLoad()
        fetch()
        fetchLanguage()

    }
    func fetch(){
        let urlString = "https://valyuta.com/api/get_currency_rate_for_app/AZN/2020-11-27"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            guard let data = data  else { return }
            do{
                self.converters = try JSONDecoder().decode(ConverterDataModel.self, from: data)
                //print(self.converters)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }

            }catch{
                print("errorrrrrr")
            }
        }
        dataTask.resume()
    }
    func fetchLanguage(){
        let urlString = "https://valyuta.com/api/get_currency_list_for_app"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            guard let data = data  else { return }
            do{
                self.convertersLanguages = try JSONDecoder().decode(ConverterLanguageModel.self, from: data)
                print(self.convertersLanguages)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }catch{
                print("errorrrrrr")
            }
        }
        dataTask.resume()
    }
    @IBAction func addButton(_ sender: Any) {
        
    }
    
    @IBAction func languageButton(_ sender: Any) {
        //self.alert(" ", " ", style: UIAlertController.Style.actionSheet)
        showSimpleActionSheet(controller: self)
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return converters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let converter = converters[indexPath.row]
        let converterLanguage = convertersLanguages[indexPath.row]
        cell.AZELabel.text = converter.from
        cell.dayLabel.text = converter.date
        cell.nameLabel.text = converterLanguage.ru
        cell.converterLabel.text = "1 AZN = \(converter.result)"
        cell.textField.text = "1 AZN = \(converter.result)"
        cell.flagImageView.image = UIImage(named: "download-1")
        return cell
    }
    
    
}
