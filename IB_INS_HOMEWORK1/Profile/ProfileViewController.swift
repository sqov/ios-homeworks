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
        profileCustomView = ProfileHeaderView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
        profileCustomView.backgroundColor = .lightGray
        profileCustomView.buttonStatus.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        profileCustomView.textField.addTarget(self, action: #selector(statusTextChanged(_:)), for: UIControl.Event.editingChanged)
        self.view.addSubview(profileCustomView)
        self.view.addSubview(profileCustomView.imageView)
        self.view.addSubview(profileCustomView.labelTitle)
        self.view.addSubview(profileCustomView.labelText)
        self.view.addSubview(profileCustomView.buttonStatus)
        self.view.addSubview(profileCustomView.textField)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        profileCustomView.imageView.frame = CGRect(x: view.safeAreaInsets.left + 16,
                                                   y: view.safeAreaInsets.top + 16,
                                                   width: 150,
                                                   height: 150)
        
        profileCustomView.labelTitle.frame = CGRect(x: profileCustomView.imageView.frame.origin.x + profileCustomView.imageView.frame.size.width + 10,
                                                    y: self.view.safeAreaInsets.top + 27,
                                                    width: 0,
                                                    height: 0)
        
        profileCustomView.labelTitle.sizeToFit()
        profileCustomView.imageView.layer.cornerRadius = profileCustomView.imageView.frame.size.width / 2
        
        profileCustomView.labelText.frame = CGRect(x: profileCustomView.labelTitle.frame.origin.x, y: profileCustomView.labelTitle.frame.origin.y + profileCustomView.labelTitle.frame.height + 40, width: 0, height: 0)
        profileCustomView.labelText.sizeToFit()
        
        profileCustomView.buttonStatus.frame = CGRect(x: view.safeAreaInsets.left + 16,
                                                      y: profileCustomView.imageView.frame.origin.y + profileCustomView.imageView.frame.height + 16,
                                                      width: view.frame.width - 32,
                                                      height: 50)
        
        profileCustomView.textField.frame = CGRect(x: profileCustomView.labelText.frame.origin.x,
                                                   y: profileCustomView.labelText.frame.origin.y + profileCustomView.labelText.frame.height + 8,
                                                   width: 200,
                                                   height: 40)
        
    }
    
    @objc func buttonPressed() {
        profileCustomView.labelText.text = statusText
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        self.statusText = textField.text
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.profileCustomView.textField.resignFirstResponder()
    }
}
