//
//  SummaryModuleView.swift
//  Popular Movies
//
//  Created by Álvaro Gutiérrez Jácome on 01/08/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import SwiftUI

struct SummaryModuleView: View {
    let movieDetails: Movie

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Synopsis")
                .font(.title)
                .fontWeight(.light)
            HStack(alignment: .top) {
                Text(self.movieDetails.overview)
                    .font(.headline)
                    .fontWeight(.light)
               Spacer(minLength: 0)
            }
        }
    }
}
