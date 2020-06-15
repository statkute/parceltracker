//
//  Courier.swift
//  parceltracker
//
//  Created by Gintare Statkute on 2020-06-15.
//  Copyright © 2020 Bourn32. All rights reserved.
//

import Foundation
import SwiftUI

struct Courier: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var imageName: String
    // TODO will have to add more fields here, such as api, regex for the tracking number etc
}

extension Courier {
    var image: Image{
        ImageStore.shared.image(name: imageName)
    }
}
 
