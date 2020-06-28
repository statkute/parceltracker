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
    
    var body: some View {
        VStack(alignment: .leading) {
            
            OptionalView(self.status.header) { header in
                Text(header)
                    .font(.system(size: HeadingSize))
                    .fontWeight(.semibold)
            }
            
            Spacer()
            HStack {
                Text(status.date)
                    .font(.system(size: SubHeadingSize))
                    .fontWeight(.medium)
                Spacer()
                Text(status.time)
                    .font(.system(size: SubHeadingSize))
                    .fontWeight(.medium)
            }
            Text(status.location)
                .font(.system(size: SubHeadingSize))
                .fontWeight(.medium)
            
            OptionalView(self.status.statusType) { status in
                Text(status.rawValue)
                    .font(.system(size: SubHeadingSize))
                    .fontWeight(.medium)
            }

        }
        .padding()
        .frame(height: status.header != nil ? 100 : 70)
    }
}


struct ParcelStatus_Previews: PreviewProvider {
    static var previews: some View {
        ParcelStatus(status: Status(id: 1, header: "Title", date: "date", time: "time", location: "location", statusType: .signature))
    }
}
