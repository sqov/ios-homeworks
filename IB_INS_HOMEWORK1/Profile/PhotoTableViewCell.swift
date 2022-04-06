//
//  PhotoTableViewCell.swift
//  IB_INS_HOMEWORK1
//
//  Created by Muller Alexander on 05.04.2022.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .label
        $0.font = .boldSystemFont(ofSize: 24)
        $0.text = "Photos"
        //        $0.font = .preferredFont(forTextStyle: .title2)     Лучше сделать так, но сделаю как просите
        return $0
    }(UILabel.init(frame: .zero))   
    
    private(set) lazy var moreButton: MyButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        $0.tintColor = .black
        $0.touchAreaMultiplayer = 2
        $0.addTarget(self, action: #selector(moreButtonHandler(sender:)), for: .touchUpInside)
        //        $0.tintColor = .label      Лучше сделать так, но сделаю как просите
        return $0
    }(MyButton(type: .system))
    
    let stackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.spacing = 8
        $0.distribution = .fillEqually
        
        return $0
    }(UIStackView(frame: .zero))
    
    weak var delegate: PhotoTableViewCellDelegate?
    
    func configure(photos: [UIImage]) {
        for arrangedSubview in stackView.arrangedSubviews {
            arrangedSubview.removeFromSuperview()
        }
        
        for photo in photos {
            let imageView = UIImageView(image: photo)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
            imageView.layer.cornerCurve = .continuous
            imageView.layer.cornerRadius = 6
            imageView.clipsToBounds = true
            imageView.contentMode = .scaleAspectFill
            stackView.addArrangedSubview(imageView)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PhotoTableViewCell {
    
    private func setupConstraints() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(moreButton)
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            
            contentView.trailingAnchor.constraint(equalTo: moreButton.trailingAnchor, constant: 12),
            moreButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            contentView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 12),
            contentView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 12)
        ])
    }
}

extension PhotoTableViewCell {
    @objc private func moreButtonHandler(sender: UIButton) {
        delegate?.moreButtonDidTapped(in: self)
    }
}

protocol PhotoTableViewCellDelegate: AnyObject {
    func moreButtonDidTapped(in cell: PhotoTableViewCell)
}

final class MyButton: UIButton {
    var touchAreaMultiplayer: CGFloat = 1.0
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let widthDiff = (bounds.width * touchAreaMultiplayer - bounds.width) / 2.0
        let heightDiff = (bounds.height * touchAreaMultiplayer - bounds.height) / 2.0
        let minDiff = min(widthDiff, heightDiff)
        return bounds.insetBy(dx: -minDiff, dy: -minDiff).contains(point)
    }
}
