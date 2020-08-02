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
                SFSymbols.glass
                    .padding(.horizontal, 8)

                TextField(Strings.search, text: $search, onEditingChanged: { searching in
                    self.isSearching = searching
                })
                    .foregroundColor(.primary)

                if !search.isEmpty {
                    SFSymbols.xmark
                        .onTapGesture {
                            self.hideKeyboard()
                            self.isSearching = false
                            self.search = ""
                        }
                        .padding(.horizontal, 8)
                }
            }
            .animation(.spring())
            .padding(5)
            .foregroundColor(.secondary)
            .background(Color(.secondarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .padding(.vertical, 8)
        .padding(.horizontal)
        .frame(width: ScreenSize.width)
        .background(Colors.mainBlue
            .edgesIgnoringSafeArea(.top))
        .padding(.bottom, 4)
        .background(LinearGradient(gradient: Gradient(colors: [Colors.lightGreen, Colors.lightBlue]), startPoint: .leading, endPoint: .trailing))
    }
}
