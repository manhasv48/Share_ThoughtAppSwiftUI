//
//  LaunchView.swift
//  ShareThought
//
//  Created by Vishal M on 22/07/23.
//

import SwiftUI

struct LaunchView: View {
    @State private var loadingText:[String] = "Thoughts...".map{String($0)}
    @State  private var showloading:Bool = false
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    @State private var counter:Int = 0
    @State private var loops:Int = 0
    @Binding var showLaunchview:Bool
    
    
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            Image("appIcon")
                .resizable()
                .frame(width: 100,height: 100)
            ZStack{
                
                if showloading{
                    HStack{
                        ForEach(loadingText.indices){ index in
                            Text(loadingText[index])
                                .font(.headline)
                                .fontWeight(.heavy)
                               
                                .foregroundColor(.white)
                                .offset(y:counter == index ? -5 : 0)
                            
                        }
                    }.transition(AnyTransition.scale.animation(.easeIn))
                }
                    
                }.offset(y:70)
        }.onAppear{
            showloading.toggle()
        }
        .onReceive(timer, perform: { _ in
            withAnimation(.spring()){
                let lastIndex = loadingText.count - 1
                if counter == lastIndex{
                    counter = 0
                    loops += 1
                    if loops >= 2{
                        showLaunchview = false
                    }
                }else{
                    counter += 1
                }
            }
        })
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView(showLaunchview: .constant(true))
    }
}
