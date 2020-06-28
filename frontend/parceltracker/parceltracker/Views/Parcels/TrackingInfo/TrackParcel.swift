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
            
                
            GeometryReader { (stackProxy: GeometryProxy) in
                
                HStack {
                    Text(self.trackingInfo.courier.name)
                        .fontWeight(.light)
                        .foregroundColor(.secondary)
                        .padding(.leading, stackProxy.size.width/100)
                        .padding(.top)
                    Spacer()
                    Text(self.trackingInfo.trackingNumber)
                        .fontWeight(.light)
                        .foregroundColor(.secondary)
                        .padding(.top)
                }
                .frame(height: -30)
                
                ScrollView() {
                    VStack (spacing: 0) {
                        
                        GeometryReader { (symbolProxy: GeometryProxy) in
                            HStack {
                                
                                Image(systemName: self.trackingInfo.delivered ? "cube.box" : "arrow.up.circle")
                                    .frame(height: 26)
                                    .offset(x: symbolProxy.size.width/59.5)
                                    .font(Font.system(size: 22, weight: .semibold))
                                    .foregroundColor(self.trackingInfo.delivered ? .green : .black)
                                
                            }
                        }
                        Spacer()
                        ForEach(self.trackingInfo.trackingInfo) { update in
                            ParcelStatus(status: update)
                                //.listRowInsets(EdgeInsets())
                                .padding(.leading)
                                .border(width: 2.3, edge: .leading,
                                        color: (self.trackingInfo.delivered ? .green : .black))
                        }
                    }
                }
                .padding(.top, 40)
                .padding(.bottom, 40)
            }
            .frame(alignment: .topLeading)
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
