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
    @State private var showingFilters: Bool = false

    init() {
        UINavigationBar.appearance().barTintColor = .clear
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if self.viewModel.state == .loading {
                    LoadingView(geometry: geometry)
                        .transition(.opacity)
                        .zIndex(1)

                } else if self.viewModel.state == .error {
                    CustomPopup(message: self.viewModel.error!.rawValue, action: self.viewModel.errorButtonAction)
                        .zIndex(1)
                }

                NavigationView {
                    VStack(alignment: .leading, spacing: 0) {
                        SearchBar(search: self.$viewModel.search, isSearching: self.$isSearching)

                        if self.viewModel.movies?.isEmpty != nil {
                            MoviesListView(movieList: self.viewModel.getMovies()!, canLoadMoreMovies: self.$viewModel.canLoadMoreMovies.wrappedValue && !self.$isSearching.wrappedValue, action: self.viewModel.fetchMorePopularMovies, geometry: geometry)
                        } else {
                            Spacer()
                        }
                    }
                    .navigationBarItems(leading: self.navigationBarLogo("logo"))
                    .navigationBarTitle("", displayMode: .inline)
                    .edgesIgnoringSafeArea([.horizontal, .bottom])
                    .onTapGesture {
                        self.hideKeyboard()
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .accentColor(Colors.lightGreen)
    }
}
