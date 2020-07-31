//
//  ContentView.swift
//  Popular Movies
//
//  Created by Álvaro Gutiérrez Jácome on 31/07/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import SwiftUI

struct PopularMoviesListScreen: View {
    var body: some View {
        Text("Hello, World!")
            .onAppear {
                NetworkManager.shared.fetchPopularMovies { (response: Result<[PopularMovie], CustomError>) in
                    dump(response)
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PopularMoviesListScreen()
    }
}
