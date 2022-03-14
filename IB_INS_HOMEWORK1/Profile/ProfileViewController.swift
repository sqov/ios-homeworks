//
//  ProfileViewController.swift
//  IB_INS_HOMEWORK1
//
//  Created by Alexander on 17.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var profileCustomView: ProfileHeaderView!
    var statusText: String?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "ProfileVC"
        profileCustomView = ProfileHeaderView()
        
        profileCustomView.backgroundColor = .lightGray
        profileCustomView.setStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        profileCustomView.statusTextField.addTarget(self, action: #selector(statusTextChanged(_:)), for: UIControl.Event.editingChanged)
        
        view.addSubview(profileCustomView)
        
        setupContraints()
    }
    
    @objc func buttonPressed() {
        profileCustomView.statusLabel.text = statusText
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        self.statusText = textField.text
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.profileCustomView.statusTextField.resignFirstResponder()
    }
    
    
   private func setupContraints() {
        profileCustomView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileCustomView.topAnchor.constraint(equalTo: view.topAnchor),
            profileCustomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileCustomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileCustomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
