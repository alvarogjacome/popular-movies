//
//  MovieDetailsMainModuleView.swift
//  Popular Movies
//
//  Created by Álvaro Gutiérrez Jácome on 01/08/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import SwiftUI

struct MainModuleView: View {
    let movieDetails: Movie

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 8) {
                Text(self.movieDetails.title)
                    .font(.title)
                    .fontWeight(.light)
                    .layoutPriority(1)
                Text(self.getGenres())
                    .font(.headline)
                    .fontWeight(.light)
                    .multilineTextAlignment(.leading)
                if !self.movieDetails.tagline.isEmpty {
                    Text(self.movieDetails.tagline)
                        .font(.subheadline)
                        .fontWeight(.ultraLight)
                }
                Text("Original title: \(self.movieDetails.originalTitle)")
                    .font(.caption)
                    .fontWeight(.ultraLight)
            }
            Spacer()
            VStack(alignment: .center, spacing: 5) {
                Text(String(format: "%.1f", self.movieDetails.voteAverage))
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundColor(Color("MainBlue"))
                    .padding(10)
                    .background(LinearGradient(gradient: Gradient(colors: [Color("LightBlue"), Color("LightGreen"), Color("LightGreen")]), startPoint: .bottomLeading, endPoint: .topTrailing))
                    .clipShape(Circle())
                Text(self.movieDetails.status)
                    .font(.caption)
                    .fontWeight(.ultraLight)
                Text("\(self.movieDetails.runtime) min")
                    .font(.headline)
                    .fontWeight(.ultraLight)
            }
        }
    }

    private func getGenres() -> String {
        self.movieDetails.genres.map {
            $0.name
        }.joined(separator: ", ")
    }
}
