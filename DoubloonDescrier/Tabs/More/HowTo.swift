//
//  HowTo.swift
//  DoubloonDescrier
//
//  Created by Arianne Pablo on 3/12/21.
//

import SwiftUI

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
