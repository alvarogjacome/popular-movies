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
            Color.black
                .opacity(0.4)
                .edgesIgnoringSafeArea(.all)

            HStack(alignment: .center, spacing: shouldAnimate ? 15 : 5) {
                LittleColumn(shouldAnimate: $shouldAnimate, geometry: geometry)
                BigColumn(shouldAnimate: $shouldAnimate, geometry: geometry)
                LittleColumn(shouldAnimate: $shouldAnimate, geometry: geometry)
            }
            .frame(width: shouldAnimate ? geometry.size.width * 0.20 : geometry.size.width * 0.30)
            .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true))
            .onAppear {
                self.shouldAnimate = true
            }
        }
    }
}

private struct BigColumn: View {
    @Binding var shouldAnimate: Bool
    let geometry: GeometryProxy

    var body: some View {
        VStack(spacing: 20) {
            Circle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color("LightGreen"), Color("LightBlue")]), startPoint: .leading, endPoint: .trailing))
                .frame(width: geometry.size.height * 0.015)
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
            Circle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color("LightGreen"), Color("LightBlue")]), startPoint: .leading, endPoint: .trailing))
                .frame(width: geometry.size.height * 0.015)
                .scaleEffect(shouldAnimate ? 1 : 2)
        }
        .shadow(color: .black, radius: 5)
    }
}
