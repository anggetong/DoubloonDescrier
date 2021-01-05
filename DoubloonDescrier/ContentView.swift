//
//  ContentView.swift
//  DoubloonDescrier
//
//  Created by Arianne Pablo on 11/9/20.
//

import SwiftUI      // allows us to use SwiftUI built-in components for our app

// MAIN VIEW
struct ContentView: View {
    var body: some View {
        TabView {
            // HOME TAB
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            // TRACKING TAB
            NavigationView{
                TrackingView()
            }
            .tabItem {
                Image(systemName: "location.fill")
                Text("Tracking")
            }
            
            // MORE TAB
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







/* HOW TO PAGE */
struct HowTo: View {
    var body: some View {
        ZStack {
            // BACKGROUND
            LinearGradient(gradient: Gradient(colors: [Color(red: 0.2, green: 0.2, blue: 0.2), Color(red: 0.11, green: 0.11, blue: 0.11)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            // CONTENTS
            VStack (alignment: .leading, spacing: 10) {
                Text("How to Use the App")
                    .fontWeight(.bold)
                Text("How to Use the Robot")
                    .fontWeight(.bold)
                Spacer()
            }
        }.navigationTitle("How To")
    }
}


/* ABOUT US PAGE */
struct AboutUs: View {
    var body: some View {
        ZStack {
            // BACKGROUND
            LinearGradient(gradient: Gradient(colors: [Color(red: 0.2, green: 0.2, blue: 0.2), Color(red: 0.11, green: 0.11, blue: 0.11)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            // CONTENTS
            VStack(alignment: .leading, spacing: 10) {
                // ARIANNE
                Group {
                    // Title
                    Text("Arianne Pablo")
                        .fontWeight(.bold)
                    HStack {
                        // Image
                        Image("AriannePablo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        // Description
                        Text("Responsible for the Software Design and App Development")
                    }
                }
                
                // MIGUEL
                Group {
                    // Title
                    Text("Miguel Avalos")
                        .fontWeight(.bold)
                    HStack {
                        // Image
                        Image("MiguelAvalos")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        // Description
                        Text("Responsible for the design and implementation of the Electrical components")
                    }
                }
                
                // BRIAN
                Group {
                    // Title
                    Text("Brian Stuck")
                        .fontWeight(.bold)
                    HStack {
                        // Image
                        Image("BrianStuck")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        // Description
                        Text("Responsible for the design and implementation of the Mechanical components")
                    }
                }
                
                // AILEEN
                Group {
                    // Title
                    Text("Aileen Rodriguez")
                        .fontWeight(.bold)
                    HStack {
                        // Image
                        Image("AileenRodriguez")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        // Description
                        Text("Responsible for financial management, website development, communications, and provision of Hardware support")
                    }
                }
            }.navigationTitle("About Us")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
