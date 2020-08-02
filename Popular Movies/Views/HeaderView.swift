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
            MovieImageView(path: movie.backdropPath!, placeholder: Images.backdropPlaceHolder.resizable(), loadingView: Images.backdropPlaceHolder.resizable())
                .scaledToFill()
                .frame(width: geometry.size.width, height: geometry.size.width * 0.65)
                .overlay(Colors.mainBlue.opacity(0.6))
                .clipped()

            MovieImageView(path: movie.posterPath!, placeholder: Images.posterPlaceholder.resizable(), loadingView: Images.posterPlaceholder.resizable())
                .scaledToFill()
                .frame(width: geometry.size.width * 0.33, height: geometry.size.width * 0.48)
                .clipped()
                .background(Colors.mainBlue)
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                .overlay(RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .stroke(LinearGradient(gradient: Gradient(colors: [Colors.lightGreen, Colors.lightBlue]), startPoint: .bottom, endPoint: .top), lineWidth: 0.5).opacity(0.8))
                .padding()
                .shadow(color: Colors.lightGreen.opacity(0.4), radius: 20)

            SFSymbols.arrowLeft
                .resizable()
                .foregroundColor(Color(.secondarySystemBackground))
                .padding(2)
                .background(LinearGradient(gradient: Gradient(colors: [Colors.lightBlue, Colors.lightGreen, Colors.lightGreen]), startPoint: .bottomLeading, endPoint: .topTrailing))
                .clipShape(Circle())
                .frame(width: geometry.size.width * 0.08, height: geometry.size.width * 0.08)
                .clipped()
                .offset(x: -geometry.size.width / 2.5, y: -geometry.size.width / 2.3)
                .onTapGesture {
                    let generator = UIImpactFeedbackGenerator(style: .soft)
                    self.presentationMode.wrappedValue.dismiss()
                    generator.impactOccurred()
                }.zIndex(1)
        }
        .frame(width: geometry.size.width, height: geometry.size.width * 0.65)
        .padding(.bottom, 4)
        .background(LinearGradient(gradient: Gradient(colors: [Colors.lightGreen, Colors.lightBlue]), startPoint: .leading, endPoint: .trailing))
    }
}
