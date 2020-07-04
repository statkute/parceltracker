//
//  ParcelRow.swift
//  Parceltracker
//
//  Created by Gintare Statkute on 2020-06-28.
//

import SwiftUI

var infoButtonSystemName = "info.circle"

struct ParcelRow: View {
    @State var tag:Int? = nil
    var parcelName: String
    var courierName: String
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text(parcelName)
                    Spacer()
                }
                HStack {
                    Text(courierName)
                        .foregroundColor(.secondary)
                    Spacer()
                }
            }
            Spacer()
            HStack {
                Text("Arriving Today") // TODO should merge the parcel status (parcelview PR) and parcel objects to get this info
                    .foregroundColor(.secondary)
                
                
                ZStack {
                    NavigationLink(destination: TrackParcel(tracking: trackingInfo, name: self.parcelName), tag: 1, selection: $tag){
                        EmptyView()
                    }.buttonStyle(PlainButtonStyle()).hidden().frame(width: 0)
                        
                    Button(action: {self.tag = 1}) {
                        Image(systemName: infoButtonSystemName)
                        .imageScale(.large)
                        .foregroundColor(.accentColor)  // otherwise gets overwridden when inside a list
                    }
                    
                    
                }
            }
        }
    }
}

struct ParcelRow_Previews: PreviewProvider {
    static var previews: some View {
        ParcelRow(parcelName: "Books from ebay", courierName: "Royal Mail")
    }
}
