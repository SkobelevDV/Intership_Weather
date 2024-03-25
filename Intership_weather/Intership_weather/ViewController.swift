//
//  ViewController.swift
//  Intership_weather
//
//  Created by New on 24.03.2024.
//

import UIKit
import MapKit

final class ViewController: UIViewController, MKMapViewDelegate {
    private var mapView = MKMapView()
    
    private let openButton = UIButton()
    private let cityLabel = UILabel()
    private let tempLabel = UILabel()
    private let tempMinLabel = UILabel()
    private let tempMaxLabel = UILabel()
    
    var locationManager = CLLocation()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.showsUserLocation = true
        mapView.delegate = self
        locationManager
        setup()
        
        locationManager
    }
    
    // получаем текущие координаты по GPS

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[0] //.last
        let myLocation = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: myLocation, span: span)
        
        mapView.setRegion(region, animated: true)
        self.mapView.showsUserLocation = true
        //coordinateToAdress(locations.last!)
        print (mapView.centerCoordinate.latitude)
        print (mapView.centerCoordinate.longitude)
    }

    // получаем координаты по нажатию
    func foundTap(_ recognizer: UITapGestureRecognizer) {
        let point: CGPoint = recognizer.location(in: mapView)
        let tapPoint: CLLocationCoordinate2D = mapView.convert(point, toCoordinateFrom: view)
        let point1 = MKPointAnnotation()
        point1.coordinate = tapPoint
        mapView.addAnnotation(point1)
        let getLat: CLLocationDegrees = tapPoint.latitude
        let getLon: CLLocationDegrees = tapPoint.longitude
        let locationTouch: CLLocation =  CLLocation(latitude: getLat, longitude: getLon)
        //coordinateToAdress(locationTouch)
        
        print (getLat)
        print (getLon)
    }

//    // Преобразуем координаты в Адрес
//    func coordinateToAdress(_ locations: CLLocation) {
//        geocode.reverseGeocodeLocation(locations /*.last!*/) { (placemarks, error) in
//            // Детализированная информация по точке
//            var placemark: CLPlacemark!
//
//            if let placemarks = placemarks {
//                placemark = placemarks[0]
//            }
//            // Словарь адресов
//            //            print(placemark.addressDictionary!)
//
//            // Вытаскиваем атрибуты адреса
//            if let country = placemark.addressDictionary!["Country"] as? NSString {
//                print("Country name \(country)")
//            }
//
//            self.city = (placemark.addressDictionary!["City"] as? NSString)!
//
//            print("City name \(self.city)")
//
//            // Street address
//            if let street = placemark.addressDictionary!["Thoroughfare"] as? NSString {
//                print(street)
//            }
//            self.delay(15, closure: {
//                self.showAlertLocation()
//            })
//        }
//    }
    
    
    
    
    
    func getAddress () {
//        let userLocation = mapView.userLocation
//
//        let geoCoder = CLGeocoder()
//        var placemark: AnyObject
//        var error: NSError
//        geoCoder.reverseGeocodeLocation(userLocation.location!, completionHandler: { (placemark, error) -> Void in
//            if error != nil {
//                print("Error: \(String(describing: error?.localizedDescription))")
//                return
//            }
//            if placemark!.count > 0 {
//                let pm = (placemark?[0])! as CLPlacemark
//                print( "\(pm.locality), \(pm.country)")
//            } else {
//                print("Error with data")
//            }
//        })
//        let region = MKCoordinateRegion(center: (userLocation.location?.coordinate)!,latitudinalMeters: 1000,longitudinalMeters: 1000)
//        mapView.setRegion(region, animated: true)
//        var longitude: CLLocationDegrees = (self.locationManager.coordinate.longitude)
//        var latitude : CLLocationDegrees = (self.locationManager.coordinate.latitude)
//
//        print (longitude)
//        print (latitude)
    }
}

private extension ViewController {
    func setup() {
        setupLayout()
        setupAppearence()
    }

    func setupLayout() {
        view.addSubview(openButton)
        view.backgroundColor = .systemBlue
        openButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            //openButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            openButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            openButton.centerXAnchor.constraint(equalTo: view.centerXAnchor), //
            openButton.widthAnchor.constraint(equalToConstant: 200),//ширина
            openButton.heightAnchor.constraint(equalToConstant: 50)// высота
            
  
        ])
        
        view.addSubview(mapView)
    }

    func setupAppearence() {
        //view.backgroundColor = .systemGray

        openButton.setTitle("Выбрать город", for: .normal)
        openButton.addTarget(self, action: #selector(didTapOpenButton), for: .touchUpInside)
    }

    @objc
    func didTapOpenButton() {
        let weatherViewController = WeatherAssembler.assembly()
        navigationController?.pushViewController(weatherViewController, animated: true)
    }
    
    
    
}

