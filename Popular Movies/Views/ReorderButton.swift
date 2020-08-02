//
//  ReorderButton.swift
//  Popular Movies
//
//  Created by Álvaro Gutiérrez Jácome on 02/08/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import SwiftUI

struct ReorderButton: View {
    let action: () -> Void
    var body: some View {
        Image(systemName: "arrow.up.arrow.down.circle.fill")
            .resizable()
            .scaleEffect(1.2)
            .foregroundColor(Color(.secondarySystemBackground))
            .padding(.horizontal, 8)
            .onTapGesture(perform: action)
    }
}
