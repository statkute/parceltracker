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
            .navigationBarHidden(showCancelButton)
            
            
            // Parcel List
            List {
                ForEach(parcelData.filter{($0.label.lowercased().hasPrefix(searchText.lowercased()) || searchText == "") && ($0.statusFilter == selectedParcelFilter.filter)}) { parcel in
                    ParcelRow(parcel: parcel)
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
