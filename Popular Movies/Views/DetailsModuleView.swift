//
//  DetailsModuleView.swift
//  Popular Movies
//
//  Created by Álvaro Gutiérrez Jácome on 01/08/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import SwiftUI

struct DetailsModuleView: View {
    @Binding var movieDetails: Movie?

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Details")
                .font(.title)
                .fontWeight(.light)
            HStack {
                VStack {
                    VStack {
                        Text("Original Language")
                            .font(.headline)
                            .fontWeight(.light)
                        Text(self.movieDetails!.originalLanguage)
                            .font(.headline)
                            .fontWeight(.light)
                    }
                    VStack {
                        Text("Revenue")
                            .font(.headline)
                            .fontWeight(.light)
                        Text("\(self.movieDetails!.revenue)")
                            .font(.headline)
                            .fontWeight(.light)
                    }
                    VStack {
                        Text("Budget")
                            .font(.headline)
                            .fontWeight(.light)
                        Text("\(self.movieDetails!.revenue)")
                            .font(.headline)
                            .fontWeight(.light)
                    }
                }

                Spacer()

                VStack {
                    VStack {
                        Text("Release date")
                            .font(.headline)
                            .fontWeight(.light)
                        Text(self.movieDetails!.releaseDate)
                            .font(.headline)
                            .fontWeight(.light)
                    }
                }
            }
        }
        .modifier(ModuleModifier())
    }
}
