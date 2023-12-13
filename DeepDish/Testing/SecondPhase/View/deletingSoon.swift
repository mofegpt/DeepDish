//
//  deletingSoon.swift
//  DeepDish
//
//  Created by Eyimofe Oladipo on 3/6/22.
//

import SwiftUI

struct deletingSoon: View {
    let maxHeight = UIScreen.main.bounds.height / 2.30
    var body: some View {
        
//        ScrollView(.vertical, showsIndicators: false){
//            VStack(spacing: 15){
//                GeometryReader{proxy in
//                    VStack(alignment: .leading, spacing: 15){
//
//                    }
//                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
//                    .background(Color.red)
//                }
//                .frame(height:maxHeight)
//            }
        ScrollView{
            LazyVStack(spacing: 15, pinnedViews: [.sectionFooters], content: {
                Section(footer: FooterView() ){
                    ScrollView(.vertical, showsIndicators: false){
                        VStack(spacing: 15){
                            GeometryReader{proxy in
                                VStack(alignment: .leading, spacing: 15){
                                    
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                                .background(Color.red)
                                
                            }
                            .frame(height: maxHeight)
                        }
                        ForEach(0..<20){_ in
                            Text("wassupf")
                        }
                    }
                }
            })
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct deletingSoon_Previews: PreviewProvider {
    static var previews: some View {
        deletingSoon()
    }
}
