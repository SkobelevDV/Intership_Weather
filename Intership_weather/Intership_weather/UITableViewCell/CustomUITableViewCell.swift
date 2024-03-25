//
//  CustomUITableViewCell.swift
//  Intership_weather
//
//  Created by New on 24.03.2024.
//

import Foundation
import UIKit

class CustomTableViewCell:UITableViewCell{
    var cityLabel = UILabel()
    var timeLabel = UILabel()
    var tempMinLabel = UILabel()
    var tempLabel = UILabel()
    var tempMaxLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.firstInitializaton()
    }
    
    
//    init(){
//            }
    
     func firstInitializaton(){
         
         let heighForLabel:CGFloat = 30
         let heighOfset:CGFloat = 5
          
         let textColor:UIColor = .blue
         let labelColor:UIColor = .white
         super.contentView.backgroundColor = labelColor
         super.backgroundColor = labelColor
         
         
        super.contentView.addSubview(cityLabel)
        cityLabel.backgroundColor = labelColor
        
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            //cityLabel.bottomAnchor.constraint(equalTo:  super.contentView.bottomAnchor),
            cityLabel.leftAnchor.constraint(equalTo: super.contentView.leftAnchor),
            cityLabel.rightAnchor.constraint(equalTo: super.contentView.centerXAnchor),
            cityLabel.topAnchor.constraint(equalTo: super.contentView.topAnchor, constant: heighOfset),
            cityLabel.heightAnchor.constraint(equalToConstant: heighForLabel),// высота
            
        ])
        cityLabel.text = "city"
         cityLabel.textAlignment = .center
         cityLabel.textColor = textColor
        
        
        super.contentView.addSubview(timeLabel)
        timeLabel.backgroundColor = labelColor
        
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            //cityLabel.bottomAnchor.constraint(equalTo:  super.contentView.bottomAnchor),
            timeLabel.leftAnchor.constraint(equalTo: super.contentView.centerXAnchor),
            timeLabel.rightAnchor.constraint(equalTo: super.contentView.rightAnchor),
            timeLabel.topAnchor.constraint(equalTo: super.contentView.topAnchor, constant: heighOfset),
            timeLabel.heightAnchor.constraint(equalToConstant: heighForLabel),// высота
        ])
        timeLabel.text = "time"
         timeLabel.textAlignment = .center
         timeLabel.textColor = textColor
        
        
        
        super.contentView.addSubview(tempMinLabel)
        tempMinLabel.backgroundColor = labelColor
        
        tempMinLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            //cityLabel.bottomAnchor.constraint(equalTo:  super.contentView.bottomAnchor),
            tempMinLabel.leftAnchor.constraint(equalTo: super.contentView.leftAnchor),
            tempMinLabel.widthAnchor.constraint(equalToConstant: super.bounds.width * 0.3),
            tempMinLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: heighOfset),
            tempMinLabel.heightAnchor.constraint(equalToConstant: heighForLabel),// высота
        ])
        tempMinLabel.text = "tempMin"
         tempMinLabel.textAlignment = .left
         tempMinLabel.textColor = textColor
       
        super.contentView.addSubview(tempLabel)
        tempLabel.backgroundColor = labelColor
        
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            //cityLabel.bottomAnchor.constraint(equalTo:  super.contentView.bottomAnchor),
            tempLabel.centerXAnchor.constraint(equalTo: super.centerXAnchor),
            tempLabel.widthAnchor.constraint(equalToConstant: super.bounds.width * 0.3),
            
            tempLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: heighOfset),
            tempLabel.heightAnchor.constraint(equalToConstant: heighForLabel),// высота
        ])
        tempLabel.text = "temp"
         tempLabel.textAlignment = .center
         tempLabel.textColor = textColor
        
        
        super.contentView.addSubview(tempMaxLabel)
        tempMaxLabel.backgroundColor = labelColor
        
        tempMaxLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            //cityLabel.bottomAnchor.constraint(equalTo:  super.contentView.bottomAnchor),
            tempMaxLabel.widthAnchor.constraint(equalToConstant:  super.bounds.width * 0.3),

            tempMaxLabel.rightAnchor.constraint(equalTo: super.contentView.rightAnchor),
            tempMaxLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: heighOfset),
            tempMaxLabel.heightAnchor.constraint(equalToConstant: heighForLabel),// высота
        ])
        tempMaxLabel.text = "tempMax"
         tempMaxLabel.textAlignment = .center
         tempMaxLabel.textColor = textColor
    }
    
    override var reuseIdentifier: String?{
        return "CustomTableViewCell"
    }
    

    
}
