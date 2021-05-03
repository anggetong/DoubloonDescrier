//
//  MapManager.swift
//  DoubloonDescrier
//
//  Created by Arianne Pablo on 5/3/21.
//

import Foundation
import CoreLocation
import MapKit
import SwiftUI

final class Pin: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
}

struct MapView: UIViewRepresentable {
    @ObservedObject var bleManager: BLEManager
    var locationManager = CLLocationManager()
    
    func setupManager() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        //locationManager.requestAlwaysAuthorization()
    }
    
    @Binding var pins: [Pin]
    
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        setupManager()
        let mapView = MKMapView(frame: UIScreen.main.bounds)
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: UIViewRepresentableContext<MapView>) {
        if (bleManager.found) {
            pins.append(Pin(title: bleManager.objectsFound, coordinate: .init(latitude: bleManager.latitude, longitude: bleManager.longitude)))
            bleManager.found = false
        }
        view.addAnnotations(pins)
    }
}
/*
class LocationFetcher: NSObject, CLLocationManagerDelegate {
    let locManager = CLLocationManager()
    var lastKnownLocation: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        locManager.delegate = self
    }
    
    func start() {
        locManager.requestWhenInUseAuthorization()
        locManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lastKnownLocation = locations.first?.coordinate
    }
    
}
*/
