//
//  LocationManager.swift
//  Intership_weather
//
//  Created by New on 25.03.2024.
//

import Foundation
import UIKit
import CoreLocation
import CoreMotion

//final class LocationManager: NSObject, CLLocationManagerDelegate {
//    private let locationManager = CLLocationManager()
//    private let motionManager = CMMotionActivityManager()
//
//    //private var coordinates: [Double]
////    private var city: String
//
////    func getCity() -> String {
////        return city
////    }
////    func getLocation() -> [Double] {
////        return coordinates
////    }
//
//    override init() {
//        super.init()
//
//        locationManager.delegate = self
//        locationManager.requestAlwaysAuthorization()
//        locationManager.allowsBackgroundLocationUpdates = true
//        locationManager.pausesLocationUpdatesAutomatically = false
//        setActiveMode(true)
//        locationManager.startUpdatingLocation()
//        locationManager.startMonitoringSignificantLocationChanges()
//
//        motionManager.startActivityUpdates(to: .main, withHandler: { [weak self] activity in
//            self?.setActiveMode(activity?.cycling ?? false)
//        })
//    }
//
//    func setActiveMode(_ value: Bool) {
//        if value {
//            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
//            locationManager.distanceFilter = 10
//        } else {
//            locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
//            locationManager.distanceFilter = CLLocationDistanceMax
//        }
//    }
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        let userLocation = locations.last! as CLLocation
//            let geoCoder = CLGeocoder()
//
//            geoCoder.reverseGeocodeLocation(userLocation, completionHandler: { (placemarks, error) -> Void in
//                if let city = placemarks?[0].locality {
//                    //self.city = city
//                }
//            })
//
//            //coordinates = [(userLocation.coordinate.latitude),(userLocation.coordinate.longitude)]
//
//    }
//}

final class LocationManager : UIViewController {
//    private init (){super.init()}
//    static let shared:LocationManager = LocationManager ()

    func getAddressFromLatLon(pdblLatitude: String, withLongitude pdblLongitude: String) {
            
//    func getCity() -> String {
//        return city
//    }
//    func getLocation() -> [Double] {
//        return coordinates
//    }

    // var coordinates: [Double]
     //var city: String

//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }






    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation = locations.last! as CLLocation
        let geoCoder = CLGeocoder()

        geoCoder.reverseGeocodeLocation(userLocation, completionHandler: { (placemarks, error) -> Void in
            if let city = placemarks?[0].locality {
              //  self.city = city
            }
        })

        let coordinates = [(userLocation.coordinate.latitude),(userLocation.coordinate.longitude)]
        print (coordinates)
    }


}
}
