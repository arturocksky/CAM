//
//  ViewControllerInicio.swift
//  CAM
//
//  Created by Arturo on 8/14/18.
//  Copyright © 2018 cam. All rights reserved.
//


import UIKit

class ViewControllerInicio: UIViewController {
    
  
    @IBOutlet weak var outIniciar: UIButton!
    
    
    @IBOutlet weak var outRegistro: UIButton!
    
    
    @IBOutlet weak var outUno: UIButton!
    
  
    @IBAction func actUno(_ sender: Any) {
        if let container = self.so_containerViewController {
            container.isSideViewControllerPresented = false
        
    container.topViewController = self.storyboard?.instantiateViewController(withIdentifier: "CPPB")
        container.title = "C.P.P.B."
    }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let bytes = deviceRemainingFreeSpaceInBytes() {
            let formatter = ByteCountFormatter()
            formatter.allowedUnits = ByteCountFormatter.Units.useMB
            formatter.countStyle = ByteCountFormatter.CountStyle.decimal
            formatter.includesUnit = false
            let freeSpace = formatter.string(fromByteCount: bytes) as String
            print("free space: " + freeSpace + "Mb")
        } else {
            print("failed")
        }
    }
    var totalSpaceInBytes: CLongLong = 0; // total disk space
    var totalFreeSpaceInBytes: CLongLong = 0; //total free space in bytes
    
    func deviceRemainingFreeSpaceInBytes() -> Int64? {
        
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last!
        guard
            let systemAttributes = try? FileManager.default.attributesOfFileSystem(forPath: documentDirectory),
            let freeSize = systemAttributes[.systemFreeSize] as? NSNumber
            else {
                // something failed
                return nil
        }
        return freeSize.int64Value
    }
    /*
     func getTotalDiskSpace() -> String { //get total disk space
     do{
     let space: CLongLong = try FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory())[FileAttributeKey.systemSize] as! CLongLong; //Check for home dirctory and get total system size
     totalSpaceInBytes = space; // set as total space
     return memoryFormatter(space: space); // send the total bytes to formatter method and return the output
     
     }catch let error{ // Catch error that may be thrown by FileManager
     print("Error is ", error);
     }
     return "Error while getting memory size";
     }
     
     func getTotalFreeSpace() -> String{ //Get total free space
     do{
     let space: CLongLong = try FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory())[FileAttributeKey.systemFreeSize] as! CLongLong;
     totalFreeSpaceInBytes = space;
     return memoryFormatter(space: space);
     
     }catch let error{
     print("Error is ", error);
     }
     return "Error while getting memory size";
     }
     */
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
