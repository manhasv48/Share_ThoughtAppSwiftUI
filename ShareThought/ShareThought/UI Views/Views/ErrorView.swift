//
//  ErrorView.swift
//  ShareThought
//
//  Created by Vishal M on 22/07/23.
//

import SwiftUI

struct ErrorView: View {
    @ObservedObject  var viewModel:ThoughtsViewModel
    var body: some View {
        VStack {
            Text("opps...")
                .font(.system(size: 80))
            Text(viewModel.errorMessage ?? "")
            Button {
                viewModel.loadData()
            } label: {
                Text("Try again")
            }

            
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(viewModel: ThoughtsViewModel())
    }
}
