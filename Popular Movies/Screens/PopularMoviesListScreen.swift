//
//  ContentView.swift
//  Popular Movies
//
//  Created by Álvaro Gutiérrez Jácome on 31/07/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import SwiftUI

struct PopularMoviesListScreen: View {
    @ObservedObject var viewModel = PopularMovieListViewModel()
    @State private var isSearching: Bool = false

    init() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "MainBlue")
        appearance.shadowColor = .clear

        appearance.titleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 22, weight: .thin),
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if self.viewModel.state == .loading {
                    LoadingView(geometry: geometry)
                        .transition(.opacity)
                        .zIndex(1)

                } else if self.viewModel.state == .error {
                    CustomPopup(message: self.viewModel.error!.rawValue, action: { fatalError() })
                        .zIndex(1)
                }

                NavigationView {
                    VStack(alignment: .leading, spacing: 0) {
                        SearchBar(search: self.$viewModel.search, isSearching: self.$isSearching)

                        if self.viewModel.state == .loaded {
                            MoviesListView(movieList: self.viewModel.getMovies()!, geometry: geometry)
                        } else {
                            Spacer()
                        }
                    }
                    .navigationBarItems(leading: self.navigationBarLogo("logo"), trailing:
                        ReorderButton(action: self.viewModel.reorderButtonAction))
                    .navigationBarTitle("", displayMode: .inline)
                    .background(Color(.tertiarySystemBackground))
                    .edgesIgnoringSafeArea([.horizontal, .bottom])
                    .onTapGesture {
                        self.hideKeyboard()
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .accentColor(Color("LightGreen"))
    }
}




