//
//  CustomError.swift
//  Popular Movies
//
//  Created by Álvaro Gutiérrez Jácome on 01/08/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import Foundation

enum CustomError: String, Error {
    case invalidRequest = "Invalid request. Please try again"
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received form de server was invalid. Please try again."
    case unableToConvertToImage = "Unable to convert data into image."
    case unableToSave = "Unable to save"
    case loadedFromStorage = "There is no internet connection. The data shown may not be updated."
}
