//
//  WeatherViewController.swift
//  Intership_weather
//
//  Created by New on 24.03.2024.
//

import Foundation

import UIKit

final class WeatherViewController: UIViewController, UISearchResultsUpdating{
    
    
    
    
                                   //UITableViewDataSource, UITableViewDelegate {

//    private let infoLabel = UILabel()
//    private let editButton = UIButton(type: .system)
    //var customCell1 = CustomTableViewCell()
    var customCells:[CustomTableViewCell] = [CustomTableViewCell(),CustomTableViewCell(),CustomTableViewCell(),CustomTableViewCell(),CustomTableViewCell(),CustomTableViewCell(),CustomTableViewCell()]
    
//    init (model: WeatherModel){
//        //self.model = model // подписка на обработку событий, которые происходят в модели
//
//       // super.init(nibName: nil, bundle: nil)
//    }
    

    //var locationManager = LocationManager()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        (self.view as! MainView).tableView.dataSource = self
        setup()
        self.setupNavigationBar()
//        model.loadWeather() //загрузка профиля - Controller update model
        
    }
    
    //private var model = WeatherModel()
    // Table Wiew
//    fileprivate var contentView:MainView{
//        return self.view as! MainView
//    }
//    private let mainView = MainView()
//    private let customuiCell = CustomTableViewCell()
    var timer = Timer()
    var offerModel : OfferModel?
//        didSet {
//            self.contentView.tableView.reloadData()
//        }
//    }
    
    
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.offerModel!.list!.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as! CustomTableViewCell
//        cell.cityLabel.text = self.offerModel!.city!.name
//        cell.timeLabel.text = self.offerModel!.list![indexPath.row].dt_txt
//        cell.tempMinLabel.text = self.offerModel!.list![indexPath.row].main!.temp_min!.description
//        cell.tempLabel.text = self.offerModel!.list![indexPath.row].main!.temp!.description
//        cell.tempMaxLabel.text = self.offerModel!.list![indexPath.row].main!.temp_max!.description
//
//        return cell
//    }
    
    
    
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        super.init(nibName: "CustomView", bundle: Bundle.main)
//
//    }
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
    
    
//    override func loadView() {
//        self.view = MainView()
//    }
    
    
    fileprivate func setupNavigationBar(){
        self.navigationItem.title = "Погода"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let searchController = UISearchController (searchResultsController: nil)
        searchController.searchResultsUpdater = self
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
    }
    
    func updateCells() {
        if offerModel != nil {
            self.customCells[0].cityLabel.text = offerModel!.city!.name
            setupLayout()
//            self.customCell1.timeLabel.text = model!.list?.description
    //                        self.customCell1.tempMinLabel.text = model!.list![indexPath.row].main!.temp_min!.description
    //                        self.customCell1.tempLabel.text = model!.list![indexPath.row].main!.temp!.description
    //                        self.customCell1.tempMaxLabel.text = model!.list![indexPath.row].main!.temp_max!.description
        }
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let city = searchController.searchBar.text!
        timer.invalidate()
        
        print (city)
        if city.count > 1  {
            timer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false, block: { timer in
                NetworkManager.shared.getWeather(city: city, result:{ (model) in
                //(city : city , result: { (model) in
                    if model != nil {
        
                        print ("Всё Ок")
                        self.updateCells()
                    }
                    else {
                        print ("model = nil")
                    }
                    
                })
            })
        }
        
        
    print (searchController.searchBar.text)
        
    }
    
    
    
    
}

private extension WeatherViewController {
    func setup() {
        setupLayout()
        setupAppearence()
    }

    func setupLayout() {
//        view.addSubview(infoLabel)
//        view.addSubview(editButton)
//
//        infoLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            infoLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 48),
//            infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -48)
//        ])
//
//        editButton.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            editButton.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 48),
//            editButton.widthAnchor.constraint(equalToConstant: 200),
//            editButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//        ])
        
        
        
//        mainView.awakeFromNib()
//        view.addSubview(mainView)
//        mainView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            //openButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor), //
//            mainView.widthAnchor.constraint(equalTo: view.widthAnchor),//ширина
//            mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30 )
//        ])
        
        self.view.addSubview(customCells[0])
        customCells[0].firstInitializaton()
        customCells[0].translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            //openButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            customCells[0].heightAnchor.constraint(equalToConstant: 20),
            customCells[0].centerXAnchor.constraint(equalTo: view.centerXAnchor), //
            customCells[0].widthAnchor.constraint(equalTo: view.widthAnchor),//ширина
            customCells[0].topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20 )
            
            
        ])
        
        
        
        for i in 1...6 {
            self.view.addSubview(customCells[i])
            customCells[i].firstInitializaton()
            customCells[i].translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                customCells[i].leftAnchor.constraint(equalTo: customCells[i-1].leftAnchor),
                customCells[i].rightAnchor.constraint(equalTo: customCells[i-1].rightAnchor),
                customCells[i].topAnchor.constraint(equalTo: customCells[i-1].bottomAnchor, constant: 60 ),
                customCells[i].heightAnchor.constraint(equalToConstant: 20)

            ])
        }
        
        
        
        
    }

    func setupAppearence() {
        view.backgroundColor = .blue

//        infoLabel.numberOfLines = 0
//        infoLabel.textAlignment = .center
//        infoLabel.textColor = .systemPink
//        infoLabel.font = .systemFont(ofSize: 28)
//
//        editButton.setTitle("Поменять статус", for: .normal)
//        editButton.addTarget(self, action: #selector(didTapEditButton), for: .touchUpInside)
    }

//    @objc
//    func didTapEditButton() {
//        model.changeStatus(with: "")
//    }
}

extension WeatherViewController: WeatherViewInput {
    func onModelChanged() {
//        guard !model.isLoading else {
//            infoLabel.text = "Идет загрузка..."
//            return
//        }
//        if let error = model.error {
//            infoLabel.text = error.rawValue
//            return
//        }
//
//        guard let weather = model.weather else {
//            return
//        }
//        let infoLabelTitle = "\(weather.name)\n\(weather.email)\n\(weather.status)"
//        let infoLabelAttributedString = NSAttributedString(
//            string: infoLabelTitle,
//            attributes: [
//                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 32),
//                NSAttributedString.Key.foregroundColor: UIColor.white
//
//            ]
//        )
//        infoLabel.attributedText = infoLabelAttributedString
    }
}
