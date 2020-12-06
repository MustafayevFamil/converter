//
//  MenyuVC.swift
//  convertor
//
//  Created by Famil Mustafayev on 5.12.2020.
//  Copyright © 2020 Famil Mustafayev. All rights reserved.
//

import UIKit

class MenyuVC: UIViewController {
    var converterLanguageDataModel = ConverterLanguageDataModel()

    
    
    @IBOutlet weak var buttonCancel: UIBarButtonItem!
    @IBOutlet weak var buttonLanguage: UIBarButtonItem!
    
    var isVisited = [Bool](repeating: false, count: 4)
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDataLanguage(url: "https://valyuta.com/api/get_currency_list_for_app")
        picker.isHidden = true
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var picker: UIPickerView!
    
    @IBAction func canselButton(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "FirstNavigationController") else { return }
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func languageButton(_ sender: Any) {
        //tableView.isHidden = true
        picker.isHidden = false

        //showAlert(title: "Choose one of the following languages", messaje: "Language", style: UIAlertController.Style.alert)
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
    private func configureCell(cell: MenyuCell, for indexPath: IndexPath){
        DispatchQueue.main.async {
            let converter = self.converterLanguageDataModel[indexPath.row]
            cell.menyuAzn.text = converter.code
            cell.menyuManat.text = converter.en
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func showAlert(title: String, messaje: String, style: UIAlertController.Style){
        let alert = UIAlertController(title: title, message: messaje, preferredStyle: style)
        
        let azn = UIAlertAction(title: "AZERBAİJAN", style: UIAlertAction.Style.default) { (action : UIAlertAction) -> Void in
            print("AZERBAİJAN")

        }
        let eng = UIAlertAction(title: "ENGLISH", style: UIAlertAction.Style.default) { (action ) in
            print("AZERBAİJAN")

        }
        let rus = UIAlertAction(title: "RUSSİAN", style: UIAlertAction.Style.default) { (action ) in
            print("AZERBAİJAN")

        }
        let tr = UIAlertAction(title: "TURKEY", style: UIAlertAction.Style.default) { (action ) in
            print("AZERBAİJAN")

        }
        let add = UIAlertAction(title: "Add", style: UIAlertAction.Style.destructive) { (action ) in
            print("AZERBAİJAN")

        }
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) { (action ) in
            print("AZERBAİJAN")

        }
        

        alert.addAction(azn)
        alert.addAction(eng)
        alert.addAction(rus)
        alert.addAction(tr)

        alert.addAction(add)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }

}
extension MenyuVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return converterLanguageDataModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let menyuCell = tableView.dequeueReusableCell(withIdentifier: "menyuCell", for: indexPath) as! MenyuCell
        self.configureCell(cell: menyuCell, for: indexPath)
        
//        if self.isVisited[indexPath.row]{
//            cell.accessoryType = .checkmark
//        }else{
//            cell.accessoryType = .none
//        }
//        menyuCell.accessoryType = self.isVisited[indexPath.row] ? .checkmark : .none
        
        return menyuCell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        self.isVisited[indexPath.row] = true
    }

    
}
extension MenyuVC: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return secim.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return secim[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let menyuCell = tableView.dequeueReusableCell(withIdentifier: "menyuCell") as! MenyuCell
        let languageConverter = converterLanguageDataModel[row]

        switch row {
        case 0:
            
            DispatchQueue.main.async {
                print(language[0])
                self.navigationItem.title = country[0]
                self.buttonCancel.title = button[0]
                self.buttonLanguage.title = language[0]
                menyuCell.menyuAzn.text = languageConverter.az
                menyuCell.menyuManat.text = languageConverter.az
                self.tableView.reloadData()
            }
        case 1:
           
            DispatchQueue.main.async {
                print(language[1])
                self.navigationItem.title = country[1]
                self.buttonCancel.title = button[1]
                self.buttonLanguage.title = language[1]
                menyuCell.menyuAzn.text = languageConverter.en
                menyuCell.menyuManat.text = languageConverter.en
                self.tableView.reloadData()

            }
        case 2:
            
            DispatchQueue.main.async {
                print(language[2])
                self.navigationItem.title = country[2]
                self.buttonCancel.title = button[2]
                self.buttonLanguage.title = language[2]
                menyuCell.menyuAzn.text = languageConverter.ru
                menyuCell.menyuManat.text = languageConverter.ru
                self.tableView.reloadData()
            }
        case 3:
            
            DispatchQueue.main.async {
                print(language[3])
                self.navigationItem.title = country[3]
                self.buttonCancel.title = button[3]
                self.buttonLanguage.title = language[3]
                menyuCell.menyuAzn.text = languageConverter.tr
                menyuCell.menyuManat.text = languageConverter.tr
                self.tableView.reloadData()
            }
        default:
            break
        }
        
    }
}
