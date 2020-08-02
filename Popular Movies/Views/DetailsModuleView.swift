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
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 10) {
                    VStack(alignment: .leading) {
                        Text("Original language:")
                            .font(.headline)
                            .fontWeight(.light)
                        Text(self.movieDetails!.originalLanguage)
                            .font(.subheadline)
                            .fontWeight(.thin)
                    }
                    VStack(alignment: .leading) {
                        Text("Revenue:")
                            .font(.headline)
                            .fontWeight(.light)
                        Text("\(self.movieDetails!.revenue)$")
                            .font(.subheadline)
                            .fontWeight(.thin)
                    }
                    VStack(alignment: .leading) {
                        Text("Budget:")
                            .font(.headline)
                            .fontWeight(.light)
                        Text("\(self.movieDetails!.budget)$")
                            .font(.subheadline)
                            .fontWeight(.thin)
                    }
                }

                Spacer()

                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text("Release date:")
                            .font(.headline)
                            .fontWeight(.light)
                        Text(self.movieDetails!.releaseDate)
                            .font(.subheadline)
                            .fontWeight(.thin)
                    }
                }
            }
        }
    }
}
