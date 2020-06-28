//
//  TrackParcel.swift
//  parceltracker
//
//  Created by Harry Levick on 21/06/2020.
//  Copyright © 2020 Bourn32. All rights reserved.
//
import SwiftUI

struct TrackParcel: View {
    var parcelName : String

    init(name : String) {
        parcelName = name
        UITableView.appearance().separatorColor = .clear
    }
    
    var body: some View {
        NavigationView {
            
            ScrollView() {
                VStack (spacing: 0) {
                    
                    Image(systemName: "arrow.up.circle")
                        .frame(height: 17)
                        .offset(x: -160, y: 3.4)
                        .font(Font.system(size: 23, weight: .semibold))
                    
                    ForEach(parcelLifespan) { update in
                        ParcelStatus(status: update)
                            //.listRowInsets(EdgeInsets())
                            .padding(.leading)
                            .border(width: 2.3, edge: .leading, color: .black)
                    }
                }
            }
            .frame(height: 550, alignment: .topLeading)
            .padding(35)
            
            .navigationBarTitle(parcelName)
        }
    }
}

struct TrackParcel_Previews: PreviewProvider {
    static var previews: some View {
        TrackParcel(name: "Books from Ebay")
    }
}
