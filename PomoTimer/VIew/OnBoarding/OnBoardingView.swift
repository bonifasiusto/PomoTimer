//
//  ContentView.swift
//  PomoTimer
//
//  Created by Bonifasius Toto Neguisa Ginting on 22/07/22.
//

import SwiftUI

struct OnBoardingView: View {
    var body: some View {
        
// Dapetin Screensize global
        GeometryReader{proxy in
            
            let size = proxy.size
            
            HomeView(screenSize: size)
                .preferredColorScheme(.dark) // butuh update ganti ke BackgroundColor
            
        }
        
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
