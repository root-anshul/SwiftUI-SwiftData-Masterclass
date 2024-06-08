//
//  CardView.swift
//  hike_application
//
//  Created by anshul on 05/06/24.
//

import SwiftUI

struct CardView: View {
    
    @State private var image:Int=1
    @State private var random:Int=1
    @State private var isShowingSheet:Bool=false
    func randomNumber(){
        repeat{
            random = Int.random(in: 1...5)
        }while (random == image)
       
        image = random
    }
    
    
    var body: some View {
        //MARK: - CARD
        ZStack {
            CustomBackground()
            VStack {
                //MARK: -HEADER
                VStack(alignment:.leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(colors: [          .customGrayLight,.customGrayMedium], startPoint: .top, endPoint: .bottom)
                            )
                        Spacer()
                        Button{
                            //Action of button
                            isShowingSheet.toggle()
                        }label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet) {
                            SettingView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium,.large])
                        }
                    }
                    Text("Fun and Enjoyable outdoor activity for friends and families.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                }
                .padding(.horizontal,30)
                //MARK: -MAIN CONTENT
                ZStack {
                    
                    CircleView()
                    Image("image-\(image)")
                        .resizable()
                        .scaledToFit()
                        .animation(.default, value: image)
                    
                }
                Button{
                    //Action
                    randomNumber()
                }label: {
                    Text("Explore More")
                    
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(  LinearGradient(colors: [.customGreenLight,.customGreenMedium], startPoint: .top, endPoint: .bottom))
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
                }
                .buttonStyle(GradientButton())
               
            }
            
          
        }.frame(width: 320,height: 570)
    }
}

#Preview {
    CardView()
}
