//
//  BLEManager.swift
//  DoubloonDescrier
//
//  Created by Arianne Pablo on 3/8/21.
//

import Foundation
import CoreBluetooth

struct Peripheral: Identifiable {
    let id: Int
    let name: String
    let rssi: Int
}

class BLEManager: NSObject, ObservableObject, CBCentralManagerDelegate {
    var myPeripheral: CBPeripheral!
    var myCentral: CBCentralManager!
    @Published var isSwitchedOn = false
    @Published var peripherals = [Peripheral]()
    
        override init() {
            super.init()
     
            myCentral = CBCentralManager(delegate: self, queue: nil)
            myCentral.delegate = self
        }

    // Checks if central's Bluetooth is powered on
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        // powered on, start scanning for peripherals
        if central.state == .poweredOn {
            isSwitchedOn = true
         }
         else {
            isSwitchedOn = false
         }
    }

    
    //
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        var peripheralName: String!
       
        if let name = advertisementData[CBAdvertisementDataLocalNameKey] as? String {
            peripheralName = name
        }
        else {
            peripheralName = "Unknown"
        }
       
        let newPeripheral = Peripheral(id: peripherals.count, name: peripheralName, rssi: RSSI.intValue)
        print(newPeripheral)
        peripherals.append(newPeripheral)
        
        //self.myPeripheral = peripheral
        //self.myPeripheral.delegate = self
        //self.centralManager.connect(peripheral, options: nil)
        
        
    }
    
    
    func startScanning() {
         print("startScanning")
         myCentral.scanForPeripherals(withServices: nil, options: nil)
     }
    
    func stopScanning() {
        print("stopScanning")
        myCentral.stopScan()
    }
    
    
    
}
