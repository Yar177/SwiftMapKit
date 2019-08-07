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
    

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLocationServices()

    }
    
    private func configureLocationServices(){
        locationManager.delegate = self
        if CLLocationManager.authorizationStatus() == .notDetermined{
            locationManager.requestAlwaysAuthorization()
        }else{
            
        }
        
        
    }


}



extension ViewController: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
    }
    
}

