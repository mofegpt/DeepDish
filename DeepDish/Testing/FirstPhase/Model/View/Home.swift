//
//  Home.swift
//  DeepDish
//
//  Created by Eyimofe Oladipo on 3/3/22.
//

import SwiftUI

struct Home: View {
    // Max height ...
    let maxHeight = UIScreen.main.bounds.height / 2.3
    var topEdge: CGFloat
    // Offst ...
    @State var offset: CGFloat = 0
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing: 15)
            {
            // Top Navigation View..
                GeometryReader{proxy in
                    
                    TopBar(topEdg: topEdge, offset:$offset, maxHeight: maxHeight)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    // Sticky Effect ...
                    .frame(height: getHeaderHeight(), alignment: .bottom)
                    .background(
                        Color("TopBar")
                        ,in : CustomCorner(corners: [.bottomRight], radius: getCornerRadius()))
                    .overlay(
                        //Top Nav View...
                        HStack(spacing: 15){
                            Button{
                                
                            }label:{
                                Image(systemName: "xmark")
                                    .font(.body.bold())
                            
                                
                            }
                            Spacer()
                            Button{
                                
                            }label:{
                                Image(systemName: "line.3.horizontal.decrease")
                                    .font(.body.bold())
                                
                            }

                        }
                            .padding(.horizontal)
                        // MaxHeight...
                            .frame(height: 80 + topEdge)
                            .foregroundColor(.white)
                        ,alignment: .top
                    )
                }
                .frame(height: maxHeight)
                // Fixing at top...
                .offset(y: -offset)
                .zIndex(1)
                
                // Sample Messages ..
                VStack(spacing: 15){
                    ForEach(allMessages){message in
                        // Card View
                        MessageCardView(message: message)
                    }
                }
                .padding()
                .zIndex(0)
            }
            .modifier(OffsetModifiers(offset: $offset))
        }
        // setting coordinate space...
        .coordinateSpace(name: "SCROLL")
    }
    func getHeaderHeight() -> CGFloat{
        let topHeight = maxHeight + offset
        // 80 is the constat top Nav bar height
        // since we include top safe area so we also need to inlcyde that too...
        return topHeight > (80 + topEdge) ? topHeight: (80 + topEdge)
    }
    func getCornerRadius() -> CGFloat {
        let progress = -offset / (maxHeight - (80 + topEdge))
        let value = 1 - progress
        let radius = value * 50
        
        return offset < 0 ? radius : 50
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        TestScreen()
    }
}

struct TopBar: View{
    var topEdg:  CGFloat
    @Binding var offset: CGFloat
    var maxHeight: CGFloat
    var body: some View{
        VStack(alignment: .leading, spacing: 15){
            
            Image("0")
                .resizable()
                .aspectRatio( contentMode: .fill)
                .frame(width: 80, height: 80)
                .cornerRadius(10)
            
            
            Text("iJustine")
                .font(.largeTitle.bold())
            Text("Justine ezarik is an american youtuber, host, author, She is best known as iJustine")
                .fontWeight(.semibold)
                .foregroundColor(Color.white.opacity(0.8))
        }
        .padding()
        .padding(.bottom)
        .opacity(getOpacity())
    }
    // Calculation Opacity..
    func getOpacity()-> CGFloat{
        // 70= Some random amount of time to visible on scroll..
        let progress = -offset / 70
        let opacity = 1 -  progress
        
        return offset < 0 ? opacity : 1
    }
}


struct MessageCardView: View{
    var message: Message
    var body: some View{
        HStack(spacing: 15){
            Circle()
                .fill(message.tintColor)
                .frame(width: 50, height: 50)
                .opacity(0.8)
            VStack(alignment: .leading, spacing: 8){
                Text(message.userName)
                    .fontWeight(.bold)
                Text(message.message)
                    .foregroundColor(.secondary)
            }
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity,alignment: .leading)
        }
    }
}
