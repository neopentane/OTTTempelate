//
//  CollectionViewCell.swift
//  OTTTemplateApp
//
//  Created by Shreeram Kelkar on 10/10/23.
//

import SwiftUI
import BlurHashKit
struct CollectionViewCell: View {
    @FocusState private var isFocused: Bool
    @State private var url: String
    @State private var title: String
    @State private var subtitle: String
    
    init(isFocused: Bool = false, url: String, title: String, subtitle: String) {
        self.url = url
        self.title = title
        self.subtitle = subtitle
    }
    
    var body: some View {
        VStack() {
            AsyncImage(url: URL( string: "")) { img in
                img.resizable()
            } placeholder: {
                BlurHashView(
                    blurHash: "LGD5?xYk^6#M@-5c,1J5@[or[Q6.",
                    size: CGSize(width: 16, height: 9),
                    pixels: 512,
                    punch: 0.8
                )
            }
            Text(title).padding(8)
        }.background(isFocused ? .black.opacity(0.2) : .white.opacity(0.2))
            .scaleEffect(isFocused ? 1.2 : 1.0)
            .cornerRadius(24)
            .focusable(true)
            .zIndex(isFocused ? 1: 0)
            .focused($isFocused)
            .buttonStyle(.card)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    CollectionViewCell(url: "asdf", title: "asdf", subtitle: "asdfe")
}
