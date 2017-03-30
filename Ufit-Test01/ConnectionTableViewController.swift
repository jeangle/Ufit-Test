//
//  ConnectionViewController.swift
//  Ufit-Test01
//
//  Created by Yuri on 2/22/17.
//  Copyright © 2017 JSD. All rights reserved.
//

import UIKit
import  CoreBluetooth

class ConnectionViewController: UITableViewController, CBCentralManagerDelegate, CBPeripheralDelegate {
    
    var manager:CBCentralManager? = nil
    var mainPeripheral:CBPeripheral? = nil
    var mainCharacteristic:CBCharacteristic? = nil
    var peripherals:[CBPeripheral] = []
    // !!! - Added var characteristic
    var characteristic:CBCharacteristic? = nil
    let BLEService = "DFB0"
    let BLECharacteristic = "DFB1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager = CBCentralManager(delegate: self, queue: nil)
        let scanController = ConnectionViewController()
        manager?.delegate = scanController
        scanController.manager = manager
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: -- Override UITableViewController Methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peripherals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scanTableCell", for: indexPath)
        let peripheral = peripherals[indexPath.row]
        cell.textLabel?.text = peripheral.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let peripheral = peripherals[indexPath.row]
        manager?.connect(peripheral, options: nil)
    }
    
    // MARK: -- CBCentralManagerDelegate Methods
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        if(!peripherals.contains(peripheral)) {
            peripherals.append(peripheral)
        }
        self.tableView.reloadData()
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        print(central.state)
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        // Pass reference to connected peripheral to 'self'
        self.mainPeripheral = peripheral
        peripheral.delegate = self
        peripheral.discoverServices(nil)
    }
    
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        print(error!)
    }
    
    // MARK: -- CBPeripheralDelegate Methods
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        for service in peripheral.services! {
            
            
            
            let message = "Service found with UUID: " + service.uuid.uuidString
            print(message)
            // !!! - Added text message ----------------------------------------------------------------------------------------------------------
            // showMessage(withMessage: message as NSString)
            // recievedMessageText.text = "Service found with UUID: " + service.uuid.uuidString
            
            // Device information service
            if (service.uuid.uuidString == "180A") {
                peripheral.discoverCharacteristics(nil, for: service)
            }
            
            // GAP (Generic Access Profile) for Device Name
            // This replaces the deprecated CBUUIDGenericAccessProfileString
            if (service.uuid.uuidString == "1800") {
                peripheral.discoverCharacteristics(nil, for: service)
            }
            
            // Bluno Service
            if (service.uuid.uuidString == BLEService) {
                peripheral.discoverCharacteristics(nil, for: service)
            }
            
        }
        
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        // "1800" is the ID for GAP (Generic Access Profile)
        if (service.uuid.uuidString == "1800") {
            
            for characteristic in service.characteristics! {
                // "2A00" is the device name characteristic
                if (characteristic.uuid.uuidString == "2A00") {
                    peripheral.readValue(for: characteristic)
                    
                    let message = "Found Device Name Characteristic"
                    print(message)
                    // !!! - Added text message ---------------------------------------------------------------------------------------------------
                    // showMessage(withMessage: message as NSString)
                    // recievedMessageText.text = "Found Device Name Characteristic"
                }
                
            }
            
        }
        // "180A" is the ID for device information service
        if (service.uuid.uuidString == "180A") {
            
            for characteristic in service.characteristics! {
                // "2A00" is the manufature name characteristic
                if (characteristic.uuid.uuidString == "2A29") {
                    peripheral.readValue(for: characteristic)
                    
                    let message = "Found a Device Manufacturer Name Characteristic"
                    print(message)
                    // !!! - Added text message ---------------------------------------------------------------------------------------------------
                    // showMessage(withMessage: message as NSString)
                    // recievedMessageText.text = "Found a Device Manufacturer Name Characteristic"
                    
                  // "2A23" is the system ID
                } else if (characteristic.uuid.uuidString == "2A23") {
                    peripheral.readValue(for: characteristic)
                    
                    let message = "Found System ID"
                    print(message)
                    // !!! - Added text message ---------------------------------------------------------------------------------------------------
                    // showMessage(withMessage: message as NSString)
                    // recievedMessageText.text = "Found System ID"
                }
                
            }
            
        }
        
        if (service.uuid.uuidString == BLEService) {
            
            for characteristic in service.characteristics! {
                
                if (characteristic.uuid.uuidString == BLECharacteristic) {
                    // We'll save the reference, we need it to write data
                    mainCharacteristic = characteristic
                    
                    // Set Notify is useful to read incoming data async
                    peripheral.setNotifyValue(true, for: characteristic)
                    
                    let message = "Found Bluno Data Characteristic"
                    print(message)
                    // !!! - Added text message ---------------------------------------------------------------------------------------------------
                    // showMessage(withMessage: message as NSString)
                    // recievedMessageText.text = "Found Bluno Data Characteristic"
                }
                
            }
            
        }
        
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        if (characteristic.uuid.uuidString == "2A00") {
            // Value for device name recieved
            let deviceName = characteristic.value
            print(deviceName ?? "No Device Name")
        } else if (characteristic.uuid.uuidString == "2A29") {
            // Value for manufacturer name recieved
            let manufacturerName = characteristic.value
            print(manufacturerName ?? "No Manufacturer Name")
        } else if (characteristic.uuid.uuidString == "2A23") {
            // Value for system ID recieved
            let systemID = characteristic.value
            print(systemID ?? "No System ID")
        } else if (characteristic.uuid.uuidString == BLECharacteristic) {
            // Data recieved
            if(characteristic.value != nil) {
                let stringValue = String(data: characteristic.value!, encoding: String.Encoding.utf8)!
                print(stringValue)
                //recievedMessageText.text = stringValue
            }
            
        }
    }
    
}
