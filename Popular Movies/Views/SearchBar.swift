//
//  SearchBar.swift
//  Popular Movies
//
//  Created by Álvaro Gutiérrez Jácome on 01/08/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import SwiftUI

struct SearchBar: View {
    @Binding var search: String
    @Binding var isSearching: Bool

    var body: some View {
        HStack {
            HStack(spacing: 2) {
                Image(systemName: "magnifyingglass")
                    .padding(.horizontal, 8)

                TextField("Search", text: $search, onEditingChanged: { searching in
                    self.isSearching = searching
                })
                    .foregroundColor(.primary)

                if !search.isEmpty {
                    Image(systemName: "xmark.circle")
                        .onTapGesture {
                            self.hideKeyboard()
                            self.isSearching = false
                            self.search = ""
                        }
                        .padding(.horizontal, 8)
                }
            }
            .padding(5)
            .foregroundColor(.secondary)
            .background(Color(.secondarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .padding(.vertical, 8)
        .padding(.horizontal)
        .frame(width: UIScreen.main.bounds.width)
        .background(Color("MainBlue")
            .edgesIgnoringSafeArea(.top))
        .padding(.bottom, 3)
        .background(LinearGradient(gradient: Gradient(colors: [Color("LightGreen"), Color("LightBlue")]), startPoint: .leading, endPoint: .trailing))
        .animation(.spring())
    }
}
