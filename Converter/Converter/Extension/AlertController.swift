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
//        let image1 = #imageLiteral(resourceName: "az")
//        let image2 = #imageLiteral(resourceName: "eng")
//        let image3 = #imageLiteral(resourceName: "rus")
//        let image4 = #imageLiteral(resourceName: "tr")

        let alert = UIAlertController(title: "Title", message: "Please Select an Option", preferredStyle: .actionSheet)
        
            let aze = UIAlertAction(title: "AZE", style: .default, handler: { (_) in
            print("User click Approve button")
        })
        
        
            let eng = UIAlertAction(title: "ENG", style: .default, handler: { (_) in
            print("User click Edit button")
        })
        
            let rus = UIAlertAction(title: "RUS", style: .default, handler: { (_) in
            print("User click Edit button")
        })
        
        
            let tr = UIAlertAction(title: "TR", style: .destructive, handler: { (_) in
            print("User click Delete button")
        })
        
        
            let dismiss = UIAlertAction(title: "Dismiss", style: .cancel, handler: { (_) in
            print("User click Dismiss button")
        })
        
        aze.setValue(CATextLayerAlignmentMode.right, forKey: "titleTextAlignment")
        eng.setValue(CATextLayerAlignmentMode.right, forKey: "titleTextAlignment")
        rus.setValue(CATextLayerAlignmentMode.right, forKey: "titleTextAlignment")
        tr.setValue(CATextLayerAlignmentMode.right, forKey: "titleTextAlignment")
        
        
//        aze.setValue(image1, forKey: "image")
//        eng.setValue(image2, forKey: "image")
//        rus.setValue(image3, forKey: "image")
//        tr.setValue(image4, forKey: "image")

        
        alert.addAction(aze)
        alert.addAction(eng)
        alert.addAction(rus)
        alert.addAction(tr)
        alert.addAction(dismiss)
        
        self.present(alert, animated: true, completion: {
            print("completion block)")
        })
    }
}
