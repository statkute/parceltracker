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
    var attrName : String
    var attrIcon : String = ""
    
    init(attributeName : String) {
        attrName = attributeName
        switch attributeName {
        case "Select a courier":
            attrIcon = "cube.box"
            break;
        case "Title":
            attrIcon = "tag"
            break;
        case "Tracking Number":
            attrIcon = "square.and.pencil"
            break;
        default:
            attrIcon = "square.and.pencil"
            break;
        }
    }
    
    var body: some View {
        
        HStack {
            Image(systemName: attrIcon)
                .imageScale(.large)
            TextField("\(attrName)..", text: $attrValue)
        }
        .padding()
        .border(Color.gray, width: 1)
    }
}

struct ParcelAttribute_Previews: PreviewProvider {
    static var previews: some View {
        ParcelAttribute(attributeName: "Title")
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
