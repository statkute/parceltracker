//
//  ParcelConfig.swift
//  parceltracker
//
//  Created by Harry Levick on 20/06/2020.
//  Copyright © 2020 Bourn32. All rights reserved.
//

import SwiftUI

struct ParcelConfig: View {
    
    var body: some View {

        NavigationView {
            Form {
                ZStack {
                    Color.white.edgesIgnoringSafeArea(.all)
                    VStack(spacing: 0) {
                        ParcelAttribute(attributeName: "Tracking Number")
                        ParcelAttribute(attributeName: "Select a courier")
                        ParcelAttribute(attributeName: "Title")
                    }
                }
            }
            .navigationBarTitle(Text("Add a parcel"))
        }
        
    }
    
}

struct ParcelConfig_Previews: PreviewProvider {
    static var previews: some View {
        ParcelConfig()
        .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
    }
}
