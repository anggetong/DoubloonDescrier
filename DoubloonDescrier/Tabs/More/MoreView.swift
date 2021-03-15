//
//  MoreView.swift
//  DoubloonDescrier
//
//  Created by Arianne Pablo on 12/22/20.
//

import SwiftUI

/* MORE VIEW */
// Allows the user to navigate through other pages
struct MoreView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // BACKGROUND
                DarkBackground()
                
                // CONTENT
                VStack(alignment:.leading) {
                    // BLUETOOTH SETTINGS
                    HStack{
                        NavigationLink(destination: BluetoothSettings()) {
                            Text("Bluetooth Settings")
                        }
                        Spacer()
                    }
                    .padding(.leading, 4)
                    .padding(.bottom, 4)
                    
                    // NOTIFICATION SETTINGS
                    HStack{
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Notification Settings")
                        })
                        Spacer()
                    }
                    .padding(.leading, 4)
                    .padding(.bottom, 4)
                    
                    // ABOUT US PAGE
                    HStack{
                        NavigationLink(destination: AboutUs()) {
                            Text("About Us")
                        }
                        Spacer()
                    }
                    .padding(.leading, 4)
                    .padding(.bottom, 4)
                    HStack{
                        // HOW TO PAGE
                        NavigationLink(destination: HowTo()) {
                            Text("How To")
                        }
                        Spacer()
                    }
                    .padding(.leading, 4)
                    .padding(.bottom, 4)
                    Spacer()
                }.padding()
            }.navigationTitle("More")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView()
    }
}
