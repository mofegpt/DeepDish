//
//  TestScreen.swift
//  DeepDish
//
//  Created by Anthony Iamurri on 2/4/22.
//

import SwiftUI

struct TestScreen: View {
    var body: some View {
        
        // To ignore and get Safe Area
        GeometryReader{proxy in
            let topEdge = proxy.safeAreaInsets.top
            Home(topEdge: topEdge)
                .ignoresSafeArea(.all, edges: .top)
        }
        
    }
}

struct TestScreen_Previews: PreviewProvider {
    static var previews: some View {
        TestScreen()
            .preferredColorScheme(.dark)
    }
}
