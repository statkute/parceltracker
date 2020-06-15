//
//  CourierSelect.swift
//  parceltracker
//
//  Created by Gintare Statkute on 2020-06-15.
//  Copyright © 2020 Bourn32. All rights reserved.
//

import SwiftUI

struct CourierSelect: View {
    var body: some View {
        NavigationView{ // TODO will have to be removed when the parent view already has the NavigatioView property
          CourierList()
          .navigationBarTitle(Text("Select a courier"))
        }
    }
}

struct CourierSelect_Previews: PreviewProvider {
    static var previews: some View {
        CourierSelect()
    }
}

