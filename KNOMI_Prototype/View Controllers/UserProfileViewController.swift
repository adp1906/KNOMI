//
//  UserProfileViewController.swift
//  KNOMI_Prototype
//
//  Created by Aaron Peterson on 6/29/20.
//  Copyright © 2020 Aaron Peterson. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    var profile: Profile?
    let backButton = UIButton()
    let nameLabel = UILabel()
    let blockButton = UIButton()
    let profileImage = UIImageView()
    let taglineLabel = UILabel()
    let messageButton = UIButton()
    let menuBar: MenuBar = {
        let mb = MenuBar()
        return mb
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .cyan
        
        configureProfileImage()
        configureBackButton()
        configureNameLabel()
        configureBlockButton()
        configureTaglineLabel()
        configureMessageButton()
        configureMenuBar()
    }
    
    // MARK: - Setup Functions
    func configureProfileImage() {
        guard let photo = profile?.userProfileImage else { return }
        profileImage.image = photo
        view.addSubview(profileImage)
        profileImage.layer.cornerRadius = 50
        profileImage.layer.masksToBounds = true
        profileImage.contentMode = .scaleAspectFill
        
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        profileImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 110).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func configureBackButton() {
        backButton.backgroundColor = .lightGray
        backButton.setTitleColor(.black, for: .normal)
        backButton.setTitle("Back", for: .normal)
        view.addSubview(backButton)
        
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
    }
    
    @objc func backButtonTapped() {
        print("BACK BUTTON TAPPED!!!")
        self.dismiss(animated: true)
    }
    
    func configureNameLabel() {
        nameLabel.backgroundColor = .lightGray
        nameLabel.textColor = .black
        nameLabel.textAlignment = .center
        nameLabel.text = "User's Name"
        view.addSubview(nameLabel)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func configureBlockButton() {
        blockButton.backgroundColor = .lightGray
        blockButton.setTitleColor(.black, for: .normal)
        blockButton.setImage(UIImage(systemName: "slash.circle"), for: .normal)
        view.addSubview(blockButton)
        
        blockButton.addTarget(self, action: #selector(blockButtonTapped), for: .touchUpInside)
        
        blockButton.translatesAutoresizingMaskIntoConstraints = false
        blockButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        blockButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
    
    @objc func blockButtonTapped() {
        print("BLOCK BUTTON TAPPED!!!")
    }
    
    func configureTaglineLabel() {
        taglineLabel.backgroundColor = .lightGray
        taglineLabel.textColor = .black
        taglineLabel.textAlignment = .left
        taglineLabel.text = "Tagline"
        view.addSubview(taglineLabel)
        
        taglineLabel.translatesAutoresizingMaskIntoConstraints = false
        taglineLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 10).isActive = true
        taglineLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        taglineLabel.topAnchor.constraint(equalTo: profileImage.topAnchor).isActive = true
        taglineLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func configureMessageButton() {
        messageButton.backgroundColor = .lightGray
        messageButton.setTitleColor(.black, for: .normal)
        messageButton.setImage(UIImage(systemName:"envelope.fill"), for: .normal)
        view.addSubview(messageButton)
        
        messageButton.addTarget(self, action: #selector(messageButtonTapped), for: .touchUpInside)
        
        messageButton.translatesAutoresizingMaskIntoConstraints = false
        messageButton.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 10).isActive = true
        messageButton.topAnchor.constraint(equalTo: taglineLabel.bottomAnchor, constant: 15).isActive = true
    }
    
    @objc func messageButtonTapped() {
        let alert = UIAlertController(title: "Notification Sent", message: "A notification was sent.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: { self.disableButton() })
        print("CHAT BUTTON TAPPED!!!")
    }
    
    func disableButton() {
        messageButton.isEnabled = false
        messageButton.setImage(UIImage(systemName: "envelope.open.fill"), for: .normal)
    }
    
    func configureMenuBar() {
        view.addSubview(menuBar)
        menuBar.translatesAutoresizingMaskIntoConstraints = false
        menuBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        menuBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        menuBar.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 10).isActive = true
        menuBar.heightAnchor.constraint(equalToConstant: 55).isActive = true
    }

}
