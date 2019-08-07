//
//  ViewController.swift
//  SwiftMapKit
//
//  Created by Hoshiar Sher on 8/7/19.
//  Copyright © 2019 Hoshiar Sher. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    private let locationManager = CLLocationManager()
    
    private var currentLocation: CLLocationCoordinate2D?
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLocationServices()
    }
    
    private func configureLocationServices(){
        locationManager.delegate = self
        
        let status = CLLocationManager.authorizationStatus()
        if status == .notDetermined{
            locationManager.requestAlwaysAuthorization()
        }else if status == .authorizedAlways || status == .authorizedWhenInUse {
           beginLocationUpdates(locatonManager: locationManager)
            
        }
    }
    
    private func beginLocationUpdates(locatonManager: CLLocationManager){
        mapView.showsUserLocation = true
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    private func zoomToLatestLocation(with coordinate: CLLocationCoordinate2D){
        let zoomRegion = MKCoordinateRegion(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(zoomRegion, animated: true )
    }

}



extension ViewController: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       
        guard let latestLocation = locations.first else {
            return
        }
        
        if currentLocation == nil {
            zoomToLatestLocation(with: latestLocation.coordinate)
        }
        
        currentLocation = latestLocation.coordinate
   
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            beginLocationUpdates(locatonManager: manager)
        }
        
    }
    
}

