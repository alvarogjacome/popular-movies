//
//  MovieDetailsMainModuleView.swift
//  Popular Movies
//
//  Created by Álvaro Gutiérrez Jácome on 01/08/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import SwiftUI

struct MainModuleView: View {
    @Binding var movieDetails: Movie?

    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 8) {
                Text(self.movieDetails!.title)
                    .font(.largeTitle)
                    .fontWeight(.light)
                Text(self.getGenres())
                    .font(.headline)
                    .fontWeight(.light)
                    .multilineTextAlignment(.leading)
                Text(self.movieDetails!.tagline)
                    .font(.headline)
                    .fontWeight(.ultraLight)
                Text("Original title: \(self.movieDetails!.originalTitle)")
                    .font(.caption)
                    .fontWeight(.ultraLight)
            }
            Spacer()
            VStack(alignment: .center, spacing: 5) {
                Text(String(format: "%.1f", self.movieDetails!.voteAverage))
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundColor(Color("MainBlue"))
                    .padding(10)
                    .background(LinearGradient(gradient: Gradient(colors: [Color("LightBlue"), Color("LightGreen"), Color("LightGreen")]), startPoint: .bottomLeading, endPoint: .topTrailing))
                    .clipShape(Circle())
                    .padding(.vertical)
                Text(self.movieDetails!.status)
                    .font(.caption)
                    .fontWeight(.ultraLight)
                Text("\(self.movieDetails!.runtime) min")
                    .font(.headline)
                    .fontWeight(.ultraLight)
            }
        }
        .modifier(ModuleModifier())
    }

    private func getGenres() -> String {
        self.movieDetails!.genres.map {
            $0.name
        }.joined(separator: ", ")
    }
}
