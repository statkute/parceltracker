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
    var trackingInfo : TrackingInfo

    init(tracking : TrackingInfo, name : String) {
        trackingInfo = tracking
        parcelName = name
        UITableView.appearance().separatorColor = .clear
    }
    
    var body: some View {
        NavigationView {
            // GeometryReader:
            // Used to get the width of the most outer view, from within a child view.
            // This is used to generate the dynamic offset for the icon and sub headers.
            GeometryReader { (stackProxy: GeometryProxy) in
                
                HStack {
                    Text(self.trackingInfo.courier.name)
                        .fontWeight(.light)
                        .foregroundColor(.secondary)
                        // use width of device screen to space courier name below Nav title
                        // found basically using trial and error and it works ¯\_(ツ)_/¯
                        .padding(.leading, stackProxy.size.width/100)
                        .padding(.top)
                    Spacer()
                    Text(self.trackingInfo.trackingNumber)
                        .fontWeight(.light)
                        .foregroundColor(.secondary)
                        .padding(.top)
                }
                .frame(height: -30) // negative height to space the subheading below the heading
                
                ParcelStatusList(delivered: self.trackingInfo.delivered, updateList: self.trackingInfo.trackingInfo)
                    .padding(.top, 40) // padding at the top of the scroll view
                    .padding(.bottom, 40) // padding at the bottom of the scroll view
            }
            .padding()
        
            .navigationBarTitle(parcelName)
        }
    }
}

struct TrackParcel_Previews: PreviewProvider {
    static var previews: some View {
        TrackParcel(tracking: trackingInfo, name: "Books from Ebay")
    }
}
