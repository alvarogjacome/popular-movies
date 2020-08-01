//
//  MovieCellView.swift
//  Popular Movies
//
//  Created by Álvaro Gutiérrez Jácome on 01/08/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import SwiftUI

struct MovieCellView: View {
    let movie: PopularMovie
    let geometry: GeometryProxy
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            HStack(alignment: .center) {
                VStack(alignment: .leading, spacing: 10) {
                    HStack(alignment: .center) {
                        Text(movie.title)
                            .font(.headline)
                            .fontWeight(.light)
                        Spacer()
                        Text(String(format: "%.1f", movie.voteAverage))
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(Color("MainBlue"))
                            .padding(8)
                            .background(LinearGradient(gradient: Gradient(colors: [Color("LightBlue"), Color("LightGreen"), Color("LightGreen")]), startPoint: .bottomLeading, endPoint: .topTrailing))
                            .clipShape(Circle())
                    }
                    .layoutPriority(1)
                    Text(movie.overview)
                        .font(.caption)
                        .fontWeight(.light)
                    Text("Release date: \(movie.releaseDate)")
                        .font(.caption)
                        .fontWeight(.light)
                }
                .padding(.leading, geometry.size.width * 0.4)
                .padding([.vertical, .trailing])
            }
            .frame(height: geometry.size.width * 0.4)
            .background(Color(.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))

            Image("drive")
                .resizable()
                .frame(width: geometry.size.width * 0.33, height: geometry.size.width * 0.48)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .overlay(RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .stroke(Color(.systemGray4), lineWidth: 1))
                .padding()
        }
        .frame(width: geometry.size.width * 0.9)
        .shadow(radius: 10, x: 5, y: 5)
    }
}
