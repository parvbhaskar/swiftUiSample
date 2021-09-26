//
//  SpinToWinImageView.swift
//  swiftUIDemo
//
//  Created by Parv Bhaskar on 24/09/21.
//

import SwiftUI

struct SpinToWinImageView: View {
    @Binding var imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .background(Color.white.opacity(0.5))
            .cornerRadius(15)
    }
}

struct SpinToWinImageView_Previews: PreviewProvider {
    static var previews: some View {
        SpinToWinImageView(imageName: Binding.constant("apple"))
    }
}
