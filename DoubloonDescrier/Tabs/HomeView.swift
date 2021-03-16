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
    @State private var circleAnimate: CGFloat = 0.5
    
    var body: some View {
            ZStack {
                // BACKGROUND
                DarkBackground()
                SplashScreen()
                VStack {
                    Spacer()
                        .frame(height: 550)
                    HStack {
                        Text("STATUS:")
                        Text(bleStatus.connected ? "    Connected ": "Disconnected")
                            .bold()
                            .foregroundColor(bleStatus.connected ? .green: .red)
                        
                        Circle()
                            .fill(bleStatus.connected ? Color.green: Color.red)
                            .frame(width: 16, height: 10)
                            .overlay(
                                Circle()
                                    .stroke(bleStatus.connected ? Color.green: Color.red, lineWidth: 0.5)
                                    .opacity(0.7)
                                    .animation(nil)
                                    .scaleEffect(circleAnimate)
                                    .animation(
                                        Animation.easeOut(duration: 1)
                                            .repeatForever(autoreverses: false)
                                    )
                            ).onAppear {
                                self.circleAnimate = 2
                            }
                    }
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
