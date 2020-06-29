//
//  Status.swift
//  parceltracker
//
//  Created by Harry Levick on 23/06/2020.
//  Copyright © 2020 Bourn32. All rights reserved.
//

struct Status: Hashable, Codable, Identifiable {
    var id: Int
    var header : String?
    var date : String?
    var time : String?
    var location : String?
    var statusType : StatusType?
    
    enum StatusType : String, CaseIterable, Codable, Hashable {
        case signature = "Signature"
        case import_scan = "Import Scan"
        case warehouse_scan = "Warehouse Scan"
    }
}
