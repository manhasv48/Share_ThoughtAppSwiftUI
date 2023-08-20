//
//  ContentView.swift
//  ShareThought
//
//  Created by Vishal M on 25/06/23.
//

import SwiftUI

struct HomeTabBarView: View {
    @State var selectedTab = 0
        
    var body: some View {
        NavigationView{
            ZStack(alignment: .bottom){
                TabView(selection: $selectedTab) {
                    ContentView()
                        .tag(0)
//                    EditProfile()
//                        .tag(2)
                    
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
                .frame(height: 50)
                .background(.blue.opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal, 26)
            }
        }.navigationBarBackButtonHidden()
            .navigationBarHidden(true)
    }
}
extension HomeTabBarView{
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
        .frame(width: isActive ? .infinity : 100, height: 50)
        .background(isActive ? .blue.opacity(0.4) : .clear)
        .cornerRadius(10)
    }
}

struct HomeTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabBarView()
    }
}
