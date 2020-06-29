//
//  TrackingInfo.swift
//  Parceltracker
//
//  Created by Harry Levick on 28/06/2020.
//

struct TrackingInfo: Hashable, Codable, Identifiable {
    var id: Int
    var delivered: Bool
    var courier: Courier
    var trackingNumber: String
    var trackingInfo: [Status]
}
