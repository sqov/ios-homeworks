//
//  PostTableViewCell.swift
//  IB_INS_HOMEWORK1
//
//  Created by Muller Alexander on 26.03.2022.
//

import UIKit

final class PostTableViewCell: UITableViewCell {
    let titleLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 20)
        $0.numberOfLines = 2
        return $0
    }(UILabel(frame: .zero))
    
    let mainPictureImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFit
        $0.backgroundColor = .black
        return $0
    }(UIImageView(image: nil))
    
    let infoLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .systemGray
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.numberOfLines = 0
        return $0
    }(UILabel(frame: .zero))
    
    let likesLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return $0
    }(UILabel(frame: .zero))
    
    let viewsLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 16, weight: .regular)
        return $0
    }(UILabel(frame: .zero))
    
    func configure(title: String, image: UIImage, info: String, likes: Int, views: Int ) {
        titleLabel.text = title
        mainPictureImageView.image = image
        infoLabel.text = info
        likesLabel.text = "Likes: \(String(likes))"
        viewsLabel.text = "Views: \(String(views))"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

 extension PostTableViewCell {
    
     private func setupConstraints() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(mainPictureImageView)
        contentView.addSubview(infoLabel)
        contentView.addSubview(likesLabel)
        contentView.addSubview(viewsLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            contentView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 16),
            
            mainPictureImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            mainPictureImageView.widthAnchor.constraint(equalTo: mainPictureImageView.heightAnchor, multiplier: 1),
            mainPictureImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: mainPictureImageView.trailingAnchor),
            
            infoLabel.topAnchor.constraint(equalTo: mainPictureImageView.bottomAnchor, constant: 16),
            infoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            contentView.trailingAnchor.constraint(equalTo: infoLabel.trailingAnchor, constant: 16),
            
            likesLabel.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 32),
            likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            contentView.bottomAnchor.constraint(equalTo: likesLabel.bottomAnchor, constant: 32),
            
            viewsLabel.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 32),
            contentView.trailingAnchor.constraint(equalTo: viewsLabel.trailingAnchor, constant: 16),
            contentView.bottomAnchor.constraint(equalTo: viewsLabel.bottomAnchor, constant: 32),
        ])
    }
}
