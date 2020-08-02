//
//  CustomPopup.swift
//  Popular Movies
//
//  Created by Álvaro Gutiérrez Jácome on 02/08/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import SwiftUI

struct CustomPopup: View {
    let message: String
    let action: () -> Void
    var body: some View {
        ZStack(alignment: .center) {
            Color.black
                .opacity(0.7)
                .edgesIgnoringSafeArea(.all)

            VStack(alignment: .center, spacing: 10) {
                Text(self.message)
                    .font(.title)
                    .fontWeight(.thin)
                    .foregroundColor(Color(.systemBackground))
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.7)
                    .padding()

                Button(action: self.action) {
                    Text(Strings.ok)
                        .fontWeight(.medium)
                        .foregroundColor(Color(.systemBackground))
                        .padding(.vertical, 20)
                        .padding(.horizontal, 40)
                }
                .background(Colors.lightGreen)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding()
            }
            .padding(20)
            .background(Colors.mainBlue
                .opacity(0.9))
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .shadow(color: Colors.lightGreen.opacity(0.5), radius: 10, x: -2, y: -2)
            .shadow(color: Colors.lightBlue.opacity(0.5), radius: 10, x: 2, y: 2)
            .padding(20)
        }
    }
}
