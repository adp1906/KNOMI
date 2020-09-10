//
//  ProfileCollectionViewController.swift
//  KNOMI_Prototype
//
//  Created by Aaron Peterson on 6/14/20.
//  Copyright © 2020 Aaron Peterson. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ProfileCell"

class ProfileCollectionViewController: UIViewController {
    
    private var collectionView: UICollectionView?
    let profileController = ProfileController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Near You"
        
        configureCollectionView()
    }

    // MARK: - Private
    
    private func configureCollectionView() {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        
        let numberOfItemsPerRow: CGFloat = 3
        let lineSpacing: CGFloat = 1
        let interItemSpacing: CGFloat = 1
        
        let width = (self.view.bounds.size.width - (numberOfItemsPerRow - 1) * interItemSpacing) / numberOfItemsPerRow
        let height = width
        
        collectionViewFlowLayout.itemSize = CGSize(width: width, height: height)
        collectionViewFlowLayout.sectionInset = UIEdgeInsets.zero
        collectionViewFlowLayout.scrollDirection = .vertical
        collectionViewFlowLayout.minimumLineSpacing = lineSpacing
        collectionViewFlowLayout.minimumInteritemSpacing = interItemSpacing
        
        let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: collectionViewFlowLayout)
        collectionView.backgroundColor = .blue
        
        view.addSubview(collectionView)
        
        collectionView.register(ProfileCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        self.collectionView = collectionView
        
    }


}

// MARK: UICollectionViewDataSource
extension ProfileCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profileController.profiles.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ProfileCollectionViewCell else { return UICollectionViewCell() }
    
        cell.profileImage.image = UIImage(named: profileController.profiles[indexPath.item].profileImageName)
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userProfileVC = UserProfileViewController()
        let profileController = ProfileController()
        userProfileVC.profile = profileController.profiles[indexPath.item]
        
        navigationController?.modalPresentationStyle = .overFullScreen
        navigationController?.present(userProfileVC, animated: true)
    }
    
}
