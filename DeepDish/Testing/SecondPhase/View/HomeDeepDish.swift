//
//  Home.swift
//  DeepDish
//
//  Created by Eyimofe Oladipo on 3/5/22.
//

import SwiftUI

struct HomeDeepDish: View {
    
    // Max Height...
    let maxHeight = UIScreen.main.bounds.height / 2.3
    @State var offset : CGFloat = 0
    var topEdge: CGFloat
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing: 15){
                GeometryReader{proxy in
                    TopBaView(topEdge: topEdge, offset: $offset)
                    .frame(maxWidth: .infinity)
                    // STicky Effect...
                    .frame(height:maxHeight + offset, alignment: .bottom)
                    .background(Color.red,
                                in: CustomCorner(corners: [.bottomLeft], radius: 50))
                }
                .frame(height: maxHeight)
                //fixing at the top
                .offset(y: -offset )
                
                
//                GeometryReader{proxy in
//                    VStack(alignment: .leading, spacing: 15){
//
//                    }
//                    .frame(width: 100, height: 100, alignment: .bottom)
//                    background(Color.black)
//                }
           }
            .modifier(OffsetModifiers(offset: $offset))
        }
        // setting coordinate Space ....
        .coordinateSpace(name: "SCROLL")
    }
}

struct HomeDeepDish_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenTest()
    }
}

struct TopBaView: View{
    var topEdge: CGFloat
    var bottomLeft: CGFloat = 50
    @Binding var offset: CGFloat
    var body: some View{
        VStack(alignment: .leading, spacing: 15){
            Image("Vegan3")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width, alignment: .center)
                .cornerRadius(bottomLeft, corners: .bottomLeft)
        }
    }
}

struct BottomBaView: View{
    var topEdge: CGFloat
    var bottomLeft: CGFloat = 50
    @Binding var offset: CGFloat
    var body: some View{
        VStack(alignment: .leading, spacing: 15){
            Image("Vegan3")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width, alignment: .center)
                .cornerRadius(bottomLeft, corners: .bottomLeft)
        }
    }
}


struct MealListView: View{
    var body: some View{
        let gridItems: [GridItem] = Array(repeating: .init(.adaptive(minimum: 200)), count: 2)
        LazyVGrid(columns: gridItems, spacing: 40) {
            ForEach(Category.TestData) { category in
                NavigationLink {
                    //where does it go
                    ChoosingScreen(meal: category.Text, Category: category)
                    
                    
                } label: {
                    
                    Image(category.Image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .shadow(color: Color.black.opacity(0.2), radius:1, x:0,y:5)
                        .accessibilityHidden(true)
                        .overlay(ZStack {
                            Text(category.Text)
                                .font(.title2)
                                .bold()
                                .padding(6)
                                .foregroundColor(.white)
                        }.background(Color.red)
                                    .cornerRadius(20.0)
                                    .padding(6.0)
                                 , alignment: .bottomLeading)
                }
                .accessibilityLabel("\(category.Text) category")
                .accessibilityHint("Double Tap to select \(category.Text) from meal category")
                
            }
        //    Spacer()
        }
    }
}

struct BottomSectionView: View {
    var topLeft: CGFloat = 50
    var body: some View {
        Rectangle()
//            .frame(height: 500)
            .edgesIgnoringSafeArea(.horizontal)
            .edgesIgnoringSafeArea(.top)
            .foregroundColor(Color("Background"))
            .cornerRadius(topLeft, corners: .topLeft)
            //.shadow(color: Color.black.opacity(0.4), radius:30, x:0,y:-5)
            .shadow(color: Color.black.opacity(0.6), radius:8, x:0,y:-5)
    }
}

