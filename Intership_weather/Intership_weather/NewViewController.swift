//
//  NewViewController.swift
//  Intership_weather
//
//  Created by New on 24.03.2024.
//
//
//  ProfileViewController.swift
//  Intership_weather
//
//  Created by New on 24.03.2024.
//

//import Foundation
import UIKit

struct Profile{
    let name: String
    let email: String
    var status: String
}

final class ProfileViewController: UIViewController{
    private let infoLabel = UILabel()
    private let editButton = UIButton(type:.system)
    
    private var model = Profile (name:"ar",email:"..@vk.com",status: "prog")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        configure()
    }
    
}

private extension ProfileViewController{
    func setup() {
        setupLayout()
        setupAppearence()
    }
    
    func setupLayout(){
        view.addSubview(infoLabel)
        view.addSubview(editButton)
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 48),
            infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -48)
        ])
        
        editButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            editButton.topAnchor.constraint(equalTo: infoLabel.bottomAnchor,constant: 40),
            editButton.widthAnchor.constraint(equalToConstant: 200),
            editButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setupAppearence(){
        view.backgroundColor = .black
        
        infoLabel.numberOfLines = 0
        infoLabel.textAlignment = .center
        
        
        editButton.setTitle("editStatus", for: .normal)
        editButton.addTarget(self, action: #selector(didTapEditBotton), for: .touchUpInside)
        
    }
    
    @objc
    func didTapEditBotton(){
        model.status = "chilling in dubai"
        configure()
    }
    
    func configure(){
        let infoLAbelTitle = "\(model.name)\n\(model.email)\n\(model.status)"
        let infoLabelAttributedString = NSAttributedString(
            string:infoLAbelTitle,
            attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20),
                NSAttributedString.Key.foregroundColor: UIColor.white
            ]
        )
        infoLabel.attributedText = infoLabelAttributedString
    }
}
