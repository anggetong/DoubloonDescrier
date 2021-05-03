//
//  UUIDList.swift
//  DoubloonDescrier
//
//  Created by Arianne Pablo on 4/29/21.
//

import Foundation
import CoreBluetooth

struct CBUUIDs {
    //let baseBLEService_UUID =
    //let baseBLEChar_UUID_Tx = "6E400002-B5A3-F393-E0A9-E50E24DCCA9E"
    //let baseBLEChar_UUID_Rx = "6E400003-B5A3-F393-E0A9-­E50E24DCCA9E"
    
    static let BLEService_UUID = CBUUID.init(string: "6E400001-B5A3-F393-E0A9-E50E24DCCA9E")
    static let BLEChar_UUID_Tx = CBUUID.init(string: "6E400002-B5A3-F393-E0A9-E50E24DCCA9E") // Write
    static let BLEChar_UUID_Rx = CBUUID.init(string: "6E400003-B5A3-F393-E0A9-E50E24DCCA9E") // Read/Notify
}
