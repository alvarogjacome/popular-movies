//
//  HeaderView.swift
//  Popular Movies
//
//  Created by Álvaro Gutiérrez Jácome on 01/08/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import SwiftUI

struct HeaderView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    let movie: PopularMovie
    let geometry: GeometryProxy

    var body: some View {
        ZStack(alignment: .bottom) {
            CustomImageView(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.backdropPath!)")!, placeholder: Image("BackdropPlaceholder").resizable())
                .scaledToFill()
                .frame(width: geometry.size.width, height: geometry.size.width * 0.65)
                .overlay(Color("MainBlue").opacity(0.6))
                .clipped()

            CustomImageView(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath!)")!, placeholder: LoadingView(geometry: geometry))
                .scaledToFill()
                .frame(width: geometry.size.width * 0.33, height: geometry.size.width * 0.48)
                .clipped()
                .background(Color("MainBlue"))
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                .overlay(RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .stroke(LinearGradient(gradient: Gradient(colors: [Color("LightGreen"), Color("LightBlue")]), startPoint: .bottom, endPoint: .top), lineWidth: 0.5).opacity(0.8))
                .padding()
                .shadow(color: Color("LightGreen").opacity(0.4), radius: 20)

            Image(systemName: "arrow.left.circle")
                .resizable()
                .foregroundColor(Color(.secondarySystemBackground))
                .padding(2)
                .background(LinearGradient(gradient: Gradient(colors: [Color("LightBlue"), Color("LightGreen"), Color("LightGreen")]), startPoint: .bottomLeading, endPoint: .topTrailing))
                .clipShape(Circle())
                .frame(width: geometry.size.width * 0.08, height: geometry.size.width * 0.08)
                .clipped()
                .offset(x: -geometry.size.width / 2.5, y: -geometry.size.width / 2.3)
                .onTapGesture {
                    let generator = UIImpactFeedbackGenerator(style: .soft)
                    self.presentationMode.wrappedValue.dismiss()
                    generator.impactOccurred()
                }
        }
        .frame(width: geometry.size.width, height: geometry.size.width * 0.65)
        .padding(.bottom, 4)
        .background(LinearGradient(gradient: Gradient(colors: [Color("LightGreen"), Color("LightBlue")]), startPoint: .leading, endPoint: .trailing))
    }
}