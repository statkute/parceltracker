//
//  ParcelsHomeTab.swift
//  Parceltracker
//
//  Created by Gintare Statkute on 2020-06-28.
//

import SwiftUI

struct ParcelsHomeTab: View {
    var body: some View {
        NavigationView{
            ParcelList()
            .navigationBarTitle(Text("Your Parcels"))
            .navigationBarItems(trailing: Button(action: {}) {
                Image(systemName: "plus").foregroundColor(.accentColor).imageScale(.large)
            })
        }.buttonStyle(PlainButtonStyle())
    }
}

struct ParcelsHomeTab_Previews: PreviewProvider {
    static var previews: some View {
        ParcelsHomeTab()
    }
}
