//
//  ProfileCollectionViewCell.swift
//  KNOMI_Prototype
//
//  Created by Aaron Peterson on 6/14/20.
//  Copyright © 2020 Aaron Peterson. All rights reserved.
//

import UIKit

class ProfileCollectionViewCell: BaseCell {
    let profileImage = UIImageView()
    
    var profile: Profile? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - Initializatiom
    
    // MARK: - Private
    func updateViews() {
        guard let profile = profile else { return }
        profileImage.image = profile.userProfileImage
    }
    
    override func setupViews() {
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.contentMode = .scaleAspectFill
        profileImage.layer.masksToBounds = true
        
        self.addSubview(profileImage)
        
        profileImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        profileImage.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        profileImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        profileImage.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    
}
