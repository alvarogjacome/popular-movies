//
//  MovieDetailScreen.swift
//  Popular Movies
//
//  Created by Álvaro Gutiérrez Jácome on 01/08/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import SwiftUI

struct MovieDetailScreen: View {
    @ObservedObject var viewModel: DetailScreenViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack(spacing: 0) {
                    HeaderView(movie: self.viewModel.getPopularMovie(), geometry: geometry)
                    if self.viewModel.state == .loaded {
                        ScrollView(.vertical) {
                            VStack {
                                MainModuleView(movieDetails: self.viewModel.movie!)
                                    .modifier(ModuleModifier(geometry: geometry))
                                SummaryModuleView(movieDetails: self.viewModel.movie!)
                                    .modifier(ModuleModifier(geometry: geometry))
                                DetailsModuleView(movieDetails: self.viewModel.movie!)
                                    .modifier(ModuleModifier(geometry: geometry))
                            }
                            .padding(.bottom)
                        }
                    } else { Spacer() }
                }
                .animation(.spring())

                if self.viewModel.state == .loading {
                    LoadingView(geometry: geometry)
                        .transition(.opacity)
                } else if self.viewModel.state == .error {
                    CustomPopup(message: self.viewModel.error!.rawValue, action: { self.presentationMode.wrappedValue.dismiss() })
                }
            }
        }
        .background(Color(.secondarySystemBackground))
        .edgesIgnoringSafeArea(.vertical)
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .onAppear(perform: self.viewModel.fetchMovieDetails)
    }
}
