//
//  ModuleModifier.swift
//  Popular Movies
//
//  Created by Álvaro Gutiérrez Jácome on 01/08/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import SwiftUI

struct ModuleModifier: ViewModifier {
    let geometry: GeometryProxy

    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color(.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(LinearGradient(gradient: Gradient(colors: [Color("LightGreen"), Color("LightBlue")]), startPoint: .leading, endPoint: .trailing), lineWidth: 0.5).opacity(0.8))
            .shadow(radius: 10, x: 5, y: 5)
            .padding([.top, .horizontal])
            .fixedSize(horizontal: false, vertical: true)

    }
}
