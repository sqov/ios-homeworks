//
//  PhotosCollectionViewCell.swift
//  IB_INS_HOMEWORK1
//
//  Created by Muller Alexander on 05.04.2022.
//

import UIKit

final class PhotosCollectionViewCell: UICollectionViewCell {
    static var id = "\(Bundle.main.bundleIdentifier!).\(NSStringFromClass(PhotosCollectionViewCell.self))"
    
    let imageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView(image: nil))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(by image: UIImage) {
        imageView.image = image
    }
}

extension PhotosCollectionViewCell {
    
    private func setupConstraints() {
        contentView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor)
        ])
    }
}
