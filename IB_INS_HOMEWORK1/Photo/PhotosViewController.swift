//
//  PhotosViewController.swift
//  IB_INS_HOMEWORK1
//
//  Created by Muller Alexander on 05.04.2022.
//

import UIKit

class PhotosViewController: UIViewController {


    private let images = [UIImage(named: "img1.jpg"), UIImage(named: "img2.jpg"), UIImage(named: "img3.jpg"), UIImage(named: "img4.jpg"),UIImage(named: "img1.jpg"), UIImage(named: "img2.jpg"), UIImage(named: "img3.jpg"), UIImage(named: "img4.jpg"),UIImage(named: "img1.jpg"), UIImage(named: "img2.jpg"), UIImage(named: "img3.jpg"), UIImage(named: "img4.jpg"),UIImage(named: "img1.jpg"), UIImage(named: "img2.jpg"), UIImage(named: "img3.jpg"), UIImage(named: "img4.jpg"),UIImage(named: "img1.jpg"), UIImage(named: "img2.jpg"), UIImage(named: "img3.jpg"), UIImage(named: "img4.jpg"),UIImage(named: "img1.jpg"), UIImage(named: "img2.jpg"), UIImage(named: "img3.jpg"), UIImage(named: "img4.jpg"),UIImage(named: "img1.jpg"), UIImage(named: "img2.jpg"), UIImage(named: "img3.jpg"), UIImage(named: "img4.jpg"),UIImage(named: "img1.jpg"), UIImage(named: "img2.jpg"), UIImage(named: "img3.jpg"), UIImage(named: "img4.jpg"),UIImage(named: "img1.jpg"), UIImage(named: "img2.jpg"), UIImage(named: "img3.jpg"), UIImage(named: "img4.jpg"),UIImage(named: "img1.jpg"), UIImage(named: "img2.jpg"), UIImage(named: "img3.jpg"), UIImage(named: "img4.jpg")]
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 8 // минимальный отступ между ячейками
        layout.minimumLineSpacing = 8 //  отступ между строками, на которых располагаются ячейки;
        layout.scrollDirection = .vertical
        
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.dataSource = self
        collection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.id)
        collection.delegate = self
        collection.contentInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        view.backgroundColor = .systemBackground
    }
    
    private func setup() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor)
        ])
    }
}

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.id, for: indexPath) as? PhotosCollectionViewCell else { preconditionFailure() }
        
        print(PhotosCollectionViewCell.id)
        let image = images[indexPath.row]
        cell.configure(by: image!)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let sizeLength = (collectionView.bounds.width - (8 + 8) - 2 * 8) / 3
        
        return  CGSize(width: sizeLength, height: sizeLength)
    }
}
