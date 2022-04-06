//
//  ProfileHeaderView.swift
//  IB_INS_HOMEWORK1
//
//  Created by Alexander on 03.03.2022.
//

import UIKit

final class ProfileHeaderView: UITableViewCell {
    
    let avatarImageView: UIImageView = {
        $0.layer.borderWidth = 3
        $0.layer.borderColor = UIColor.white.cgColor
        $0.layer.masksToBounds = false
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView(image: nil))
    
    let fullNameLabel: UILabel = {
        $0.textAlignment = .center
        $0.textColor = UIColor.black
        $0.font = .systemFont(ofSize: 18, weight: .bold)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel(frame: .zero))
    
    let statusLabel: UILabel = {
        $0.textAlignment = .center
        $0.textColor = .gray
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel.init(frame: .zero))
    
    let setStatusButton: UIButton = {
        $0.setTitle("Show status", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .blue
        $0.layer.cornerRadius = 10
        $0.layer.shadowOffset = CGSize(width: 0, height: 4)
        $0.layer.shadowRadius = 4
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.7
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton(type: .system))
    
    let statusTextField: MarginTextField = {
        $0.placeholder = "Place holder text"
        $0.backgroundColor = .white
        $0.textColor = .black
        $0.layoutMargins = .init(top: 0, left: 10, bottom: 0, right: 10)
        $0.layer.cornerRadius = 12
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 1
        $0.font = .systemFont(ofSize: 15, weight: .regular)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(MarginTextField(frame: .zero))
    
    func configure(image: UIImage, fullName: String, status: String) {
        avatarImageView.image = image
        fullNameLabel.text = fullName
        statusLabel.text = status
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width / 2
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupContraints()
        contentView.clipsToBounds = false
        clipsToBounds = false
        layer.zPosition = 100
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension ProfileHeaderView {
    
    private func setupContraints() {
        contentView.addSubview(avatarImageView)
        contentView.addSubview(statusLabel)
        contentView.addSubview(fullNameLabel)
        contentView.addSubview(setStatusButton)
        contentView.addSubview(statusTextField)
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 150),
            avatarImageView.heightAnchor.constraint(equalToConstant: 150),
            
            fullNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 32),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
            contentView.trailingAnchor.constraint(greaterThanOrEqualTo: fullNameLabel.trailingAnchor, constant: 16),
            
            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 32),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
            contentView.trailingAnchor.constraint(greaterThanOrEqualTo: statusLabel.trailingAnchor, constant: 16),
            
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 20),
            statusTextField.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: statusTextField.trailingAnchor, constant: 16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            
            setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 20),
            setStatusButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            contentView.trailingAnchor.constraint(equalTo: setStatusButton.trailingAnchor, constant: 16),
            contentView.bottomAnchor.constraint(equalTo: setStatusButton.bottomAnchor),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

final class MarginTextField: UITextField {
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: layoutMargins)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: layoutMargins)
    }
}
