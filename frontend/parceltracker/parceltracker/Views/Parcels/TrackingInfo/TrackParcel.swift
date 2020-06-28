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
        Text("Hello World")
        /*
         
        NavigationView {
        
            List(parcelLifespan) { statusUpdate in
                Image(systemName: "arrow.up.circle")
                    .frame(width: 1, height: 1)
                    .font(.system(size: 21))
                
                ParcelStatus(status: statusUpdate)
                
                
            }
            .border(width: 2, edge: .leading, color: .black)
            .padding()
            
            .navigationBarTitle(parcelName)
            
        }
         */
    }
}

struct TrackParcel_Previews: PreviewProvider {
    static var previews: some View {
        TrackParcel(name: "Books from Ebay")
    }
}
