//
//  BLEManager.swift
//  DoubloonDescrier
//
//  Created by Arianne Pablo on 3/8/21.
//

import Foundation
import CoreBluetooth    // Apple's Bluetooth Library

// Peripheral definition
struct Peripheral: Identifiable {
    let id: Int
    let name: String
    let rssi: Int
}

// Bluetooth Manager Class
class BLEManager: NSObject, ObservableObject, CBCentralManagerDelegate, CBPeripheralDelegate {
    var adafruitBLE: CBPeripheral!          // peripheral     (ie. Adafruit BLE)
    var centralDevice: CBCentralManager!    // central device (ie. iPhone)
    var TxChar: CBCharacteristic!   // Transmitting Characteristic
    var RxChar: CBCharacteristic!   // Receiver Characteristic
    
    @Published var isSwitchedOn = false     // used to display central's BLE power state
    @Published var connected = false        // used to display if connected to peripheral
    @Published var objectsFound = "0"
    
    //@Published var peripherals = [Peripheral]()     // arrays to store all the peripherals found
    
    // initializes the central device
    override init() {
        super.init()
 
        centralDevice = CBCentralManager(delegate: self, queue: nil)
        //myCentral.delegate = self
    }

    
    // Checks if central's Bluetooth is powered on
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        // BT powered on, start scanning for peripherals
        if central.state == .poweredOn {
            isSwitchedOn = true
            
            // start scanning for peripherals
            central.scanForPeripherals(withServices: [CBUUIDs.BLEService_UUID])
            print("Scanning...")
         }
        // BT not powered on/something else wrong
        else {
            isSwitchedOn = false
        }
    }
    
    
    // scan resulted in discovering peripherals
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        guard peripheral.name != nil else {return}
        
        // checks if peripheral name matches the Adafruit BLE
        if peripheral.name! == "Adafruit Bluefruit LE" {
            print("Adafruit Bluefruit found!")
            
            // stop scanning once found
            centralDevice?.stopScan()
            
            // set peripheral and connect to Adafruit BLE
            self.adafruitBLE = peripheral
            self.adafruitBLE.delegate = self
            self.centralDevice?.connect(peripheral, options: nil)   // reconnect if disconnected
        }
        
        /*var peripheralName: String!
        
        if let name = advertisementData[CBAdvertisementDataLocalNameKey] as? String {
            peripheralName = name
        }
        else {
            peripheralName = "Unknown"
        }
       
        let newPeripheral = Peripheral(id: peripherals.count, name: peripheralName, rssi: RSSI.intValue)
        print(newPeripheral)
        peripherals.append(newPeripheral)
        */
        //self.myPeripheral = peripheral
        //self.myPeripheral.delegate = self
        //self.centralManager.connect(peripheral, options: nil)
        
        
    }
    
    
    // connection to peripheral successful
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        self.connected = true   // set connected variable
        print("Connected")
        
        // display info of services
        peripheral.discoverServices([CBUUIDs.BLEService_UUID])
        peripheral.delegate = self
    }
    
    
    // disconnected to peripheral
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        self.connected = false
        print("Disconnected")
        
        // scan for peripherals in attempts to reconnect
        self.centralDevice?.scanForPeripherals(withServices: [CBUUIDs.BLEService_UUID])
    }
    
    
    
    
    
    
    /*
    func startScanning() {
         print("startScanning")
         myCentral.scanForPeripherals(withServices: nil, options: nil)
     }
    
    func stopScanning() {
        print("stopScanning")
        myCentral.stopScan()
    }*/
    
    
    
}
