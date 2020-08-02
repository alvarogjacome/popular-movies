//
//  Extension+View.swift
//  Popular Movies
//
//  Created by Álvaro Gutiérrez Jácome on 01/08/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import SwiftUI

extension View {
    func navigationBarLogo(_ name: String) -> some View {
        Image(name)
            .resizable()
            .scaledToFit()
            .frame(width: ScreenSize.width / 3)
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
