//
//  OffsetModifiers.swift
//  DeepDish
//
//  Created by Eyimofe Oladipo on 3/5/22.
//

import SwiftUI

// Gettting Scrollview offset...
struct OffsetModifiers: ViewModifier {
    @Binding var offset: CGFloat
    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader{ proxy -> Color in
                    // getting value for coordinate space called scroll....
                    let minY = proxy.frame(in: .named("SCROLL")).minY
                    
                    DispatchQueue.main.async {
                        self.offset = minY
                    }
                    return Color.clear
                }
                ,alignment: .top
            )
    }
}

