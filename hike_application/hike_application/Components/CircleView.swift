//
//  CircleView.swift
//  hike_application
//
//  Created by anshul on 05/06/24.
//

import SwiftUI

struct CircleView: View {
    @State private var isanimated:Bool = false
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(colors: [.customIndigoMedium,.customSalmonLight], 
                    startPoint: isanimated ? .topLeading : .bottomLeading,
                    endPoint:   isanimated ? .bottomTrailing : .topTrailing
                        )
                )
                .onAppear{
                    withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)){
                        isanimated.toggle()
                    }
                    
                }
            MotionAnimationView()
        }
        .frame(width: 256,height: 256)
    }
}

#Preview {
    CircleView()
}
