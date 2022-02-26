//
//  InfoViewController.swift
//  IB_INS_HOMEWORK1
//
//  Created by Alexander on 17.02.2022.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setupAlertButton()
        self.title = "InfoVC"
        
    }
    
    
    func setupAlertButton() {
        let button = UIButton(frame: CGRect(x: 130, y: 200, width: 100, height: 70))
        button.setTitle("Alertik", for: .normal)
        button.setTitleColor(.systemGreen, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.backgroundColor = .clear
        button.layer.borderColor = UIColor.systemPink.cgColor
        self.view.addSubview(button)
    }
    
    @objc func buttonAction() {
        let alertControl = UIAlertController(title: "Title Alert", message: "Would you like a sandwich?!", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertControl.addAction(defaultAction)
        self.present(alertControl, animated: true, completion: nil)
    }

    
}
