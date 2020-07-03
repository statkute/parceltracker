//
//  ParcelRow.swift
//  Parceltracker
//
//  Created by Gintare Statkute on 2020-06-28.
//

import SwiftUI

var infoButtonSystemName = "info.circle"

struct ParcelRow: View {
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
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {  // TODO add a link to the parcel view here
                    Image(systemName: infoButtonSystemName)
                        .imageScale(.large)
                        .foregroundColor(.accentColor) // otherwise gets overwridden when inside a list
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
