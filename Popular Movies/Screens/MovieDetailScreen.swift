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
    @GestureState private var dragOffset = CGSize.zero

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
        .navigationBarHidden(false)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: SFSymbols.arrowLeft
            .resizable()
            .scaleEffect(1.4)
            .foregroundColor(Color(.secondarySystemBackground))
            .padding(8)
            .background(LinearGradient(gradient: Gradient(colors: [Colors.lightBlue, Colors.lightGreen, Colors.lightGreen]), startPoint: .bottomLeading, endPoint: .topTrailing))
            .clipShape(Circle())
            .clipped()
            .onTapGesture {
                let generator = UIImpactFeedbackGenerator(style: .soft)
                self.presentationMode.wrappedValue.dismiss()
                generator.impactOccurred()
            })
        .onAppear(perform: self.viewModel.fetchMovieDetails)
        .gesture(DragGesture().updating($dragOffset, body: { value, _, _ in
            if value.startLocation.x < 25, value.translation.width > 50 {
                self.presentationMode.wrappedValue.dismiss()
            }
            }))
    }
}
