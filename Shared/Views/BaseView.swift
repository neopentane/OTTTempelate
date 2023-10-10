//
//  BaseView.swift
//  OTTTemplateApp
//
//  Created by Shreeram Kelkar on 05/10/23.
//

import SwiftUI
import BlurHashKit

struct BaseView: View {
    
    @StateObject private var viewModel = baseViewModel(useCase: BaseViewUseCase(repository: BaseRepository()))
    
    var body: some View {
        ZStack {
            if viewModel.isLoading {
                Text("Loading...")
            }
            else if let movies = viewModel.data?.allFilms?.films {
                VStack {
                    ForEach([0,1,2], id: \.self) { i in
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(movies, id:\.self) { movie in
                                    VStack() {
                                        AsyncImage(url: URL( string: "https://random.imagecdn.app/320/180")) { img in
                                            img.resizable()
                                        } placeholder: {
                                            BlurHashView(
                                                blurHash: "LGD5?xYk^6#M@-5c,1J5@[or[Q6.",
                                                size: CGSize(width: 16, height: 9),
                                                pixels: 512,
                                                punch: 0.8
                                            )
                                        }
                                        
                                        Text(movie?.title ?? "Nil").padding(8)
                                    }.background(.black.opacity(0.2))
                                        .cornerRadius(24)
                                    //                                        .border(.white, width: 5)
                                }
                            }
                        }
                    }
                }
            } else {
                Text("Error")
            }
        }
    }
}

#Preview {
    BaseView()
}
