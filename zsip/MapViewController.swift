//
//  MapViewController.swift
//  zsip
//
//  Created by ELIAS PERIAÑEZ AGUILERA on 30/11/18.
//  Copyright © 2018 ELIAS PERIAÑEZ AGUILERA. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    var locationToShow:CLLocation!
    @IBOutlet weak var mapView: MKMapView!
    
    
    convenience init(lat: Double!, lng: Double!) {
        self.init()
        self.locationToShow = CLLocation(latitude: lat, longitude: lng)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = (locationToShow?.coordinate)!
        mapView.addAnnotation(annotation)
        let region = MKCoordinateRegionMakeWithDistance((locationToShow?.coordinate)!, 2000, 2000)
        mapView.setRegion(region, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func segmentedControlTypeDidChange(_ sender: Any) {
        let segment = sender as! UISegmentedControl
        switch segment.selectedSegmentIndex{
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .satellite
        case 2:
            mapView.mapType = .hybrid
        default:
            mapView.mapType = .standard
        }
}
}
