//
//  ProfileHeaderView.swift
//  IB_INS_HOMEWORK1
//
//  Created by Alexander on 03.03.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    let avatarImageView: UIImageView = {
        let catImage = UIImage(named: "cat.jpeg")
        let image = UIImageView(image: catImage)
        
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.masksToBounds = false
        image.clipsToBounds = true
        
        return image
    }()
    
    
    let fullNameLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Hipster Cat"
        label.textAlignment = .center
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.backgroundColor = .red
        
        return label
    }()
    
    let statusLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Waiting for something..."
        label.textAlignment = .center
        label.textColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.backgroundColor = .red
        return label
    }()
    
    let setStatusButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        
        return button
    }()
    
    let statusTextField: UITextField = {
        let myTextField = UITextField();
        myTextField.placeholder = "Place holder text"
        myTextField.backgroundColor = UIColor.white
        myTextField.textColor = .black
        myTextField.layer.cornerRadius = 12
        myTextField.layer.borderColor = UIColor.black.cgColor
        myTextField.layer.borderWidth = 1
        myTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        
        
        return myTextField
    }()
    
    
    private func commonInit() {
        addSubview(avatarImageView)
        addSubview(statusLabel)
        addSubview(fullNameLabel)
        addSubview(setStatusButton)
        addSubview(statusTextField)
        
        setupContraints()
    }
    
    private func setupContraints() {
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 150),
            avatarImageView.heightAnchor.constraint(equalToConstant: 150),
            
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            fullNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
            
            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 30),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
            
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 20),
            statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            
            setStatusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width / 2
    }
}
