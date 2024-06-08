//
//  SettingView.swift
//  hike_application
//
//  Created by anshul on 05/06/24.
//

import SwiftUI

struct SettingView: View {
    private let alternateAppIcon:[String] = [
    "AppIcon-Backpack",
    "AppIcon-Camera",
    "AppIcon-Campfire",
    "AppIcon-MagnifyingGlass",
    "AppIcon-Map",
    "AppIcon-Mushroom"
    ]
    
    var body: some View {
      
            List{
                Section{
                HStack {
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    VStack(spacing:-10){
                        Text("Hike")
                            .font(.system(size: 66,weight: .black))
                        Text("Editor's Choice")
                    }
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80,weight: .black))
                    Spacer()
                }
                .foregroundStyle(LinearGradient(colors: [.customGreenLight,.customGreenMedium,.customGreenDark], startPoint: .top, endPoint: .bottom))
                .padding(.top,8)
                    VStack(spacing:8){
                        Text("Lorem Ipsum is simply dummy text of the printing.")
                            .font(.title2)
                        Text("Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.")
                            .font(.footnote)
                            .italic()
                        Text("Dust off the boots! Its time for a walk.")
                            .fontWeight(.heavy)
                            .foregroundColor(.customGreenMedium)
                        
                    }.multilineTextAlignment(.center)
                        .padding(.bottom,16)
                        .frame(maxWidth: .infinity)
            }
                .listRowSeparator(.hidden)
                
                
                Section(header:Text("Alternate Icons")){
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack (spacing:12){
                            ForEach(alternateAppIcon.indices,id: \.self) { item in
                                Button{
                                    UIApplication.shared.setAlternateIconName(alternateAppIcon[item]){error in
                                        if error != nil{
                                            print("Failed")
                                        }else{
                                            print("Success")
                                        }
                                        
                                    }
                                }label: {
                                    Image("\(alternateAppIcon[item])-Preview")                                .resizable()
                                        .scaledToFit()
                                        .frame(width: 80,height: 80)
                                        .cornerRadius(16)
                                    
                            }.buttonStyle(.borderless)
                            }
                        }
                    }
                    .padding(.top,12)
                    
                    
                    
                    Text("Choose your favourite icon")
                        .frame(minWidth: 0,maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.secondary)
                        .font(.footnote)
                        .padding(.bottom,12)
                    
                }  .listRowSeparator(.hidden)
                
                
                Section(header: Text("ABOUT THE APPLICATION"),
                        footer: HStack{
                    Spacer()
                    Text("Copyright © All Right Reserved.")
                    Spacer()
                }.padding(.vertical,8)
                ){
                    //1.) Basic labeledContent
//                    LabeledContent("Application",value: "Hike")
                    
                    //2.) Advanced labeledContent
                    CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "Hike", rowTintColor: .blue)
                    
                    CustomListRowView(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "iOS,iPadOS", rowTintColor: .red)
                    
                    CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
                    
                    CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
                    
                    CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "Anshul Tanwar", rowTintColor: .mint)
                    
                    CustomListRowView(rowLabel: "Designer", rowIcon: "paintpalette", rowContent: "Anshul Tanwar", rowTintColor: .pink)
                }
        }
  
    }
}

#Preview {
    SettingView()
}
