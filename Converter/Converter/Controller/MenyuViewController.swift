//
//  MenyuViewController.swift
//  Converter
//
//  Created by Famil Mustafayev on 28.11.2020.
//  Copyright © 2020 Famil Mustafayev. All rights reserved.
//

import UIKit

class MenyuViewController: UIViewController {


    @IBOutlet weak var tableViewMenyu: UITableView!
    
    var converterLanguageDataModel = ConverterLanguageDataModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetch(url: "https://valyuta.com/api/get_currency_list_for_app")
    }
    func fetch(url: String){
        guard let url = URL(string: url) else { return }
        let task = URLSession.shared.converterLanguageDataModelTask(with: url) { converterLanguageDataModelElement, response, error in
            if let converterLanguageDataModelElement = converterLanguageDataModelElement {
                print(converterLanguageDataModelElement[0].code)
                DispatchQueue.main.async {
                    self.converterLanguageDataModel = converterLanguageDataModelElement
                    self.tableViewMenyu.reloadData()
                }
                
            }
        }
        task.resume()
    }

    @IBAction func canselButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)

    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue"{
            if let indexPath = tableViewMenyu.indexPathForSelectedRow{
                let dvc = segue.destination as! ViewController
                dvc.azn = converterLanguageDataModel[indexPath.row].en
            }
        }
    }
    

}
extension MenyuViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return converterLanguageDataModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenyuTableViewCell
        cell.textLabel?.text = converterLanguageDataModel[indexPath.row].code
        
        return cell
    }
    
    
}
