//
//  ParcelConfig.swift
//  parceltracker
//
//  Created by Harry Levick on 20/06/2020.
//  Copyright © 2020 Bourn32. All rights reserved.
//

import SwiftUI

struct ParcelConfig: View {
    var configView : configType
    
    enum configType {
        case add, edit
    }
    
    @ObservedObject var selectedCourier = SelectedCourier()
    
    var body: some View {
        VStack(spacing: 0) {
            
            NavigationView {
                VStack {
                    ParcelAttribute(selectedCourier: selectedCourier, attrTitle: "Tracking Number", attrIcon: EditIcon)
                    ParcelAttribute(selectedCourier: selectedCourier, attrTitle: "Select a courier", attrIcon: DeliveredIcon, isCourierField: true)
                    ParcelAttribute(selectedCourier: selectedCourier, attrTitle: "Title", attrIcon: TagIcon)
                    Spacer()
                }
                .navigationBarTitle(
                    configView == .add ? Text("Add a parcel") : Text("Edit parcel")
                )
                .navigationBarItems(trailing: Button(action: {}) {
                    configView == .add ? Text("Add") : Text("Save")
                })
                
            }
        }
    }
}

struct ParcelConfig_Previews: PreviewProvider {
    static var previews: some View {
        ParcelConfig(configView: ParcelConfig.configType.add)
    }
}

class SelectedCourier: ObservableObject{
    @Published var courierId: Int = -1; // TODO will have to be overwritten for already added parcels (edit screen)
    @Published var courierName: String = "";
}
