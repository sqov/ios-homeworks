//
//  PostViewController.swift
//  IB_INS_HOMEWORK1
//
//  Created by Alexander on 16.02.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alertButton()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func alertButton() {
        let alert = UIAlertController(title: "My Alert", message: "This is an alert.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
}
