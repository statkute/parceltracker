//
//  ParcelStatus.swift
//  parceltracker
//
//  Created by Harry Levick on 21/06/2020.
//  Copyright © 2020 Bourn32. All rights reserved.
//
import SwiftUI

struct ParcelStatus: View {
    var status : Status
    let heightWithHeader = CGFloat(100)
    let heightWithoutHeader = CGFloat(70)
    
    var body: some View {
        VStack(alignment: .leading) {
            
            OptionalView(self.status.header) { header in
                Text(header)
                    .font(.system(size: HeadingSize))
                    .fontWeight(.semibold)
            }
            
            Spacer()
            
            HStack {
                OptionalView(self.status.date) { date in
                    Text(date)
                        .font(.system(size: SubHeadingSize))
                        .fontWeight(.medium)
                }
                Spacer()
                OptionalView(self.status.time) { time in
                    Text(time)
                        .font(.system(size: SubHeadingSize))
                        .fontWeight(.medium)
                }
            }
            OptionalView(self.status.location) { location in
                Text(location)
                    .font(.system(size: SubHeadingSize))
                    .fontWeight(.medium)
            }
            
            OptionalView(self.status.statusType) { status in
                Text(status.rawValue)
                    .font(.system(size: SubHeadingSize))
                    .fontWeight(.medium)
            }

        }
        .padding()
        .frame(height: status.header == nil ? heightWithoutHeader : heightWithHeader)
    }
}


struct ParcelStatus_Previews: PreviewProvider {
    static var previews: some View {
        ParcelStatus(status: Status(id: 1, header: "Title", date: "date", time: "time", location: "location", statusType: .signature))
    }
}
