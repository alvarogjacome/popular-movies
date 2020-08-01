//
//  SummaryModuleView.swift
//  Popular Movies
//
//  Created by Álvaro Gutiérrez Jácome on 01/08/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import SwiftUI

struct SummaryModuleView: View {
    @Binding var movieDetails: Movie?

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Summary")
                .font(.title)
                .fontWeight(.light)
            Text(self.movieDetails!.overview)
                .font(.headline)
                .fontWeight(.light)
        }
        .modifier(ModuleModifier())
    }
}
