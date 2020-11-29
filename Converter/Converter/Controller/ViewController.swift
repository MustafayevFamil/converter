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
    let network = NetworkConverterManager()
    // https://valyuta.com/api/get_currency_rate_for_app/AZN/2020-11-27
    // https://valyuta.com/api/get_currency_list_for_app
    override func viewDidLoad() {
        super.viewDidLoad()
        network.fetchData(url: "https://valyuta.com/api/get_currency_rate_for_app/AZN/2020-11-27") { (currentConverter) in
            print("--------\(currentConverter.converterLabel)")
        }
        
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
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        
        return cell
    }
    
    
}
