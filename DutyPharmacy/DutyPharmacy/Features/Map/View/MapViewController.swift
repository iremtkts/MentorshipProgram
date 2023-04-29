//
//  MapViewController.swift
//  DutyPharmacy
//
//  Created by iremt on 28.04.2023.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController{

    @IBOutlet weak var mapView: MKMapView!
    var selectedPharmacy : Pharmacy?
    
    var locationManager = CLLocationManager()
    var mapViewModel = MapViewModel()
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

}

extension MapViewController : MKMapViewDelegate , CLLocationManagerDelegate{
    
}

