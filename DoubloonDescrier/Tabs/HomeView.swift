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
    @ObservedObject var bleStatus = BLEManager()
    @State private var circleAnimate: CGFloat = 1
    
    var body: some View {
            ZStack {
                // BACKGROUND
                DarkBackground()
                SplashScreen()
                VStack {
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    HStack {
                        Text("STATUS:")
                        
                        Text(bleStatus.isSwitchedOn ? "Connected": "Disconnected")
                            .bold()
                            .foregroundColor(bleStatus.isSwitchedOn ? .green: .red)
                        
                        Circle()
                            .fill(bleStatus.isSwitchedOn ? Color.green: Color.red)
                            .frame(width: 10, height: 10)
                            .overlay(
                                Circle()
                                    .stroke(bleStatus.isSwitchedOn ? Color.green: Color.red, lineWidth: 0.5)
                                    .opacity(0.7)
                                    .scaleEffect(circleAnimate)
                                    .animation(
                                        Animation.easeOut(duration: 1)
                                            .repeatForever(autoreverses: false)
                                    )
                            ).onAppear {
                                self.circleAnimate = 2
                            }
                    }
                    Spacer()
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
