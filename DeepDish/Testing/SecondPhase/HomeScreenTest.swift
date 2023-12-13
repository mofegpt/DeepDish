//
//  HomeScreenTest.swift
//  DeepDish
//
//  Created by Eyimofe Oladipo on 3/5/22.
//

import SwiftUI

struct HomeScreenTest: View {
    var body: some View {
        // To Ignore and get Safe Area size ...
            ZStack {
                Image("backgroundPattern")
                    .resizable()
                    .ignoresSafeArea(.all)
                    .accessibilityHidden(true)
            GeometryReader{proxy in
                let topEdge = proxy.safeAreaInsets.top
                HomeDeepDish(topEdge: topEdge)
                    .ignoresSafeArea(.all, edges: .top)
            }
        }
    }
}

struct HomeScreenTest_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenTest()
    }
}
