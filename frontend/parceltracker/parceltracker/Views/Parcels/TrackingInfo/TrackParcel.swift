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
                
                ScrollView() {
                    VStack (spacing: 0) { // spacing: 0 ensures no spacing between vertical items
                        
                        GeometryReader { (symbolProxy: GeometryProxy) in
                            HStack {
                                
                                Image(systemName: self.trackingInfo.delivered ? DeliveredIcon : PendingDeliveredIcon)
                                    .padding(.top, 5) // padding to ensure icon fits into view
                                    // use width of scroll bar to place icon at the end of the left border
                                    // found basically using trial and error and it works ¯\_(ツ)_/¯
                                    // But since it uses the width of the parent view, this is pretty robust for all devices.
                                    .offset(x: symbolProxy.size.width/59.5)
                                    .font(Font.system(size: IconSize, weight: .semibold))
                                    .foregroundColor(self.trackingInfo.delivered ? .green : .black)
                            }
                        }
                        
                        Spacer()
                        
                        ForEach(self.trackingInfo.trackingInfo) { update in
                            ParcelStatus(status: update)
                                .padding(.leading)
                                .border(width: TrackBarWidth, edge: .leading,
                                        color: (self.trackingInfo.delivered ? .green : .black))
                        }
                    }
                }
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
