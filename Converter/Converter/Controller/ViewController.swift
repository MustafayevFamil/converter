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
    
    var azn = ""
    
    let network = NetworkConverterManager()
    var converterDataModel = ConverterDataModel()
    // https://valyuta.com/api/get_currency_rate_for_app/AZN/2020-11-27
    // https://valyuta.com/api/get_currency_list_for_app
    override func viewDidLoad() {
        super.viewDidLoad()
        fetch(url: "https://valyuta.com/api/get_currency_rate_for_app/AZN/2020-11-30")
    }
   
    
    
    func fetch(url: String){
        guard let url = URL(string: url) else { return }
        let task = URLSession.shared.converterDataModelTask(with: url) { data, response, error in
            if let converterDataModelElement = data {
                print(converterDataModelElement[0].from)
                DispatchQueue.main.async {
                    self.converterDataModel = converterDataModelElement
                    self.tableView.reloadData()
                }
            }
        }
        task.resume()
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
        return converterDataModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.smallWritingContryMoney.text = converterDataModel[indexPath.row].from
        cell.converterLabel.text = converterDataModel[indexPath.row].resultString
        cell.yearMountDayLabel.text = converterDataModel[indexPath.row].date
        cell.replacementConverter.text = "1 AZN = \(converterDataModel[indexPath.row].resultString)"
        cell.countryMoneyName.text = azn
        return cell
    }
    
    
}
