//
//  Alert.swift
//  convertor
//
//  Created by Famil Mustafayev on 6.12.2020.
//  Copyright © 2020 Famil Mustafayev. All rights reserved.
//

import UIKit

class Alert: UIAlertController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    
    func showAlert(title: String, message: String, style: UIAlertController.Style){
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        let cancel = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel) { (action) in
            
        }
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }

}
