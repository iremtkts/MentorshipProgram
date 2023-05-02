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
        
        mapView.isUserInteractionEnabled = true

       
        // add annotation
        if let selectedPharmacy = selectedPharmacy, let location = mapViewModel.getSelectedPharmacyLocation(from: selectedPharmacy) {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
            annotation.title = "Eczane \(selectedPharmacy.name)"
            annotation.subtitle = "Telefon : \(selectedPharmacy.phone)"
            mapView.addAnnotation(annotation)
            mapView.selectAnnotation(annotation, animated: true)
        }

     
    }

}

extension MapViewController : MKMapViewDelegate , CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let selectedPharmacy = selectedPharmacy, let location = mapViewModel.getSelectedPharmacyLocation(from: selectedPharmacy) {
            let coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
            let span = MKCoordinateSpan(latitudeDelta: 0.35, longitudeDelta: 0.35)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            mapView.setRegion(region, animated: true)
        }
    }
            
     
    
}

