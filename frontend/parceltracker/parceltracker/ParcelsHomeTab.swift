//
//  ParcelsHomeTab.swift
//  Parceltracker
//
//  Created by Gintare Statkute on 2020-06-28.
//

import SwiftUI

struct ParcelsHomeTab: View {
    @ObservedObject var selectedParcelFilter = SelectedParcelFilter()

    var body: some View {
        GeometryReader { geometry in
            NavigationView{
                ParcelList(selectedParcelFilter: self.selectedParcelFilter)
                .navigationBarTitle(Text("Your Parcels"))
                .navigationBarItems(trailing:
                    HStack {
                        ParcelListFilter(selectedParcelFilter: self.selectedParcelFilter).padding(.trailing, (geometry.size.width / 2.0) - (102.5 + 45))
                        Spacer()
                        Button(action: {}) {
                            Image(systemName: "plus").foregroundColor(.accentColor).imageScale(.large)
                        }
                    }
                )
            }.buttonStyle(PlainButtonStyle())
        }
    }
}

struct ParcelsHomeTab_Previews: PreviewProvider {
    static var previews: some View {
        ParcelsHomeTab()
            .environment(\.colorScheme, .light)
    }
}

class SelectedParcelFilter: ObservableObject{
    @Published var filter: ParcelFilter = ParcelFilter.Past
    ;
}
