//
//  MainView.swift
//  Intership_weather
//
//  Created by New on 24.03.2024.
//

import Foundation
import UIKit

class MainView : UIView {
     let tableView = UITableView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.firstInitializaton()
    }
    
//    private init(){
//        firstInitializaton()
//        setupConstraints()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    fileprivate func firstInitializaton(){
        
        self.tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        setupConstraints()
        
        
    }
    
    fileprivate func setupConstraints(){

        super.addSubview(tableView)
        tableView.backgroundColor = .green
        super.backgroundColor = .yellow
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            //cityLabel.bottomAnchor.constraint(equalTo:  super.contentView.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: super.leftAnchor, constant: 20 ), //
            tableView.rightAnchor.constraint(equalTo: super.rightAnchor, constant: -20 ), //
            tableView.bottomAnchor.constraint(equalTo: super.bottomAnchor, constant : -50),// высота
            tableView.topAnchor.constraint(equalTo: super.topAnchor, constant : 50)// высота
            
            
        ])
        
    }
        
}


