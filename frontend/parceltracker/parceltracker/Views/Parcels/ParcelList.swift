//
//  ParcelList.swift
//  Parceltracker
//
//  Created by Gintare Statkute on 2020-06-28.
//

import SwiftUI

struct ParcelList: View {
    @ObservedObject var selectedParcelFilter: SelectedParcelFilter
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
    var parcels = parcelData
    
    var body: some View {
        VStack {
            // Search Bar
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")

                    TextField("search", text: $searchText, onEditingChanged: { isEditing in
                        self.showCancelButton = true
                    }, onCommit: {
                        print("onCommit")
                    }).foregroundColor(.primary)

                    Button(action: {
                        self.searchText = ""
                    }) {
                        Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                    }
                }
                .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                .foregroundColor(.secondary)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10.0)

                if showCancelButton  {
                    Button("Cancel") {
                            UIApplication.shared.endEditing(true) // this must be placed before the other commands here
                            self.searchText = ""
                            self.showCancelButton = false
                    }
                    .foregroundColor(Color(.systemBlue))
                }
            }
            .padding(.horizontal)
            .navigationBarHidden(showCancelButton) // .animation(.default) // animation does not work properly
            
            
            // Courier List
            List {
                // the foreach below uses alphabetically sorted list of couriers
                ForEach(parcelData.filter{($0.label.hasPrefix(searchText) || searchText == "") && ($0.statusFilter == selectedParcelFilter.filter)}) { parcel in // TODO might want to do all lowercase comparison
                    ParcelRow(parcelName: parcel.label, courierName: findCourierById(courierId: parcel.courierId)!.name)
                }
            }
        }
    }
}

struct ParcelList_Previews: PreviewProvider {
    static var previews: some View {
        ParcelList(selectedParcelFilter: SelectedParcelFilter())
    }
}
