//
//  Peripheral_BLEManager.swift
//  DoubloonDescrier
//
//  Created by Arianne Pablo on 4/29/21.
//

import Foundation
import CoreBluetooth

extension BLEManager: CBPeripheralManagerDelegate {
    // Discovered Services
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        if ((error) != nil) {
            print("Error Discovering Services: \(error!.localizedDescription)")
            return
        }
        
        guard let services = peripheral.services else {
            return
        }
        
        // Discover all characteristics
        for service in services {
            peripheral.discoverCharacteristics(nil, for: service)
        }
        
        print("Discovered Services: \(services)")
    }
    
    
    // Discovered Characteristics
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        guard let characteristics = service.characteristics else {
            return
        }
        
        print("Found \(characteristics.count) characteristics.")
        
        for characteristic in characteristics {
            //print("Discovered Characteristics: \(characteristic)")
            
            if characteristic.uuid.isEqual(CBUUIDs.BLEChar_UUID_Rx) {
                RxChar = characteristic
               
                peripheral.setNotifyValue(true, for: RxChar!)
                peripheral.readValue(for: characteristic)
                
                print("Rx Characteristic: \(RxChar.uuid)")
            }
            
            if characteristic.uuid.isEqual(CBUUIDs.BLEChar_UUID_Tx) {
                TxChar = characteristic
                
                peripheral.setNotifyValue(true, for: TxChar!)
                peripheral.readValue(for: characteristic)
                
                print("Tx Characteristic: \(TxChar.uuid)")
            }
        }
    }
    
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        switch peripheral.state {
            case .poweredOn:
                print("Peripheral Is Powered On.")
            case .unsupported:
                print("Peripheral Is Unsupported.")
            case .unauthorized:
            print("Peripheral Is Unauthorized.")
            case .unknown:
                print("Peripheral Unknown")
            case .resetting:
                print("Peripheral Resetting")
            case .poweredOff:
              print("Peripheral Is Powered Off.")
            @unknown default:
              print("Error")
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        
        var charIntVal = NSString()
        
        guard characteristic == RxChar,
              let charVal = characteristic.value,
              let intVal = NSString(data: charVal, encoding: String.Encoding.utf8.rawValue)
              else { return }
        
        charIntVal = intVal
        print("Value Recieved: \((charIntVal as String))")
        
        self.objectsFound = charIntVal as String
    }
    
}
