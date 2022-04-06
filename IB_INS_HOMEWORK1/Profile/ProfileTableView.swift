//
//  ProfileTableView.swift
//  IB_INS_HOMEWORK1
//
//  Created by Muller Alexander on 29.03.2022.
//

import UIKit

final class ProfileTableView: UITableView {

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        register()
        separatorStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ProfileTableView {
    
    private func register() {
        register(PostTableViewCell.self, forCellReuseIdentifier: "PostCell")
        register(ProfileHeaderView.self, forCellReuseIdentifier: "HeaderViewCell")
        register(PhotoTableViewCell.self, forCellReuseIdentifier: "PhotoCell")
    }
}
