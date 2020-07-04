//
//  Parcel.swift
//  Parceltracker
//
//  Created by Gintare Statkute on 2020-06-28.
//

import Foundation
import SwiftUI

struct Parcel: Hashable, Codable, Identifiable {
    var id: Int
    var label: String
    var trackingInfo: TrackingInfo
    var statusFilter: ParcelFilter
}

enum ParcelFilter: String, CaseIterable, Codable, Hashable{
    case Upcoming = "Upcoming"
    case Past = "Past"
}
