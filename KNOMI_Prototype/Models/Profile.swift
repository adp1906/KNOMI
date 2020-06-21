//
//  Profile.swift
//  KNOMI_Prototype
//
//  Created by Aaron Peterson on 6/14/20.
//  Copyright © 2020 Aaron Peterson. All rights reserved.
//

import Foundation
import UIKit

struct Profile {
    let userProfileImage: UIImage
    let profileImageName: String
    
    init(name: String) {
        self.profileImageName = name
        self.userProfileImage = UIImage(named: name)!
    }
}
