//
//  LoadingView.swift
//  Popular Movies
//
//  Created by Álvaro Gutiérrez Jácome on 01/08/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
    @State private var shouldAnimate = false
    let geometry: GeometryProxy

    var body: some View {
        ZStack {
            Color(.black)
                .opacity(0.4)
                .edgesIgnoringSafeArea(.all)

            HStack(alignment: .center, spacing: shouldAnimate ? 25 : 10) {
                LittleColumn(shouldAnimate: $shouldAnimate, geometry: geometry)
                BigColumn(shouldAnimate: $shouldAnimate, geometry: geometry)
                LittleColumn(shouldAnimate: $shouldAnimate, geometry: geometry)
            }
            .animation(Animation.spring().repeatForever(autoreverses: true))
            .onAppear {
                self.shouldAnimate = true
            }
        }
        .animation(.spring())
    }
}

private struct BigColumn: View {
    @Binding var shouldAnimate: Bool
    let geometry: GeometryProxy

    var body: some View {
        VStack(spacing: 20) {
            RoundedRectangle(cornerRadius: 16)
                .fill(LinearGradient(gradient: Gradient(colors: [Color("LightGreen"), Color("LightBlue")]), startPoint: .leading, endPoint: .trailing))
                .frame(width: geometry.size.height * 0.015, height: geometry.size.height * 0.030)
                .scaleEffect(shouldAnimate ? 2 : 1)
        }
        .shadow(color: .black, radius: 5)
    }
}

private struct LittleColumn: View {
    @Binding var shouldAnimate: Bool
    let geometry: GeometryProxy

    var body: some View {
        VStack(spacing: 20) {
            RoundedRectangle(cornerRadius: 16)
                .fill(LinearGradient(gradient: Gradient(colors: [Color("LightGreen"), Color("LightBlue")]), startPoint: .leading, endPoint: .trailing))
                .frame(width: geometry.size.height * 0.015, height: geometry.size.height * 0.030)
                .scaleEffect(shouldAnimate ? 1 : 2)
        }
        .shadow(color: .black, radius: 5)
    }
}
