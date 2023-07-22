//
//  LoadingView.swift
//  ShareThought
//
//  Created by Vishal M on 22/07/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(spacing: 20)  {
            Text("loading")
                .font(.system(size: 80))
            ProgressView()
            Text("Getting the data ...")
                .foregroundColor(.gray)
            
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
