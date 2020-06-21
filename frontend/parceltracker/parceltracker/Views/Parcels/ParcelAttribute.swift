//
//  ParcelAttribute.swift
//  parceltracker
//
//  Created by Harry Levick on 20/06/2020.
//  Copyright © 2020 Bourn32. All rights reserved.
//

import SwiftUI

struct ParcelAttribute: View {
    @State var attrValue : String = ""
    var attrTitle : String
    var attrIcon : String
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Image(systemName: attrIcon)
                    .imageScale(.large)
                Spacer(minLength: 20)
                TextField("\(attrTitle)..", text: $attrValue)
            }
            .padding()
            Divider()
            
        }
        //.border(Color.gray, width: 1)
    }
}

struct ParcelAttribute_Previews: PreviewProvider {
    static var previews: some View {
        ParcelAttribute(attrTitle: "Title", attrIcon: "tag")
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
