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
        NavigationLink(destination: MovieDetailScreen(viewModel: DetailScreenViewModel(wid: movie))) {
            ZStack(alignment: .bottomLeading) {
                HStack(alignment: .center) {
                    VStack(alignment: .leading, spacing: 10) {
                        HStack(alignment: .center) {
                            Text(movie.title)
                                .font(.headline)
                                .fontWeight(.medium)
                            Spacer()
                            Text(String(format: "%.1f", movie.voteAverage))
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundColor(Colors.mainBlue)
                                .padding(8)
                                .background(LinearGradient(gradient: Gradient(colors: [Colors.lightBlue, Colors.lightGreen, Colors.lightGreen]), startPoint: .bottomLeading, endPoint: .topTrailing))
                                .clipShape(Circle())
                        }
                        .layoutPriority(1)
                        Text(movie.overview)
                            .font(.caption)
                            .fontWeight(.thin)
                        Text("Release: \(movie.releaseDate)")
                            .font(.caption)
                            .fontWeight(.thin)
                    }
                    .padding(.leading, geometry.size.width * 0.4)
                    .padding([.vertical, .trailing])
                }
                .frame(height: geometry.size.width * 0.4)
                .background(Color(.systemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))

                MovieImageView(path: movie.posterPath, placeholder: Images.posterPlaceholder.resizable(), loadingView: LoadingView(geometry: geometry))
                    .scaledToFill()
                    .frame(width: geometry.size.width * 0.33, height: geometry.size.width * 0.48)
                    .background(Colors.mainBlue)
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .stroke(LinearGradient(gradient: Gradient(colors: [Colors.lightGreen, Colors.lightBlue]), startPoint: .bottom, endPoint: .top), lineWidth: 0.5).opacity(0.8))
                    .padding()
                    .zIndex(1)
            }
            .frame(width: geometry.size.width * 0.9)
            .shadow(radius: 10, x: 5, y: 5)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
