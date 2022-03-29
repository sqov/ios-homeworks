//
//  ProfileViewController.swift
//  IB_INS_HOMEWORK1
//
//  Created by Alexander on 17.02.2022.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    private(set) var posts = [
        Post(title: "Первый тайтл", author: "Петя Паркер", description: "Обучаюсь iOS", image: "intel.png", likes: 46, views: 65),
        Post(title: "Второй тайтл", author: "Вася Васелек", description: "Обучаюсь Android", image: "apple.png", likes: 98, views: 12),
        Post(title: "Третий тайтл", author: "Иван Иваныч", description: "Обучаюсь Java", image: "meta.png", likes: 5, views: 87),
        Post(title: "Четвертый тайтл", author: "Гном Гномыч", description: "Обучаюсь Csharp", image: "disney.png", likes: 18, views: 66),
        ]
    private(set) lazy var tableView = view as! ProfileTableView
    
    override func loadView() {
        view = ProfileTableView(frame: .zero, style: .plain)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - UITableViewDataSource
extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderViewCell") as? ProfileHeaderView else { preconditionFailure() }
            cell.configure(image: .init(named: "cat.png")!, fullName: "Hipster Cat", status: "Waiting for something...")
            return cell
        } else {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as? PostTableViewCell else { preconditionFailure() }
        let post = posts[indexPath.row]
        cell.configure(title: post.title, image: .init(named: post.image)!, info: post.description, likes: post.likes, views: post.views)
        
        return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
}


// MARK: - UITableViewDelegate
extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}
