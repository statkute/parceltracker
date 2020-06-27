//
//  CourierRow.swift
//  parceltracker
//
//  Created by Gintare Statkute on 2020-06-15.
//  Copyright © 2020 Bourn32. All rights reserved.
//

import SwiftUI

struct CourierRow: View {
    var courier: Courier
    var body: some View {
        HStack {
            courier.image.resizable().scaledToFit().frame(width: 30, height: 30).padding(/*@START_MENU_TOKEN@*/.trailing, 5.0/*@END_MENU_TOKEN@*/)
            Text(courier.name)
            Spacer()
        }
    }
}

struct CourierRow_Previews: PreviewProvider {
    static var previews: some View {
        CourierRow(courier: courierData[3])
    }
}
