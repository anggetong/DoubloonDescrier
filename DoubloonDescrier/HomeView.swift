//
//  HomeView.swift
//  DoubloonDescrier
//
//  Created by Arianne Pablo on 12/22/20.
//

import SwiftUI

/* HOME VIEW */
// What the user sees when they open the app
struct HomeView: View {
    var body: some View {
            ZStack {
                // BACKGROUND
                DarkBackground()
                
                // CONTENT
                VStack {
                    Text("Welcome to")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text("DOUBLOON DESCRIER!")
                        .font(.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Spacer()
                    Image("MetalDetectorLogo_NBG")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .shadow(color: .black, radius: 7)
                        .padding()
              
                }
                
            }
            
            .navigationTitle("Home")
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
