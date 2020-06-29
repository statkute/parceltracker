//
//  ParcelAttribute.swift
//  parceltracker
//
//  Created by Harry Levick on 20/06/2020.
//  Copyright © 2020 Bourn32. All rights reserved.
//

import SwiftUI

struct ParcelAttribute: View {
    @ObservedObject var selectedCourier: SelectedCourier
    @State var attrValue : String = ""
    var attrTitle : String
    var attrIcon : String
    var isCourierField: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Image(systemName: attrIcon)
                    .imageScale(.large)
                Spacer(minLength: 20)
                if(!isCourierField){
                    TextField("\(attrTitle)..", text: $attrValue)
                } else {
                    NavigationLink(destination: CourierList(selectedCourier: selectedCourier)){
                        TextField("\(attrTitle)..", text: $selectedCourier.courierName)
                            .disabled(true) // disables typing for the field
                            .foregroundColor(.primary)  // disabled prop overrides it to be the secondary (light gray)
                    }
                }
            }
            .padding()
            Divider()
            
        }
    }
}

struct ParcelAttribute_Previews: PreviewProvider {
    static var previews: some View {
        ParcelAttribute(selectedCourier: SelectedCourier(), attrTitle: "Title", attrIcon: "tag")
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
