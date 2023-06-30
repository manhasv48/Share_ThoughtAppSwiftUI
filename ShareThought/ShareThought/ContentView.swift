//
//  ContentView.swift
//  ShareThought
//
//  Created by Vishal M on 25/06/23.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab = 0
        
        var body: some View {
            
            ZStack(alignment: .bottom){
                TabView(selection: $selectedTab) {
                    ThoughtsViewUI()
                        .tag(0)
                    EditProfile()
                        .tag(1)
                }
                ZStack{
                    HStack{
                        ForEach((TabbedItems.allCases), id: \.self){ item in
                            Button{
                                selectedTab = item.rawValue
                            } label: {
                                CustomTabItem(imageName: item.iconName, title: item.title, isActive: (selectedTab == item.rawValue))
                            }
                        }
                    }
                    .padding(6)
                }
                .frame(height: 70)
                .background(.purple.opacity(0.2))
                .cornerRadius(35)
                .padding(.horizontal, 26)
            }
        }
}
extension ContentView{
    func CustomTabItem(imageName: String, title: String, isActive: Bool) -> some View{
        HStack(spacing: 10){
            Spacer()
            Image(imageName)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(isActive ? .black : .gray)
                .frame(width: 20, height: 20)
            if isActive{
                Text(title)
                    .font(.system(size: 14))
                    .foregroundColor(isActive ? .black : .gray)
            }
            Spacer()
        }
        .frame(width: isActive ? .infinity : 60, height: 60)
        .background(isActive ? .purple.opacity(0.4) : .clear)
        .cornerRadius(30)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
