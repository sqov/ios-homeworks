//
//  ViewController.swift
//  IB_Instuments
//
//  Created by Alexander on 06.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let profileView = Bundle.main.loadNibNamed("Profile", owner: nil, options: nil)?.first as? ProfileView {
            
            profileView.frame = CGRect(x: 0, y: 100, width: 496, height: 373)
            view.addSubview(profileView)
        }
        
    }
    
}
