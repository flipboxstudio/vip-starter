//
//  Location.swift
//  Base Project
//
//  Created by Saminos on 08/06/17.
//  Copyright © 2017 Flipbox. All rights reserved.
//

import UIKit
import CoreLocation

class LocationInterface {
  
}

class Location:NSObject, CLLocationManagerDelegate {
  
  private static var shared:Location?
  private let locationManager = CLLocationManager()
  private var viewController:UIViewController?
  
  //MARK: - accesible function
  static func getLocation(viewController:UIViewController?) {
    shared = Location()
    shared?.viewController = viewController
    shared?.settingLocationManager()
  }
  
  //MARK: - event handling
  private func settingLocationManager() {
    locationManager.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.distanceFilter = 10.0
    locationManager.startUpdatingLocation()
  }
  
  private func showAlert() {
    let alert = Alert(title: "Geolocation is not enabled", message: "For using geolocation you need to enable it in Settings", preferredStyle: .actionSheet)
    
    alert.addAction(
      UIAlertAction(title: "Open Settings", style: .default, handler: { ( action) in
        self.openAlert()
      })
    )
    
    alert.addAction(
      UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    )
    
    viewController?.present(alert, animated: true, completion: nil)
  }
  
  private func openAlert() {
    let path = UIApplicationOpenSettingsURLString
    if let settingsURL = URL(string: path), UIApplication.shared.canOpenURL(settingsURL) {
      UIApplication.shared.open(settingsURL)
    }
  }
  
  //MARK: - location manager delegate
  
  internal func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    
    if status == .authorizedWhenInUse {
      locationManager.requestWhenInUseAuthorization()
    } else {
      showAlert()
    }
  }
  
  internal func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let location = locations.first else { return }
    manager.stopUpdatingLocation()
    print("location : \(location)")
    Location.shared = nil
  }
  
}





