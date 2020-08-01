//
//  ContentView.swift
//  Popular Movies
//
//  Created by Álvaro Gutiérrez Jácome on 31/07/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import SwiftUI

struct PopularMoviesListScreen: View {
    @State private var movies: [PopularMovie] = [PopularMovie]()
    @State private var search: String = ""
    @State private var isSearching: Bool = false

    init() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "MainBlue")
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")

                        TextField("Search", text: $search, onEditingChanged: { _ in
                            self.isSearching = true
                        })
                            .foregroundColor(.primary)
                    }
                    .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                    .foregroundColor(.secondary)
                    .background(Color(.secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 15)
                .background(Color("MainBlue").edgesIgnoringSafeArea(.top))

                GeometryReader { geometry in

                    ScrollView {
                        VStack(alignment: .center, spacing: 10) {
                            ForEach(self.movies.sorted(by: { $0.voteAverage > $1.voteAverage })
                                .filter {
                                    $0.title.lowercased().contains(self.search.lowercased()) || self.search.isEmpty
                                }
                            ) { movie in
                                MovieCellView(movie: movie, geometry: geometry)
                            }
                        }
                        .padding(.bottom)
                        .frame(width: UIScreen.main.bounds.width)
                    }
                }
                .navigationBarHidden(isSearching)
                .navigationBarItems(leading: navigationBarLogo("logo"))
                .navigationBarTitle("", displayMode: .inline)
                .background(Color(.tertiarySystemBackground))
                .edgesIgnoringSafeArea([.horizontal, .bottom])
            }
        }
        .animation(.spring())
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear {
            NetworkManager.shared.fetchPopularMovies { (response: Result<[PopularMovie], CustomError>) in
                switch response {
                    case .failure(let error):
                        dump(error)
                    case .success(let movies):
                        self.movies = movies
                        dump(movies)
                }
            }
        }
    }
}
