//
//  ProfileViewController.swift
//  IB_INS_HOMEWORK1
//
//  Created by Alexander on 17.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let tableView = UITableView()
    
    
    var images = ["intel.png", "apple.png", "meta.png", "disney.png"]
    
    //    override func loadView() {
    //        super.loadView()
    //        setupTableView()
    //    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        tableView.reloadData()
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableViewCell")
    }
}


extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell") as? PostTableViewCell
        
        let img = images[indexPath.row]
        
        cell?.mainPictureImageView.image = UIImage(named: img)
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return section == 0 ? ProfileHeaderView() : nil
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
}
