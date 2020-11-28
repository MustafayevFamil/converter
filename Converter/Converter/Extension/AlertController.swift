//
//  AlertController.swift
//  Converter
//
//  Created by Famil Mustafayev on 28.11.2020.
//  Copyright © 2020 Famil Mustafayev. All rights reserved.
//

import Foundation
import UIKit
extension ViewController {
    
    func alert(_ Title: String, _ Message: String, style: UIAlertController.Style) {
        let alert = UIAlertController(title: Title, message: Message, preferredStyle: style)
        let aze = UIAlertAction(title: "AZE", style: UIAlertAction.Style.default) { (action) in
            print("AZE")
        }
//        aze.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
        let eng = UIAlertAction(title: "ENG", style: UIAlertAction.Style.default) { (action) in
            print("ENG")
        }
        let rus = UIAlertAction(title: "RUS", style: UIAlertAction.Style.default, handler: { (action) in
            print("RUS")
        })
        let tr = UIAlertAction(title: "TR", style: UIAlertAction.Style.default, handler: { (action) in
            print("TR")

        })
        
        alert.addAction(aze)
        alert.addAction(eng)
        alert.addAction(rus)
        alert.addAction(tr)
        
        present(alert, animated: true, completion: nil)
    }
    
    func showSimpleActionSheet(controller: UIViewController) {
        let alert = UIAlertController(title: "Title", message: "Please Select an Option", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "AZE", style: .default, handler: { (_) in
            print("User click Approve button")
        }))
        
        alert.addAction(UIAlertAction(title: "ENG", style: .default, handler: { (_) in
            print("User click Edit button")
        }))
        alert.addAction(UIAlertAction(title: "RUS", style: .default, handler: { (_) in
            print("User click Edit button")
        }))
        
        alert.addAction(UIAlertAction(title: "TR", style: .destructive, handler: { (_) in
            print("User click Delete button")
        }))
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { (_) in
            print("User click Dismiss button")
        }))
        
        self.present(alert, animated: true, completion: {
            print("completion block)")
        })
    }
}
