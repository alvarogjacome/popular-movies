//
//  Constants.swift
//  Popular Movies
//
//  Created by Álvaro Gutiérrez Jácome on 02/08/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import SwiftUI

enum SFSymbols {
    static let glass = Image(systemName: "magnifyingglass")
    static let xmark = Image(systemName: "xmark.circle")
    static let arrowLeft = Image(systemName: "arrow.left.circle")
    static let arrowDown = Image(systemName: "arrow.up.arrow.down.circle.fill")
    static let following = UIImage(systemName: "person.2")
}

enum Images {
    static let posterPlaceholder = Image("PosterPlaceholder")
    static let backdropPlaceHolder = Image("BackdropPlaceholder")
}

enum ScreenSize {
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
}

enum Colors {
    static let mainBlue = Color("MainBlue")
    static let lightGreen = Color("LightGreen")
    static let lightBlue = Color("LightBlue")
}

enum UIColors {
    static let mainBlue = UIColor(named: "MainBlue")
    static let lightGreen = UIColor(named: "LightGreen")
    static let lightBlue = UIColor(named: "LightBlue")
}

enum Strings {
    static let search = "Search"
    static let originalTitle = "Original title: %@"
    static let minutes = "%d min"
    static let synopsis = "Synopsis"
    static let details = "Details: "
    static let originalLanguage = "Original language: "
    static let revenue = "Revenue: "
    static let budget = "Budget: "
    static let releaseDate = "Release date: "
    static let yes = "Yes"
    static let no = "No"
    static let adults = "Adults"
    static let ok = "Ok"
}
