//
//  ShareThoughtApp.swift
//  ShareThought
//
//  Created by Vishal M on 25/06/23.
//

import SwiftUI

@main
struct ShareThoughtApp: App {
    @State private var showlaunchview:Bool = true
    var body: some Scene {
            WindowGroup {
                ZStack{
                NavigationView{
                    HomeTabBarView()
                        .navigationBarHidden(true)
                }
                    ZStack{
                        if showlaunchview{
                            LaunchView(showLaunchview: $showlaunchview)
                                .transition(.move(edge: .leading))
                        }
                    }.zIndex(2.0)
            }
        }
    }
}
