//
//  SplashScreen.swift
//  DoubloonDescrier
//
//  Created by Arianne Pablo on 3/12/21.
//

import SwiftUI

struct SplashScreen: View {
    @State private var bgAnimate: CGFloat = 10
    @State private var robotAnimation: CGFloat = 1
    @State private var textAnimate: CGFloat = 1
    @State private var welcomeAnimate: CGFloat = 0.5
    
    
    var body: some View {
        ZStack {
            Image("robot_money")
                .resizable()
                .scaledToFill()
                .opacity(0.15)
                .scaleEffect(bgAnimate)
                .animation(
                    Animation.easeIn(duration: 5)
                ).onAppear {
                    self.bgAnimate = 1
                }
            
            VStack {
                Spacer()
                Text("WELCOME TO")
                    .font(.title)
                    .kerning(10)
                    .scaleEffect(welcomeAnimate)
                    .animation(
                        Animation.easeOut(duration: 3).delay(0.5))
                    .onAppear {
                        self.welcomeAnimate = 0.9
                    }
                Text("DOUBLOON \nDESCRIER")
                    .font(.largeTitle)
                    .kerning(10)
                    .padding()
                    .scaleEffect(textAnimate)
                    .animation(
                        Animation.easeOut(duration: 3).delay(2))
                    .onAppear {
                        self.textAnimate = 1.3
                    }
                
                Image("MetalDetectorLogo_NBG")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    //.shadow(color: .black, radius: 5)
                    .shadow(color: .green, radius: 100)
                    .padding()
                    .scaleEffect(robotAnimation)
                    .animation(
                        Animation.easeInOut(duration: 2)
                            .repeatForever(autoreverses: true)
                    ).onAppear {
                        self.robotAnimation = 0.9
                    }
                Spacer()
            }
            
            
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
