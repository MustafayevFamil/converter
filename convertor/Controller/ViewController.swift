//
//  ViewController.swift
//  convertor
//
//  Created by Famil Mustafayev on 5.12.2020.
//  Copyright © 2020 Famil Mustafayev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let alert = Alert()
    var converterDataModel = ConverterDataModel()
    var converterLanguageDataModel = ConverterLanguageDataModel()
    //"https://valyuta.com/api/get_currency_rate_for_app/AZN/2020-12-6"

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fetchData(url: "https://valyuta.com/api/get_currency_rate_for_app/AZN/2020-12-6")
        fetchDataLanguage(url: "https://valyuta.com/api/get_currency_list_for_app")
    }
    func fetchData(url: String){
        guard let url = URL(string: url) else { return }
        let task = URLSession.shared.converterDataModelTask(with: url) { data, response, error in
            if let converterDataModelElement = data {
                DispatchQueue.main.async {
                    self.converterDataModel = converterDataModelElement
                    
                    self.tableView.reloadData()
                }
            }
        }
        task.resume()
    }
    func fetchDataLanguage(url: String){
        guard let url = URL(string: url) else { return }
        let task = URLSession.shared.converterLanguageDataModelTask(with: url) { converterLanguageDataModelElement, response, error in
            if let converterLanguageDataModelElement = converterLanguageDataModelElement {
                DispatchQueue.main.async {
                    self.converterLanguageDataModel = converterLanguageDataModelElement
                    self.tableView.reloadData()
                }

            }
        }
        task.resume()
    }
    private func configureCell(cell: TableViewCell, for indexPath: IndexPath){
        DispatchQueue.main.async {
            let converter = self.converterDataModel[indexPath.row]
            let language = self.converterLanguageDataModel[indexPath.row]
            cell.aznLabel.text = converter.from
            cell.manat.text = "\(language.az)"
            cell.dayMounthYearMenbe.text = "\(converter.date) Mənbə \(converter.menbe)"
            cell.textField.text = "\(converter.result)"
            cell.oneUSDEquealOneAZN.text = "1 AZN = \(converter.result) \(converter.from)"
        }

    }
    @IBAction func addButton(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "SecondNavigationController") else { return }
        present(vc, animated: true, completion: nil)
    }
    
}
extension ViewController: UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return converterDataModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        self.configureCell(cell: cell, for: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
//            azn.remove(at: indexPath.row)
//            manat.remove(at: indexPath.row)
//            images.remove(at: indexPath.row)
            converterDataModel.remove(at: indexPath.row)
            converterLanguageDataModel.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)

            tableView.reloadData()
        }
    }
    
}

