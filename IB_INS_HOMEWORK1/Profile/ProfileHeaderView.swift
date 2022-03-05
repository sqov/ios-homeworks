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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView: UIImageView = {
        let catImage = UIImage(named: "cat.jpeg")
        let image = UIImageView(image: catImage)
        
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.masksToBounds = false
        image.clipsToBounds = true
        
        return image
    }()
    
    
    let labelTitle: UILabel = {
        let label = UILabel()
        
        label.text = "Hipster Cat"
        label.textAlignment = .center
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        return label
    }()
    
    let labelText: UILabel = {
        let label = UILabel()
        
        label.text = "Waiting for something..."
        label.textAlignment = .center
        label.textColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        return label
    }()
    
    let buttonStatus: UIButton = {
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
    
    let textField: UITextField = {
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
    
}
