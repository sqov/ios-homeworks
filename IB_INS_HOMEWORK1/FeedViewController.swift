//
//  FeedViewController.swift
//  IB_INS_HOMEWORK1
//
//  Created by Alexander on 17.02.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
//   private let postObject = Post(title: "Post title")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "FeedVC"
        self.view.backgroundColor = .white
        
        setupButton()
    }
    
    
    func setupButton() {
        let button = UIButton(frame: CGRect(x: 100, y: 200, width: 200, height: 70))
        button.setTitle("Перейти в PostVC", for: .normal)
        button.setTitleColor(.systemGreen, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.backgroundColor = .clear
        button.layer.borderColor = UIColor.systemPink.cgColor
        self.view.addSubview(button)
    }
    
    @objc func buttonAction() {
        let postVC = PostViewController()
        
//        postVC.postObject = postObject
        
        navigationController?.pushViewController(postVC, animated: true)
    }
}
