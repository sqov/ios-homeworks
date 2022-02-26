//
//  PostViewController.swift
//  IB_INS_HOMEWORK1
//
//  Created by Alexander on 17.02.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    var postObject: Post!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .brown
        setupRightBarButton()
        self.tabBarController?.tabBar.isHidden = true
        
        self.title = postObject.title
    }
    
    func setupRightBarButton() {
        let rightBarButton = UIBarButtonItem(title: "Go to Info", style: .done, target: self, action: #selector(barButtonAction))
        self.navigationItem.rightBarButtonItem  = rightBarButton
    }
    
    @objc func barButtonAction() {
        let infoVC = InfoViewController()
        navigationController?.pushViewController(infoVC, animated: true)
    }
}
