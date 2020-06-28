//
//  ParcelConfig.swift
//  parceltracker
//
//  Created by Harry Levick on 20/06/2020.
//  Copyright © 2020 Bourn32. All rights reserved.
//

import SwiftUI

struct ParcelConfig: View {
    enum configType {
        case add, edit
    }
    var configView : configType
    
    var body: some View {
        VStack(spacing: 0) {
            
            NavigationView {
                
                VStack {
                    ParcelAttribute(attrTitle: "Tracking Number", attrIcon: "square.and.pencil")
                    ParcelAttribute(attrTitle: "Select a courier", attrIcon: "cube.box")
                    ParcelAttribute(attrTitle: "Title", attrIcon: "tag")
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
