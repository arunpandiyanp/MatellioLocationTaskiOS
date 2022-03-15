//
//  ViewController.swift
//  MatellioLocationTask
//
//  Created by Closerlook on 15/03/22.
//

import UIKit
import CoreLocation
import MapKit
class ViewController: UIViewController {
    let locationManager = CLLocationManager()
    var mapView =  MKMapView()
    func fetchlocation()
    {
        //requestAlwaysAuthorization  and requestWhenInUseAuthorization for request permission
                 self.locationManager.requestAlwaysAuthorization()
                self.locationManager.requestWhenInUseAuthorization()
        // if location permission is enabled need to call delegates and set location Accuracy (optional)

                if CLLocationManager.locationServicesEnabled() {
                  locationManager.delegate = self
                  locationManager.desiredAccuracy = kCLLocationAccuracyBest
                    
                    self.locationManager.allowsBackgroundLocationUpdates = true
                    self.locationManager.showsBackgroundLocationIndicator = true
                    self.locationManager.pausesLocationUpdatesAutomatically = false
                    
                  locationManager.startUpdatingLocation()
                   // Once Start Update location delegate method didUpdateLocations call everytime fetch user location . if need one time only means once call in  didUpdateLocations method we will implement code stopupdatelcoation in  didUpdateLocations method
                }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(mapView)
        mapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        mapView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        mapView.showsUserLocation = true
        fetchlocation()
        
    }


}

extension ViewController:CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
    }
}
