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
                                    CollectionViewCell(url: "https://random.imagecdn.app/320/180", title: movie?.title ?? "", subtitle: "asdf")
                                }
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .edgesIgnoringSafeArea(.all)

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
