//
//  PostTableViewCell.swift
//  IB_INS_HOMEWORK1
//
//  Created by Muller Alexander on 26.03.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    let post = Post()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Петя петушок золотой гребешок"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 2
        
        return label
    }()
    
    let mainPictureImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "intel.png"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        
        return imageView
    }()
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        label.text = "Если кто и знает, как выбирать акции, так это "
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        
        return label
    }()
    
    let likesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Likes: "
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        
        return label
    }()
    
    let viewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Views: \(post.views)"
        label.text = "Views: "
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        
        return label
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setupConstraints() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(mainPictureImageView)
        contentView.addSubview(infoLabel)
        contentView.addSubview(likesLabel)
        contentView.addSubview(viewsLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            mainPictureImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            mainPictureImageView.widthAnchor.constraint(equalTo: mainPictureImageView.heightAnchor, multiplier: 1/1),
            mainPictureImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainPictureImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            infoLabel.topAnchor.constraint(equalTo: mainPictureImageView.bottomAnchor, constant: 20),
            infoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            infoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            likesLabel.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 20),
            likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            likesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40),
            
            viewsLabel.centerYAnchor.constraint(equalTo: likesLabel.centerYAnchor, constant: 0),
            viewsLabel.leadingAnchor.constraint(equalTo: likesLabel.trailingAnchor, constant: 20),
            viewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
}
