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
                GeometryReader { (stackProxy: GeometryProxy) in
                    VStack (spacing: 0) {
                        
                        GeometryReader { (symbolProxy: GeometryProxy) in
                            HStack {
                                Image(systemName: "arrow.up.circle")
                                    .frame(height: 23)
                                    .offset(x: symbolProxy.size.width/60)
                                    .font(Font.system(size: 22,weight: .semibold))
                            }
                        }
                        Spacer()
                        ForEach(parcelLifespan) { update in
                            ParcelStatus(status: update)
                                //.listRowInsets(EdgeInsets())
                                .padding(.leading)
                                .border(width: 2.3, edge: .leading, color: .black)
                        }
                    }
                }
            }
            .frame(alignment: .topLeading)
            .padding()
        
            .navigationBarTitle(parcelName)
        }
    }
}

struct TrackParcel_Previews: PreviewProvider {
    static var previews: some View {
        TrackParcel(name: "Books from Ebay")
    }
}
