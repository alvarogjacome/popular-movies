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
        appearance.shadowColor = .clear

        appearance.titleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 22, weight: .thin),
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                SearchBar(search: $search, isSearching: $isSearching)
                GeometryReader { geometry in

                    ScrollView(.vertical) {
                        VStack(alignment: .center, spacing: 10) {
                            ForEach(self.movies
                                .filter {
                                    $0.title.lowercased().contains(self.search.lowercased()) || self.search.isEmpty
                                }
                            ) { movie in
                                MovieCellView(movie: movie, geometry: geometry)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                        }
                        .padding(.bottom)
                        .frame(width: UIScreen.main.bounds.width)
                        .animation(.spring())
                    }
                }
                .navigationBarItems(leading: navigationBarLogo("logo"), trailing: Image(systemName: "arrow.up.arrow.down.circle.fill")
                    .resizable()
                    .scaleEffect(1.2)
                    .foregroundColor(Color(.secondarySystemBackground))
                    .padding(.horizontal, 8)
                    .onTapGesture {
                        let generator = UIImpactFeedbackGenerator(style: .heavy)
                        generator.impactOccurred()
                        self.movies.reverse()
                })
                .navigationBarTitle("", displayMode: .inline)
                .background(Color(.tertiarySystemBackground))
                .edgesIgnoringSafeArea([.horizontal, .bottom])
                .onTapGesture {
                    self.hideKeyboard()
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .accentColor(Color("LightGreen"))
        .onAppear {
            NetworkManager.shared.fetchPopularMovies { (response: Result<[PopularMovie], CustomError>) in
                switch response {
                    case .failure(let error):
                        dump(error)
                    case .success(let movies):
                        self.movies = movies.sorted(by: {
                            $0.popularity > $1.popularity
                        })
                }
            }
        }
    }
}
