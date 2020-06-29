//
//  ParcelStatusList.swift
//  Parceltracker
//
//  Created by Harry Levick on 29/06/2020.
//

import SwiftUI

struct ParcelStatusList: View {
    var delivered : Bool
    var updateList : [Status]
    
    var body: some View {
        ScrollView() {
            VStack (spacing: 0) { // spacing: 0 ensures no spacing between vertical items
                
                GeometryReader { (symbolProxy: GeometryProxy) in
                    HStack {
                        
                        Image(systemName: self.delivered ? DeliveredIcon : PendingDeliveredIcon)
                            .padding(.top, 5) // padding to ensure icon fits into view
                            // use width of scroll bar to place icon at the end of the left border
                            // found basically using trial and error and it works ¯\_(ツ)_/¯
                            // But since it uses the width of the parent view, this is pretty robust for all devices.
                            .offset(x: symbolProxy.size.width/59.5)
                            .font(Font.system(size: IconSize, weight: .semibold))
                            .foregroundColor(self.delivered ? .green : .black)
                    }
                }
                
                Spacer()
                
                ForEach(self.updateList) { update in
                    ParcelStatus(status: update)
                        .padding(.leading)
                        .border(width: TrackBarWidth, edge: .leading,
                                color: (self.delivered ? .green : .black))
                }
            }
        }
        
    }
}
