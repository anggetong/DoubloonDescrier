//
//  TrackingView.swift
//  DoubloonDescrier
//
//  Created by Arianne Pablo on 12/22/20.
//


import CoreLocation // allows us to get user's current location
import MapKit       // allows us to use Map features for the app
import SwiftUI

/* TRACKING VIEW */
// Tracks the robot's movements in a map
struct TrackingView: View {
    // MAP VARIABLES
    @ObservedObject var bleManager: BLEManager
    @State var pins: [Pin] = [
        Pin(title: "CSULB", coordinate: .init(latitude: 33.78322, longitude: -118.11065))]
    //let locationFetcher = LocationFetcher()
    
    /*@State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 33.78322, longitude: -118.11065), span: MKCoordinateSpan(latitudeDelta: 0.0014, longitudeDelta: 0.0014))
    */
    
    var body: some View {
            ZStack {
                // BACKGROUND
              DarkBackground()
                
                // OBJECT COUNTER DISPLAY
                VStack(alignment: .center, spacing: 10) {
                    MapView(bleManager: bleManager, pins: $pins)
                    Text("Objects Found: \(bleManager.objectsFound)")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Spacer()
                }
            }.navigationTitle("Tracking")
            .navigationBarTitleDisplayMode(.inline)

    }
}

/*struct TrackingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        TrackingView()
        }
    }
}*/
