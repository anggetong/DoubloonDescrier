//
//  DarkBackground.swift
//  DoubloonDescrier
//
//  Created by Arianne Pablo on 12/22/20.
//

import SwiftUI

struct DarkBackground: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color(red: 0.2, green: 0.2, blue: 0.2), Color(red: 0.11, green: 0.11, blue: 0.11)]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
    }
}

struct DarkBackground_Previews: PreviewProvider {
    static var previews: some View {
        DarkBackground()
    }
}
