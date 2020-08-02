//
//  DetailsModuleView.swift
//  Popular Movies
//
//  Created by Álvaro Gutiérrez Jácome on 01/08/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import SwiftUI

struct DetailsModuleView: View {
    let movieDetails: Movie

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(Strings.details)
                .font(.title)
                .fontWeight(.light)
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 10) {
                    VStack(alignment: .leading) {
                        Text(Strings.originalLanguage)
                            .font(.headline)
                            .fontWeight(.light)
                        Text(self.movieDetails.originalLanguage)
                            .font(.subheadline)
                            .fontWeight(.thin)
                    }
                    VStack(alignment: .leading) {
                        Text(Strings.revenue)
                            .font(.headline)
                            .fontWeight(.light)
                        Text("\(self.movieDetails.revenue)$")
                            .font(.subheadline)
                            .fontWeight(.thin)
                    }
                    VStack(alignment: .leading) {
                        Text(Strings.budget)
                            .font(.headline)
                            .fontWeight(.light)
                        Text("\(self.movieDetails.budget)$")
                            .font(.subheadline)
                            .fontWeight(.thin)
                    }
                }

                Spacer()

                VStack(alignment: .leading, spacing: 10) {
                    VStack(alignment: .leading) {
                        Text(Strings.releaseDate)
                            .font(.headline)
                            .fontWeight(.light)
                        Text(self.movieDetails.releaseDate)
                            .font(.subheadline)
                            .fontWeight(.thin)
                    }
                    VStack(alignment: .leading) {
                        Text(Strings.adults)
                            .font(.headline)
                            .fontWeight(.light)
                        Text(self.movieDetails.adult ? Strings.yes : Strings.no)
                            .font(.subheadline)
                            .fontWeight(.thin)
                    }
                }
            }
        }
    }
}
