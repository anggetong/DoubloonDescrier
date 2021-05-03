//
//  ContentView.swift
//  DoubloonDescrier
//
//  Created by Arianne Pablo on 11/9/20.
//

import SwiftUI      // allows us to use SwiftUI built-in components for our app

// MAIN VIEW
struct ContentView: View {
    @StateObject var bleManager = BLEManager()
    
    var body: some View {
        
        // TABS containing the different categories of the app
        TabView {
            /* HOME TAB */
            // includes the Welcome Screen for the app
            HomeView(bleManager: bleManager)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            /* TRACKING TAB */
            // includes the map and tracker for the flags
            NavigationView{
                TrackingView(bleManager: bleManager)
            }
            .tabItem {
                Image(systemName: "location.fill")
                Text("Tracking")
            }
            
            /* MORE TAB */
            // includes settings as well as other information
            MoreView()
            .tabItem {
                Image(systemName: "ellipsis")
                Text("More")
            }
        }
        .preferredColorScheme(.dark)
        .accentColor(.orange)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
