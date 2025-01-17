//
//  CustomListRowView.swift
//  hike_application
//
//  Created by anshul on 06/06/24.
//

import SwiftUI

struct CustomListRowView: View {
    @State var rowLabel:String
    @State var rowIcon:String
    @State var rowContent:String
    @State var rowTintColor:Color
    
    var body: some View {
        LabeledContent{
            Text(rowContent)
                .foregroundColor(.primary)
                .fontWeight(.heavy)
        }label:{
            
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: 30,height: 30)
                            .foregroundColor(rowTintColor)
                        Image(systemName: rowIcon)
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                    }
                    Text(rowLabel)
                
            }
        }
        
    }
}

#Preview {
    List {
        CustomListRowView(rowLabel: "Designer", rowIcon: "paintpalette", rowContent: "Anshul Tanwar", rowTintColor: .pink)
    }
}
