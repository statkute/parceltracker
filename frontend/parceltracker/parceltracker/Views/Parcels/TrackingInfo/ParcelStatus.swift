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
            if status.header != "" {
                Text(status.header)
                    .font(.system(size: 25))
                    .fontWeight(.semibold)
            }
            Spacer()
            HStack {
                Text(status.date)
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                Spacer()
                Text(status.time)
                    .font(.system(size: 14))
                    .fontWeight(.medium)
            }
            Text(status.location)
                .font(.system(size: 14))
                .fontWeight(.medium)
            Text(
                status.statusType == .signature ? "Signature" :
                status.statusType == .warehouse_scan ? "Warehouse Scan" :
                status.statusType == .import_scan ? "Import Scan" :
                ""
            )
            .font(.system(size: 14))
            .fontWeight(.medium)
            
        }
        .padding()
        .frame(height: status.header != "" ? 100 : 70)
    }
}
