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
    var parcel: Parcel
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text(self.parcel.label)
                    Spacer()
                }
                HStack {
                    Text(courierData[self.parcel.trackingInfo.courierId].name)
                        .foregroundColor(.secondary)
                    Spacer()
                }
            }
            Spacer()
            HStack {
                Text("Arriving Today") // TODO should merge the parcel status (parcelview PR) and parcel objects to get this info
                    .foregroundColor(.secondary)
                
                
                ZStack {
                    NavigationLink(destination: TrackParcel(parcel: self.parcel), tag: 1, selection: $tag){
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
        ParcelRow(parcel: parcelData[0])
    }
}
