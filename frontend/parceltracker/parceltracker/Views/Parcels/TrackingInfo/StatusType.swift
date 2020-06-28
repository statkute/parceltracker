//
//  StatusType.swift
//  parceltracker
//
//  Created by Harry Levick on 21/06/2020.
//  Copyright © 2020 Bourn32. All rights reserved.
//
import SwiftUI

enum StatusType : String, CaseIterable, Codable, Hashable {
    case signature = "signature"
    case import_scan = "import_scan"
    case warehouse_scan = "warehouse_scan"
    case none = "none"
}
